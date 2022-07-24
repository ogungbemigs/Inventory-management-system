<?php
	ob_start();
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	//header('Content-Type:application/json');
	//echo "<script>alert('test')<script>";
	
	// Execute the script if the POST request is submitted
	if(isset($_POST['deviceCode'])){
		
		//echo "here";
		$device_code = htmlentities($_POST['deviceCode']);
		
		$itemDetailsSql = 'SELECT * FROM item WHERE device_code = :device_code';
		$itemDetailsStatement = $conn->prepare($itemDetailsSql);
		$itemDetailsStatement->execute(['device_code' => $device_code]);
		
		// If data is found for the given item number, return it as a json object
		if($itemDetailsStatement->rowCount() > 0) {
			$row = $itemDetailsStatement->fetch(PDO::FETCH_ASSOC);
			ob_end_clean();
			echo json_encode($row);
			//echo "<script>alert($row)<script>";
		}
		$itemDetailsStatement->closeCursor();
	}
?>