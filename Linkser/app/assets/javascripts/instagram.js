var myApp = angular.module('linkser', ['ngResource', 'ngRoute']);


myApp.factory("Instagram", function ($resource) {
    return $resource("/api/instagram/:id", {id: "@id"},
        {
            'index': {method: 'GET', isArray: true},
            'add': {method: 'POST'},
            'show': {method: 'GET'},
            'destroy': {method: 'DELETE'}
        }
    );
});

myApp.controller('InstaController',
    function ($scope, Instagram) {
        getInstagrams = function () {
            $scope.instagrams = Instagram.query(function () {
                console.log($scope.instagrams);
            }); //query() returns all the entries
        };

        getInstagrams();

        $scope.addInsta = function () {
            console.log($scope);
            $scope.insta = new Instagram();
            $scope.insta.name = $scope.name;
            $scope.insta.tags = $scope.tags;
            $scope.insta.url = $scope.url;
            $scope.insta.category = $scope.category;
            $scope.insta.content_type = $scope.content_type;
            $scope.insta.description = $scope.description;
            Instagram.add($scope.insta);
            getInstagrams();

        };

    }
);
