<?php
require('config/db.class.php');
?>
<div id="main">
	<article class="post">
		<header>
			<div class="title"><h3>Stan magazynu</h3></div>
		</header>
		
		<section>
			
			<?php
				$vectorsoft_magazyn->warehouse($_SESSION['mennica_magazyn_storage_id']);
			?>
		<span></span>
		</section>
	</article>

</div>