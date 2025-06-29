<cfoutput>
				<!--about-->
		<cfloop query="#prc.aboutData#">
		<div class="content">
			<div class="about-section">
			<div class="container">
								<h2>About Us</h2>
				<img src="/includes/images/p1.jpg" class="img-responsive" alt="/">
				<h5>#title#</h5>
				<p>#description#</p>
							</div>
		</div>
		</cfloop>	
		<!--about-->
	</cfoutput>