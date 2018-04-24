# BNB Nginx Cache

A Rancher catalog build of BNB's [nginx-cache](https://github.com/brandnewbox/nginx-cache) container.

This is a barebones implementation and much more can be configured via environment variables.

Check out the [BNB repo](https://github.com/brandnewbox/nginx-cache) for a full list of said environment variable options.

If you would like to purge all contents from the cache: set the `CACHE_INACTIVE` environment variable to `10ms` then return it to whatever value it was before. From the documentation:

> `inactive` specifies how long an item can remain in the cache without being accessed. In this example, a file that has not been requested for 60 minutes is automatically deleted from the cache by the cache manager process, regardless of whether or not it has expired. The default value is 10 minutes (10m).
