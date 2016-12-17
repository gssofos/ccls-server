<?php
/**
 * Created by IntelliJ IDEA.
 * User: sofos
 * Date: 07/09/16
 * Time: 21:29
 */

include './cred.php';

$query = "SELECT * FROM LS_Process";
($stmt = $db->prepare($query))		|| 		fail('MySQL prepare', $db->error);
//$c=$_GET['id'];
//$stmt->bind_param('s', $c)		|| 		fail('MySQL bind_param', $db->error);
$stmt->execute();
//$stmt->bind_result($e)|| 		fail('MySQL bind_result', $db->error);
$e=$stmt->get_result()->fetch_all(1);
$stmt->close();
$db->close();
foreach($e as $v){
    $id = $v['setPointCode'];
    $c = file_get_contents('http://127.0.0.1/phd/batch/createsensorxml.php?id=' . $id);
    file_put_contents('./sensor/' . $id . '.xml',$c);
}
