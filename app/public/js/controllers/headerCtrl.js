'use strict';

var HeaderCtrl = function($scope) {

	var didScroll = false;
	var changeHeaderOn = 300;  // the value of height to change the navbar

	var scrollPage = function() {
		var sy = scrollY();
		if ( sy >= changeHeaderOn ) {
			$scope.$apply(function () {
				$scope.navBarOverrides.push('navbar-shrink');
		    });
		} else {
			$scope.$apply(function () {
				$scope.navBarOverrides.pop('navbar-shrink');
		    });
		}
		didScroll = false;
	};

	var scrollY = function() {
		return window.pageYOffset || document.documentElement.scrollTop;
	};

	window.addEventListener( 'scroll', function( event ) {
		if( !didScroll ) {
			didScroll = true;
			setTimeout( scrollPage, 250 );
		}
	}, false );

	$scope.navbarCollapsed = true;
	$scope.navBarOverrides = [];

	$scope.test = function() {
		console.log("hello");
	};

	$scope.hideToggle = function() {
		$scope.navbarCollapsed = true;
	};
};

module.exports = HeaderCtrl;

