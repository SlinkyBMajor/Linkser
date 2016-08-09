var myApp = angular.module('linkser', ["ngResource"]);

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


        $scope.sites = Site.query(function () {
            console.log(sites);
        }); //query() returns all the entries


        $scope.addSite = function () {
            $.ajax({
                    method: "POST",
                    url: "site/add",
                    data: {name: "John", location: "Boston"}
                })
                .done(function (data) {
                    console.log(data);
                });
        };

    }
);