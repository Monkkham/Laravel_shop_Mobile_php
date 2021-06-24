<?php

Route::group(['namespace' => 'Botble\Ecommerce\Http\Controllers\Fronts', 'middleware' => 'web'], function () {
    Route::group(['prefix' => 'payment'], function () {
        Route::get('status', 'PublicCheckoutController@getPayPalStatus')->name('public.payment.paypal.status');
    });
});
