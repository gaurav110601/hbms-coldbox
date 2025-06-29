<cfoutput>
    <div class="content">
        <div class="contact">
        <div class="container">
            
            <h2>Change Password</h2>
            
        <div class="contact-grids">
            <!--- <cfinclude template="msg.cfm"> --->
            
            #cbMessagebox().renderit()#
            <div class="col-md-6 contact-right">
                <form method="POST" action="#event.buildLink( "userAccount.passwordUpdate" )#">
                    <input type="hidden" name="userID" id="userID" value="#prc.userID#" required>
                    <h5>Old Password</h5>
                    <input type="password" value="" name="oldPassword" required="true" class="form-control">
                    <h5>New Password</h5>
                    <input type="password" name="newPassword" value="" class="form-control" required="true">
                    <h5>Confirm Password</h5>
                    <input type="password" class="form-control"  value="" name="confirmPassword" required="true">
                    <!--- <h5>Password</h5>
                    <input type="password" value="" id="password" class="form-control" name="password" required="true">
                    <br />
                    <a href="#event.buildLink( "main/signin" )#" style="color: red">Signin</a> --->
                    <br/>
                        <input type="submit" value="Update" name="submit">
                    </form>
                </div>
                <!--- <div class="clearfix"></div> --->
            </div>
        </div>
    </div>
</cfoutput>
