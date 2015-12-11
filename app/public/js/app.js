'use strict';

var angular = require('angular');
var ui_router = require('angular-ui-router');
var ui_bootstrap = require('angular-ui-bootstrap');

var HeaderCtrl = require('./controllers/headerCtrl');

var app = angular.module('menu-app', [ui_router, ui_bootstrap]);



app.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/');

    $stateProvider.state('app', {
        url: '/',
        views: {
            'header': {
                templateUrl: 'views/header.html',
                controller: 'HeaderCtrl'
            },
            'content': {
                templateUrl: 'views/home.html'
            },
            'footer': {
                templateUrl: 'views/footer.html'
            }
        }
    });
});

app.controller('HeaderCtrl', ['$scope', HeaderCtrl]);
