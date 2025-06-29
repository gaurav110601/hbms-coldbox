<cfoutput>
	
		<!--about-->
		
		<div class="content">
			<div class="contact">
			<div class="container">
				
				<h2>REGISTERED With Us</h2>
				
			<div class="contact-grids">
				<!--- <cfinclude template="msg.cfm"> --->
				#cbMessagebox().renderit()#

				<div class="col-md-6 contact-right">
					<form method="POST" action="#event.buildLink( "main.doRegister" )#">
						<h5>Full Name</h5>
						<input type="text" value="" name="name" id="name" required="true" class="form-control">
						<h5>Mobile Number</h5>
						<input type="number" name="mobileNumber" id="mobileNumber" class="form-control" required="true" min="10" pattern="[0-9]+">
						<h5>Email Address</h5>
						<input type="email" class="form-control" id="email" value="" name="email" required="true">
						<h5>Password</h5>
						<input type="password" value="" id="password" class="form-control" name="password" minlength="4" required="true">
						<br />
						<a href="#event.buildLink( "main.signin" )#" style="color: red">Signin</a>
						<br/>
							<input type="submit" value="Sign Up" name="submit">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
			
</cfoutput>