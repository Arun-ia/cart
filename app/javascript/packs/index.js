var app = angular.module("cart-app",[]);
app.controller('productController',function($scope){
    $scope.display = function(name){
        $scope.message = "Hii there! AngularJs linked with rails";
    }
});