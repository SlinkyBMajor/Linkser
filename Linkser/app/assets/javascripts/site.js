var myApp = angular.module('linkser', ['ngResource', 'ngRoute']);

myApp.factory("Site", function ($resource) {
    return $resource("/api/site/:id", {id: "@id"},
        {
            'index': {method: 'GET', isArray: true},
            'add': {method: 'POST'},
            'show': {method: 'GET'}
        }
    );
});

myApp.controller('SiteController',
    function ($scope, Site) {
        $scope.greeting = 'hola!';

        getSites = function(){
            $scope.sites = Site.query(function () {
                console.log($scope.sites);

                angular.forEach($scope.sites, function (site) {
                    site.tags = JSON.parse(site.tags);
                });

            }); //query() returns all the entries
        };

        getSites();


        $scope.addSite = function () {
            console.log($scope);
            $scope.site = new Site();
            $scope.site.name = $scope.name;
            $scope.site.url = $scope.url;
            $scope.site.description = $scope.description;
            Site.add($scope.site);

            getSites();

        };

    }
);