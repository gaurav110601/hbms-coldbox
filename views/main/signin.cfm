<cfoutput>
	<!--about-->
	<div class="content">
		<div class="contact">
			<div class="container">
				<h2>If you have an account with us, please log in.</h2>
			<div class="contact-grids">
				#cbMessagebox().renderit()#
				<div class="col-md-6 contact-right">
					<form method="POST" action="#event.buildLink("main.doLogin")#">
						<h5>Email Address</h5>
						<input type="email" class="form-control" name="email" id="email" required>
						<h5>Password</h5>
						<input type="password" class="form-control" name="password" id="password" required>
						<br />
						<!--- <a href="forgot-password.cfm">Forgot your password?</a> --->
						<!--- <br/> --->
						<input type="submit" value="Login" name="login">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cfoutput>