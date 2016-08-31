var myApp = angular.module('linkser', ['ngResource', 'ngRoute']);

myApp.factory("Site", function ($resource) {
    return $resource("/api/site/:func/:id", {func: "@func", id: "@id" },
        {
            'add': {method: 'POST'},
            'show': {method: 'GET'},
            'destroy': {method: 'DELETE'},
            'search': {method: 'GET', isArray: true},
            'visit': {method: 'GET', params:{func:"visit", id: "@id"}}
        }
    );
});

myApp.controller('SiteController',
    function ($scope, Site) {
        getSites = function () {
            $scope.sites = Site.query(function () {
                console.log($scope.sites);
                fixTags();
            }); //query() returns all the entries
        };


        fixTags = function () {
            angular.forEach($scope.sites, function (site) {
                site.tags = site.tags.split(',');
            });
        };

        getSites();

        $scope.tagSearch = function () {
            $scope.sites = Site.search({tag: $scope.tags}, function () {
                console.log($scope.sites);
                fixTags();
            });
        };

        $scope.addSite = function () {
            console.log($scope);
            $scope.site = new Site();
            $scope.site.name = $scope.name;
            $scope.site.tags = $scope.tags;
            $scope.site.url = $scope.url;
            $scope.site.category = $scope.category;
            $scope.site.content_type = $scope.content_type;
            $scope.site.description = $scope.description;
            Site.add($scope.site);
            getSites();

        };

        $scope.removeSite = function (site_id) {
            console.log(site_id);
            Site.destroy({id: site_id});
            getSites();
        };

        $scope.openlink = function (id) {
            Site.visit({id: id});
            $scope.site = Site.get({id: id});
            console.log($scope.site);
            $scope.site.times_visited = $scope.site.times_visited + 1;
            getSites();
            //$window.open('https://www.google.com', '_blank');
        };

    }
);