<?php
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	
	if(isset($_POST['id'])){
		
		$productID = htmlentities($_POST['id']);
		
			
		$defaultImgFolder = 'data/item_images/';
		
		// Get all item details
		$sql = 'SELECT * FROM item WHERE productID = :productID';
		$stmt = $conn->prepare($sql);
		$stmt->execute(['productID' => $productID]);
		
		while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
			$output = '<p><img src="';
		
			if($row['imageURL'] === '' || $row['imageURL'] === 'imageNotAvailable.jpg'){
				$output .= 'data/item_images/imageNotAvailable.jpg" class="img-fluid"></p>';
			} else {
				$output .= 'data/item_images/' . $row['device_code'] . '/' . $row['imageURL'] . '" class="img-fluid"></p>';
			}
						
			$output .= '<span><strong>Name:</strong> ' . $row['staff_name'] . '</span><br>';
			$output .= '<span><strong>Department:</strong> ' . $row['dept'] . '</span><br>';
			$output .= '<span><strong>Device Type:</strong> ' . $row['device_type'] . ' </span><br>';
			$output .= '<span><strong>Windows License:</strong> ' . $row['os_status'] . '</span><br>';
		}
		
		echo $output;
	}
?>