<?php
/**
 * Created by IntelliJ IDEA.
 * User: sofos
 * Date: 17/08/16
 * Time: 17.26
 */


$username="root";
$password="";
$database="ls_observation";
$db = new mysqli('127.0.0.1', $username, $password, $database,3306);
$db->set_charset("utf8");


$debug = true;
function fail($pub, $pvt = '')
{
    global $debug;
    $msg = $pub;
    if ($debug && $pvt !== '')
        $msg .= ": $pvt";
    /* The $pvt debugging messages may contain characters that would need to be
     * quoted if we were producing HTML output, like we would be in a real app,
     * but we're using text/plain here.  Also, $debug is meant to be disabled on
     * a "production install" to avoid leaking server setup details. */
    exit("An error occurred ($msg).\n");
}