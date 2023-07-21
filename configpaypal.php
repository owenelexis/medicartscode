<?php
require_once "vendor/autoload.php";

use Omnipay\Omnipay;

define('CLIENT_ID', 'AfSnDcUBQP2iNPMoCKedhDDg1i-lcxir_uUEqPOleKKjH4D34Ip6v80wLQXbyEqXRN0531WOkvbj05h6');
define('CLIENT_SECRET', 'EPv0o3TEjZk3EzEUKoQrva36Mc3QubvCyK3-bFxpTeYAk8E0m8IAAYyd7Nz-KxQLwdmO_Q9WMry76Yo3');

define('PAYPAL_RETURN_URL', 'http://localhost/Omos/success.php');
define('PAYPAL_CANCEL_URL', 'http://localhost/Omos/cancel.php');
define('PAYPAL_CURRENCY', 'USD'); // set your currency here

// Connect with the database
$db = new mysqli('localhost', 'root', '', 'omos_db'); 

if ($db->connect_errno) {
    die("Connect failed: ". $db->connect_error);
}

$gateway = Omnipay::create('PayPal_Rest');
$gateway->setClientId(CLIENT_ID);
$gateway->setSecret(CLIENT_SECRET);
$gateway->setTestMode(true); //set it to 'false' when go live