<?php
$json = file_get_contents('php://input');
$data = json_decode($json);

$file = $data->file;
`echo $file > watch`;
