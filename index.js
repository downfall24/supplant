

const chalk = require('chalk');
const clear = require('clear');
const figlet = require('figlet');
const fs = require('fs');
const faker = require('faker/locale/en_GB');
const path = require('path');
const lineReader = require('line-reader');
const lineReplace = require('line-replace')

const verbose = false;

clear();

console.log(
  chalk.white(
    figlet.textSync("Supplant", { horizontalLayout: "full" })
  )
);

var configDirectory = "./config/";
var dumpDirectory = "./dumps/";

// Loop through all the configuration files in the 'config' folder and check we have corresponding sql dump
fs.readdir(configDirectory, function (err, files) {

  if (err) {
    console.error("Could not access the config directory.", err);
    process.exit(1);
  }

  files.forEach(function (file, index) {
    console.log("Running configuration file: " + file);

    var dumpFile = path.join(dumpDirectory, file.replace("json", "sql"));

    if (fs.existsSync(dumpFile)) {
      var dbConfiguration = path.join(configDirectory, file);

      let configData = fs.readFileSync(dbConfiguration);
      let tableConfig = JSON.parse(configData);
      let tables = tableConfig.tables;

      for(var table in tables) {

        // Find relevant insert statement in dump file

        console.log("== Scanning for data to replace ins table: '" + table + "'");

        var line_number = 0;

        lineReader.eachLine(dumpFile, function(line, last) {
          
          line_number = line_number + 1;
          var pattern = "INSERT INTO `" + table + "` VALUES ";

          if (line.match(pattern)) {

            var tempInsert = line.replace(pattern, "");
            var newInsert = "";

            let result = tempInsert.match(/\(.*?\)/g);

            // Loop through the data to be inserted in SQL statement so we can start to replace the data specified in the relevant config file

            result.forEach(function (value) {

              var thisValue = value;
              var originalValue = value;

              thisValue = thisValue.substring(1, thisValue.length-1);
              thisValue = thisValue.split(",");

              originalValue = originalValue.substring(1, originalValue.length-1);
              originalValue = originalValue.split(",");
            
              var table_entities = tables[table].entities;

              for (const [entity_id, content_type] of Object.entries(table_entities)) {
          
                if(thisValue[tables[table].entity_index] == entity_id) {

                  var replacement_value

                  switch (content_type) {
                    case "title":
                      replacement_value = faker.name.prefix()
                      break;
                    case "firstname":
                      replacement_value = faker.name.firstName()
                      break;
                    case "lastname":
                      replacement_value = faker.name.lastName()
                      break;
                    case "fullname":
                      replacement_value = faker.name.findName()
                      break;
                    case "full_address":
                      replacement_value = faker.address.streetAddress()
                    break;
                    case "city":
                      replacement_value = faker.address.city()
                    break;
                    case "county":
                      replacement_value = faker.address.county()
                    break;
                    case "postcode":
                      replacement_value = faker.address.zipCode()
                    break;
                    case "phonenumber":
                      replacement_value = faker.phone.phoneNumber()
                    break;
                    case "email":
                      replacement_value = faker.internet.email()
                    break;
                    
                  }

                  if (replacement_value) {
                    thisValue[tables[table].value_index] = "'" + replacement_value + "'"
                    if(verbose) {
                      console.log(originalValue[tables[table].value_index] +  chalk.green(" => ") + thisValue[tables[table].value_index]);
                    }
                  }
                }
              }
              newInsert += "(" + thisValue + "),";
            });

            // Now lets rebuild the complete string and replace the insert statement in the dump

            newInsert = pattern + newInsert.substring(0, newInsert.length - 1) + ";";

            if (fs.existsSync(dumpFile)) {
              lineReplace({
                file: dumpFile,
                line: line_number,
                text: newInsert,
                addNewLine: true,
                callback: function() {
                  console.log(chalk.green("== Insert data supplanted for table: '" + table + "' =="));
                }
              })
            }
          
          }

        });

      }

    } else {
      console.log(
        chalk.red("Corresponding dump file could not be found.")
      );
    }

  });

});

