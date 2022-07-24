<?php
    require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
    $array = [];
    $deviceCodeSql = 'SELECT device_code FROM item';
		$deviceCodeStatement = $conn->prepare($deviceCodeSql);
		$deviceCodeStatement->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['device']=$deviceCodeStatement->rowCount();
        
        $itemDetailsSql2 = 'SELECT os_status FROM item WHERE os_status = "Activated" ';
		$itemDetailsStatement2 = $conn->prepare($itemDetailsSql2);
		$itemDetailsStatement2->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['os']=$itemDetailsStatement2->rowCount();

        $deviceTypeSql = 'SELECT device_type FROM item WHERE device_type = "Desktop"';
		$deviceTypeStatement = $conn->prepare($deviceTypeSql);
		$deviceTypeStatement->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['desktop'] = $deviceTypeStatement->rowCount();

		$deviceTypeSql = 'SELECT device_type FROM item WHERE device_type = "laptop"';
		$deviceTypeStatement = $conn->prepare($deviceTypeSql);
		$deviceTypeStatement->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['laptop'] = $deviceTypeStatement->rowCount();

		$deviceTypeSql = 'SELECT device_type FROM item WHERE device_type = "All in One"';
		$deviceTypeStatement = $conn->prepare($deviceTypeSql);
		$deviceTypeStatement->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['allInOne'] = $deviceTypeStatement->rowCount();

		$deviceTypeSql = 'SELECT eset_status FROM item WHERE eset_status = "Yes"';
		$deviceTypeStatement = $conn->prepare($deviceTypeSql);
		$deviceTypeStatement->execute();
		
		// If data is found for the given item number, return it as a json object
		$array['yes'] = $deviceTypeStatement->rowCount();

		
        
        
        
    
        die(json_encode($array));