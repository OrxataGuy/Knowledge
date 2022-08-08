<?php
    // ...

    $token = $_POST['token']; // The token that has submitted the form and we have written in the script on the frontend side.
    $secret = 'YOUR_SECRET_KEY'; // The secret code that generates the token to the google web for the captcha.
    $url = 'https://www.google.com/recaptcha/api/siteverify'; // Captcha challenge website.

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('secret' => $secret, 'response' => $token)));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    if ($response == false) 
        die (curl_error($ch));
    curl_close($ch);
    $arrResponse = json_decode($response, true);
    
    if( $arrResponse['success'] == '1'    // If the query has been carried out without problems...
            &&  $arrResponse["action"] == 'ACTION' // ...had the right action...
            && $arrResponse["score"] >= 0.5 // ...and has obtained a grade greater than 0.5 (minimum 0 maximum 1).
        ){
            /** Here you must enter the code that must be executed if the challenge passes. */
            
            // print_r("I've passed!!");
        } else {
            // die("I've failed...");
        }
?>
