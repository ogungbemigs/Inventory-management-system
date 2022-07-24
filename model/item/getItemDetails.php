<?php
	$itemDetailsSql = 'SELECT * FROM item';
	$itemDetailsStatement = $conn->prepare($itemDetailsSql);
	$itemDetailsStatement->execute();
	
	if($itemDetailsStatement->rowCount() > 0) {
		while($row = $itemDetailsStatement->fetch(PDO::FETCH_ASSOC)) {
			echo '<option>' . $row['staff_name'] . '</option>';
		}
	}
	$itemDetailsStatement->closeCursor();
?>