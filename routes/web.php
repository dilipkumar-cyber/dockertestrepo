<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/health', function () {
    return response()->json(['status' => 'OK']);
});

Route::get('/students', function () {
    return \App\Models\Student::all();
});