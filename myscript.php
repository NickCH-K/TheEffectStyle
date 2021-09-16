<?php
if(isset($_GET['param'])){
    $searchString = $_GET['param'];
    $files = glob('*.html');
    $result_title = [];
    foreach ($files as $file) {
        $html = file_get_contents($file);
        $d = new DOMDocument;
        $mock = new DOMDocument;
        @$d->loadHTML($html);
        $body = $d->getElementsByTagName('body');
        $title = $d->getElementsByTagName('title')->item(0)->textContent;
        $mainSearchText = $d->getElementById('jv-search')->textContent;
        if (preg_match("/{$searchString}/i", $mainSearchText)) {
            array_push($result_title, ["title"=>$title, "url"=>$file]);
        }
    }
    if(count($result_title) > 0){
        echo json_encode($result_title);
    }else{
        echo http_response_code(404);
    }    
}
?>





