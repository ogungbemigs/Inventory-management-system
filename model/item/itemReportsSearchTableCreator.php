<?php
	require_once('../../inc/config/constants.php');
	require_once('../../inc/config/db.php');
	
	$itemDetailsSearchSql = 'SELECT * FROM item';
	$itemDetailsSearchStatement = $conn->prepare($itemDetailsSearchSql);
	$itemDetailsSearchStatement->execute();

	$output = '<table id="itemReportsTable" class="table table-sm table-striped table-bordered table-hover" style="width:100%">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Device Code</th>
						<th>Staff Name</th>
						<th>Location</th>
						<th>Department</th>
						<th>Device Type</th>
						<th>RAM</th>
						<th>Storage Size</th>
						<th>Operating System</th>
						<th>Windows Activation Status</th>
						<th>Mac Address</th>
						<th>ESET Status</th>
						<th>Active Directory</th>
						<th>Printer</th>
						<th>Scanner</th>
						<th>Device Status</th>
					</tr>
				</thead>
				<tbody>';
	
	// Create table rows from the selected data
	while($row = $itemDetailsSearchStatement->fetch(PDO::FETCH_ASSOC)){
		$output .= '<tr>' .
							'<td>' . $row['productID'] . '</td>' .
							'<td>' . $row['device_code'] . '</td>' .
							'<td><a href="#" class="itemDetailsHover" data-toggle="popover" id="' . $row['productID'] . '">' . $row['staff_name'] . '</a></td>' .
							'<td>' . $row['branchOffice'] . '</td>' .
							'<td>' . $row['dept'] . '</td>' .
							'<td>' . $row['device_type'] . '</td>' .
							'<td>' . $row['device_ram'] . '</td>' .
							'<td>' . $row['device_storage'] . '</td>' .
							'<td>' . $row['os'] . '</td>' .
							'<td>' . $row['os_status'] . '</td>' .
							'<td>' . $row['mac_address'] . '</td>' .
							'<td>' . $row['eset_status'] . '</td>' .
							'<td>' . $row['ad_status'] . '</td>' .
							'<td>' . $row['printer'] . '</td>' .
							'<td>' . $row['scanner'] . '</td>' .
							'<td>' . $row['status'] . '</td>' .
					'</tr>';
	}
	
	$itemDetailsSearchStatement->closeCursor();
	
	$output .= '</tbody>
					<tfoot>
						<tr>
							<th>Product ID</th>
							<th>Device Code</th>
							<th>Staff Name</th>
							<th>Location</th>
							<th>Department</th>
							<th>Device Type</th>
							<th>RAM</th>
							<th>Storage Size</th>
							<th>Operating System</th>
							<th>Windows Activation Status</th>
							<th>Mac Address</th>
							<th>ESET Status</th>
							<th>Active Directory</th>
							<th>Printer</th>
							<th>Scanner</th>
							<th>Device Status</th>
						</tr>
					</tfoot>
				</table>';
	echo $output;
?>