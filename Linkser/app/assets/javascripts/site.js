
var myApp = angular.module('linkser', []);

myApp.factory("Site", function($resource) {
    return $resource("/site/list/:id", { id: "@id" },
        {
            'list':  { method: 'GET' }
        }
    );
});

myApp.controller('SiteController', ['$scope', function ($scope) {
    $scope.greeting = 'hola!';

    $scope.sites = $resource('/user/:userId', {userId:'@id'});

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

}]);