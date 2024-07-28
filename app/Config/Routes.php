<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('/dashboard', 'Home::index');
$routes->get('/ganti-password', 'Users::ganti_password');
$routes->post('/ganti-password', 'Users::ganti_password');

$routes->group('bidang-studi', function ($routes) {
    $routes->get('', 'BidangStudi::index');
    $routes->get('tambah', 'BidangStudi::tambah');
    $routes->get('ubah/(:segment)', 'BidangStudi::ubah/$1');
    $routes->post('simpan', 'BidangStudi::simpan');
    $routes->get('hapus/(:segment)', 'BidangStudi::hapus/$1');
});

// TUGAS AKHIR
$routes->group('tugas-akhir', static function ($routes) {
    $routes->get('', 'TugasAkhir::index');
    $routes->get('create', 'TugasAkhir::create');
    $routes->post('store', 'TugasAkhir::store');
    $routes->get('edit/(:segment)', 'TugasAkhir::edit/$1');
    $routes->post('update/(:segment)', 'TugasAkhir::update/$1');
    $routes->get('delete/(:segment)', 'TugasAkhir::delete/$1');
});




$routes->group('algo', static function ($routes) {
    $routes->get('', 'KmeansController::index');
    $routes->get('proses', 'KmeansController::proses');
    $routes->get('proses/(:segment)', 'KmeansController::proses/$1');
});

// PENGGUNA
// $routes->group('users', static function ($routes) {
//     $routes->get('', 'Users::index');
//     $routes->post('set-aktifasi', 'Users::set_aktifasi', ['filter' => ['group:admin']]);
//     $routes->get('tambah', 'Users::tambah');
//     $routes->post('simpan', 'Users::simpan', ['filter' => ['group:admin']]);
// });


service('auth')->routes($routes);
