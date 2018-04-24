<script src="assets/js/lazeemenu-jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#menu-2').lazeemenu();
    });
</script>
<style>
li{
	list-style-type:none;
}

#menu-2{
	min-height:30em;
}

#menu-2 .submenu{
	margin-bottom:5px;
}

#menu-2 span{
	display:block;
	border:1px solid #ddd;
	color:#555;
	font-size:0.8em;
	min-height: 4em;
	text-align:center;
	padding:1.2em;
	cursor:pointer;
}

#menu-2 li a{
	cursor:pointer;
}

#menu-2 span:hover{
	border:1px solid #2EC0C9;
	color: #2EC0C9;
}
</style>
<section id="menu">
	<ul id="menu-2">
		<li class="menu"><h3><span onClick="window.location='index.php'"><a>Start</a></span></h3></li>
		<li class="menu">
			<h3><span><a href="#">Urządzenia</a></span></h3>
			<ul class="submenu">
				<li><a onClick="window.location='index.php?action=product_definition'">Definicje urządzeń</a></li>
			</ul>
		</li>
		<li class="menu">
			<h3><span><a href="#">Magazyn</a></span></h3>
			<ul class="submenu">
				<li><a onClick="window.location='index.php?action=accept_delivery_temp'">Przyjmij dostawę na magazyn</a></li>
				<li><a onClick="window.location='index.php?action=delivery_released'">Wydaj z magazynu</a></li>
				<li><a onClick="window.location='index.php?action=devices_for_return'">Zwrot do magazynu</a></li>
				<li><a onClick="window.location='index.php?action=warehouse'">Stan magazynowy</a></li>
				
			</ul>
		</li>
		<li class="menu">
			<h3><span><a href="#">Pobrane urządzenia z automatów</a></span></h3>
			<ul class="submenu">
				<li><a onClick="window.location='index.php?action=damaged_devices'">Urządzenia pobrane z automatów</a></li>
				<li><a onClick="window.location='index.php?action=repair_devices'">Urządzenia w naprawie</a></li>
				<li><a onClick="window.location='index.php?action=transfer_to_storage'">Przekaż na magazyn</a></li>
				<li><a onClick="window.location='index.php?action=transfer_to_mennica_service'">Przekaż do serwisu</a></li>
				<li><a onClick="window.location='index.php?action=transfer_to_reprocessing'">Przekaż do utylizacji</a></li>
				
			</ul>
		</li>
		<li class="menu">
			<h3><span><a href="#">Raporty</a></span></h3>
			<ul class="submenu">
				<!--<li><a onClick="window.location='index.php?action=delivery_details'">Szczegóły dostawy/wydania</a></li>-->
				<li><a onClick="window.location='index.php?action=report_delivery_details'">Informacje o dokumentach magazynowych</a></li>
				<li><a onClick="window.location='index.php?action=report_broken_devices'">Raport uszkodzonych urządzeń</a></li>
				<li><a onClick="window.location='index.php?action=report_serviceman_devices'">Raport urządzeń serwisantów</a></li>
			</ul>
		</li>
		
	</ul>

	<section style="background-color:#f4f4f4;">
		<ul class="actions vertical">
			<li><a href="#" onClick="window.location='index.php?action=logout'" class="button big fit" style="background-color:#fff">Wyloguj</a></li>
		</ul>
	</section>
</section>