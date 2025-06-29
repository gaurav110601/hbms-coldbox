<cfoutput>
		<!--about-->
		
			<div class="content">
				<div class="contact">
				<div class="container">
					<h2>contact us</h2>
				<div class="contact-grids">
					<div class="col-md-6 contact-left">
						<cfloop query="#prc.aboutData#">
							<p>#description#</p>	
						</cfloop>
																								<address>
								<cfloop query="#prc.contactData#">
									<p>#title#</p>
								<p>#description#</p>
								
								<p>Telephone : #mobileNumber#</p>
							
								<p>E-mail : #email#</p>
								</cfloop>
								
							</address>					</div>
						<div class="col-md-6 contact-right">
							#cbmessagebox().renderit()#
							<form method="POST" action="#event.buildLink( "Main.doEnquiry" )#">
								<h5>Name</h5>
								<input type="text"  value="" name="name" id="name" required="true">
								<h5>Mobile Number</h5>
								<input type="text" name="mobileNumber" id="mobileNumber" required="true" maxlength="10">
								<h5>Email Address</h5>
								<input type="text" value="" name="email" id="email" required="true">
								<h5>Message</h5>
								 <textarea rows="10" name="message" id="message" required="true"></textarea>
								 <input type="submit" value="send" name="submit">
						 	 </form>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
</cfoutput>