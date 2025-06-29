<cfoutput>
    <!--about-->
		
		<div class="content">
			<div class="contact">
			<div class="container">
				
				<h2>Profile</h2>
				
			<div class="contact-grids">
				<!--- <cfinclude template="msg.cfm"> --->
                
                #cbMessagebox().renderit()#
				<div class="col-md-6 contact-right">
					<cfloop query="#prc.userData#">
						<form method="POST" action="#event.buildLink( "userAccount.profileUpdate" )#">
							<input type="hidden" name="userID" id="userID" value="#id#">
							<h5>Full Name</h5>
							<input type="text"name="name" id="name" required="true" class="form-control" value="#name#">
							<h5>Mobile Number</h5>
							<input type="number" name="mobileNumber" id="mobileNumber" class="form-control" required="true" value="#mobileNumber#">
							<h5>Email Address</h5>
							<input type="email" class="form-control" id="email" name="email" required="true" value="#email#">
							<br/>
							<input type="submit" value="Update" name="submit">
						</form>

					</cfloop>
				</div>
				<!--- <div class="clearfix"></div> --->
			</div>
		</div>
	</div>
</cfoutput>
