<?php 
	require('../../../config/db.class.php');
	$repair_id = $_GET['repair_id'];
?>
<script>
function finish_repair(){
	var r = confirm("Potwierdzasz zakończenie naprawy");
	if (r == true) {
		var http = new XMLHttpRequest();
		var url = "";
		var params = "";
		http.open("POST", url, true);
		http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		http.onreadystatechange = function() {//Call a function when the state changes.
			if(http.readyState == 4 && http.status == 200) {
				alert('Urządzenie zostało oznaczone jako sprawne, do przekazania na magazyn');
			}
		}
		http.send(params);
	} else {
		alert('Anulowano zakończenie naprawy');
		return false;
	}
}; 
</script>
<style>
	input{
		padding-left:10px;
		width:400px;
	}
	textarea{
		width:400px;
		height:250px;
		resize: none;
	}
</style>
<?php
foreach($serviceman->custom_repair($repair_id) as $row)
{	
	echo "<table>";
	echo "<tr><td><label>Data rozpoczęcia naprawy</label></td><td><input type='text' disabled value='".$row['start_repair_datetime']."'/></td></tr>";
	echo "<tr><td><label>Nazwa urządzenia</label></td><td><input type='text' disabled value='".$row['repair_devices_name']."'/></td></tr>";
	echo "<tr><td><label>Interwencja wykonana przez</label></td><td><input type='text' disabled value='".$row['service_user_name']."'/></td></tr>";
	echo "<tr><td><label>Nr automatu</label></td><td><input type='text' disabled value='".$row['automat_number']."'/></td></tr>";
	echo "<tr><td><label>Nr seryjny</label></td><td><input type='text' disabled value='".$row['sn']."'/></td></tr>";
	echo "<tr><td><label>Rzeczywisty czas naprawy</label></td><td><form><input type='range' name='amountRange' min='0' max='180' value='0' oninput='this.form.amountInput.value=this.value' />&nbsp;&nbsp;&nbsp;<input type='number' disabled  name='amountInput' min='0' max='180' value='0' oninput='this.form.amountRange.value=this.value' />&nbsp;&nbsp;minut</form></td></tr>";
	echo "<tr><td><label>Wykonane czynności</label></td><td><textarea></textarea></td></tr>";
	echo "</table>";
}
?>

	<hr>
	<button id='save_changes'>Zapisz zmiany</button>									   
	<button onClick='finish_repair()'>Zakończ naprawę</button>									   