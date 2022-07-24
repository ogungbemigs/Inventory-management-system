<?php
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	
	$device_code = htmlentities($_POST['deviceCode']);
	
	if(isset($_POST['deviceCode'])){
		
		// Check if mandatory fields are not empty
		if(!empty($device_code)){
			
			// Sanitize item number
			$device_code = filter_var($device_code, FILTER_SANITIZE_STRING);

			// Check if the item is in the database
			$itemSql = 'SELECT device_code FROM item WHERE device_code=:device_code';
			$itemStatement = $conn->prepare($itemSql);
			$itemStatement->execute(['device_code' => $device_code]);
			
			if($itemStatement->rowCount() > 0){
				
				// Item exists in DB. Hence start the DELETE process
				$deleteItemSql = 'DELETE FROM item WHERE device_code=:device_code';
				$deleteItemStatement = $conn->prepare($deleteItemSql);
				$deleteItemStatement->execute(['device_code' => $device_code]);

				echo '<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>Item deleted.</div>';
				exit();
				
			} else {
				// Item does not exist, therefore, tell the user that he can't delete that item 
				echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Item does not exist in DB. Therefore, can\'t delete.</div>';
				exit();
			}
			
		} else {
			// Item number is empty. Therefore, display the error message
			echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter the item number</div>';
			exit();
		}
	}
?>