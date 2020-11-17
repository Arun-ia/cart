angular.module("cartservice",[]).controller( 'productController' , function($scope, $http) {
	$scope.products = [];
	$scope.cart = [];
	$scope.no = 0;


	$http.get('products.json').then(function(response) {
		$scope.products = response.data;

	 });


	$scope.add2cart = function(product) {
		if($scope.exist(product) == -1){
			$scope.cart.push(angular.copy(product));
			$scope.cart[$scope.cart.length-1].quantity = 1;
		}
		else{
			window.alert("Product exists");
		}
	}
		
	$scope.exist = function(product) {
		temp = -1;
		console.log(product);
		angular.forEach($scope.cart,function(value,index){
			console.log(value.id,product.id)
			if(value.id == product.id){
				temp = index;
			}
		});
		return temp;
	}
	
	$scope.delfromcart = function(cartitem) {
		$scope.cart.splice($scope.cart.indexOf(cartitem),1);

	}
	$scope.checkavail = function(cartitem) {
		if(cartitem.quantity>cartitem.availablity)
		{
			window.alert("Maximum Reached");
			$scope.cart[$scope.cart.indexOf(cartitem)].quantity = cartitem.availablity;
		} 
		else if(cartitem.quantity<1){
			window.alert("Minimum 1 Reqd");
			$scope.cart[$scope.cart.indexOf(cartitem)].quantity = 1;
		}
		
	}
	
	$scope.incq = function(cartitem) {
		if(cartitem.quantity<cartitem.availablity){
			$scope.cart[$scope.cart.indexOf(cartitem)].quantity++ ;
		}
		else{
			window.alert("Maximum Reached");
		}
	}
	$scope.decq = function(cartitem) {
		if(cartitem.quantity>1){
			$scope.cart[$scope.cart.indexOf(cartitem)].quantity-- ;
		}
		else{
			window.alert("Minimum 1 Reqd");
		}
	}
	
	$scope.tot_amount = function(){
		var sum=0;
		for(var i=0;i<$scope.cart.length;i++)
		{
			sum = sum + ( $scope.cart[i].cost * $scope.cart[i].quantity );
		}
		return sum;
	}
});