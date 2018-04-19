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
			<h3><span><a href="#">Serwis</a></span></h3>
			<ul class="submenu">
				<li><a onClick="window.location='index.php?action=service_request'">Działania serwisowe</a></li>
				<li><a onClick="window.location='index.php?action=my_devices'">Moje urządzenia</a></li>
				<li><a onClick="window.location='index.php?action=delivery_released'">Pobierz urządzenia</a></li>
				<li><a onClick="window.location='index.php?action=devices_for_return'">Urządzenia do zwrotu</a></li>
				<li><a onClick="window.location='index.php?action=history'">Historia działań</a></li>
			</ul>
		</li>	
		<li class="menu">
			<h3><span><a href="#">Naprawy</a></span></h3>
			<ul class="submenu">
				<li><a onClick="window.location='index.php?action=devices_for_repair'">Urządzenia do naprawy</a></li>
			</ul>
		</li>	
	</ul>

	<section style="background-color:#f4f4f4;">
		<ul class="actions vertical">
			<li><a href="#" onClick="window.location='index.php?action=logout'" class="button big fit" style="background-color:#fff">Wyloguj</a></li>
		</ul>
	</section>
</section>