<?php

require_once __DIR__ . '/config.php';

class API
{
    function index()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $db = new Connect;

            $users = array();

            $data =  json_decode(file_get_contents('php://input'));

            $name = $data->name;
            $last_name = $data->last_name;


            $data = $db->prepare("INSERT INTO users (name, last_name) values (?, ?)");
            $data->execute([$name, $last_name]);


            $result = $db->prepare("SELECT * FROM users");
            $result->execute();


            while ($OutputData = $result->fetch(PDO::FETCH_ASSOC)) {
                $users[] = array(
                    'id'        =>  $OutputData['id'],
                    'name'      =>  $OutputData['name'],
                    'last_name' =>  $OutputData['last_name']
                );
            }
            return json_encode($users);
        }else{
            $db = new Connect;

            $users = array();


            $result = $db->prepare("SELECT * FROM users");
            $result->execute();
            while ($OutputData = $result->fetch(PDO::FETCH_ASSOC)) {
                $users[] = array(
                    'id'        =>  $OutputData['id'],
                    'name'      =>  $OutputData['name'],
                    'last_name' =>  $OutputData['last_name']
                );
            }
            return json_encode($users);
        }
    }

}

$API = new API;
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE');


echo $API->index();