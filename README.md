

<p align="center">
    <img srcset="https://storage.downfall24.com/supplant/logo.jpg 1x, https://storage.downfall24.com/supplant/logo2x.jpg 2x"src="https://storage.downfall24.com/supplant/logo.jpg" alt="logo" />
</p>

<p align="center">
<h1 style="text-align:center">Supplant</h1>
</p>


```
 to take the place of and serve as a substitute for especially by reason of superior excellence or power
```


A command line application allowing for the replacement of personally identifiable information from database dumps. Designed for scenerios when using production e-commerce databases on local and staging environments where you want to simulate the production environment but without the real customer data.

## Getting started

A demonstration config file and database dump is provided by default, based on a slice of a production Magento 2 database, simply clone the repository and run the following and you should see the results:

```sh
npm i
node index.js
```

## Release History

* 0.0.1
    * Initial working version that works on Magento 2 database dumps, the application can only do one table at the time currently due to a requirement with the async on the line replacement code, will be fixed in next version.