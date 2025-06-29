<cfoutput>
		<div class="content">
			<!-- gallery -->
	<div class="gallery-top">
			<!-- container -->
			<div class="container">
				<div class="gallery-info">
					<h2>gallery</h2>
				</div>
				<div class="gallery-grids-top">
					<div class="gallery-grids">
						<cfloop query="#prc.roomsData#">
							<div class="col-md-3 gallery-grid">
								<br />
								<a class="example-image-link"  data-lightbox="example-set" data-title=""><img class="example-image" src="\#imagePath#\#imageName#" height="300" width="300" alt=""/></a>
							</div>	
						</cfloop>
								
						<div class="clearfix"> </div>
					</div>
		
					<script src="/includes/js/lightbox-plus-jquery.min.js"></script>
				</div>
			</div>
			<!-- //container -->
	</div>
	<!-- /gallery -->

</cfoutput>