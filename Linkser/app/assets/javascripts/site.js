var myApp = angular.module('linkser', ['ngResource', 'ngRoute']);

myApp.factory("Site", function ($resource) {
    return $resource("/api/site/:id", {id: "@id"},
        {
            'index': {method: 'GET', isArray: true},
            'add': {method: 'POST'},
            'show': {method: 'GET'},
            'destroy': {method: 'DELETE'},
            'tag_search': {method: 'GET', isArray: true}
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
                console.log('Test');
                console.log(site.tags.length);
                site.tags = site.tags.split(',');
                console.log(site.tags);
            });
        };

        getSites();

        $scope.tagSearch = function () {
            $scope.sites = Site.tag_search({tag: $scope.tags}, function () {
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

        $scope.openlink = function (id, url) {
            $window.open('https://www.google.com', '_blank');
        };

    }
);