<?php
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	
	$initialStock = 0;
	$baseImageFolder = '../../data/item_images/';
	$itemImageFolder = '';
	
	if(isset($_POST['deviceCode'])){
		
		$device_code = htmlentities($_POST['deviceCode']);
		$staff_name = htmlentities($_POST['staffName']);
		$office = htmlentities($_POST['office']);
		$department = htmlentities($_POST['department']);
		$device_type = htmlentities($_POST['deviceType']);
		$device_ram = htmlentities($_POST['deviceRam']);
		$device_storage = htmlentities($_POST['deviceStorage']);
		$os = htmlentities($_POST['os']);
		$os_status = htmlentities($_POST['osStatus']);
		$mac_address = htmlentities($_POST['macAddress']);
		$eset_status= htmlentities($_POST['esetStatus']);
		$ad_status = htmlentities($_POST['activeDirectory']);
		$printer = htmlentities($_POST['printer']);
		$scanner = htmlentities($_POST['scanner']);
		$status = htmlentities($_POST['itemDetailsStatus']);
		
		
		// Check if mandatory fields are not empty
		 if(!empty($device_code) && !empty($staff_name) && isset($mac_address) && isset($os_status)){
			
			// Sanitize item number
			/* $itemNumber = filter_var($itemNumber, FILTER_SANITIZE_STRING);
			
			// Validate item quantity. It has to be a number
			if(filter_var($quantity, FILTER_VALIDATE_INT) === 0 || filter_var($quantity, FILTER_VALIDATE_INT)){
				// Valid quantity
			} else {
				// Quantity is not a valid number
				echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter a valid number for quantity</div>';
				exit();
			}
			
			// Validate unit price. It has to be a number or floating point value
			if(filter_var($unitPrice, FILTER_VALIDATE_FLOAT) === 0.0 || filter_var($unitPrice, FILTER_VALIDATE_FLOAT)){
				// Valid float (unit price)
			} else {
				// Unit price is not a valid number
				echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter a valid number for unit price</div>';
				exit();
			}
			
			// Validate discount only if it's provided
			if(!empty($discount)){
				if(filter_var($discount, FILTER_VALIDATE_FLOAT) === false){
					// Discount is not a valid floating point number
					echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter a valid discount amount</div>';
					exit();
				}
			} 
			
			// Create image folder for uploading images
			$itemImageFolder = $baseImageFolder . $itemNumber;
			if(is_dir($itemImageFolder)){
				// Folder already exist. Hence, do nothing
			} else {
				// Folder does not exist, Hence, create it
				mkdir($itemImageFolder);
			}  */
			
			// Calculate the stock values
			$stockSql = 'SELECT dept FROM item WHERE device_code=:device_code';
			$stockStatement = $conn->prepare($stockSql);
			$stockStatement->execute(['device_code' => $device_code ]);
			if($stockStatement->rowCount() > 0){
				//$row = $stockStatement->fetch(PDO::FETCH_ASSOC);
				//$quantity = $quantity + $row['stock'];
				echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Item already exists in DB. Please click the <strong>Update</strong> button to update the details. Or use a different Item Number.</div>';
				exit();
			} else {
				// Item does not exist, therefore, you can add it to DB as a new item
				// Start the insert process
				$insertItemSql = 'INSERT INTO item(device_code, staff_name, branchOffice, dept, device_type, device_ram, device_storage, os, os_status, mac_address, eset_status, ad_status, printer, scanner, status) VALUES(:device_code, :staff_name, :branchOffice, :dept, :device_type, :device_ram, :device_storage, :os, :os_status, :mac_address, :eset_status, :ad_status, :printer, :scanner, :status)';
				$insertItemStatement = $conn->prepare($insertItemSql);
				$insertItemStatement->execute(['device_code' => $device_code, 'staff_name' => $staff_name, 'branchOffice' => $office, 'dept' => $department, 'device_type' => $device_type, 'device_ram' => $device_ram, 'device_storage' => $device_storage, 'os' => $os,'os_status' => $os_status, 'mac_address' => $mac_address, 'eset_status' => $eset_status, 'ad_status' => $ad_status, 'printer' => $printer, 'scanner' => $scanner, 'status' => $status]);
				echo '<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>Item added to database.</div>';
				exit();
			}

		} else {
			// One or more mandatory fields are empty. Therefore, display a the error message
			echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields marked with a (*)</div>';
			exit();
		}
	}
?>