<cfoutput>
    <div class="content">
        <div class="contact">
        <div class="container">
            
            <h2>Book Your Room</h2>
            
        <div class="contact-grids">
            <!--- <cfinclude template="msg.cfm"> --->
            #cbMessagebox().renderit()#

            <div class="col-md-6 contact-right">
                <form method="POST" action="#event.buildLink( "userAccount.doRoomBooking", "id=#rc.id#" )#">
                    <input type="hidden" name="roomID" value="#rc.id#">
                    <input type="hidden" name="userID" value="#prc.userID#">
                    <h5>Name</h5>
                    <input type="text"name="name" id="name" value="#prc.userData.id#" required="true" class="form-control">
                    <h5>Mobile Number</h5>
                    <input type="number" name="mobileNumber" id="mobileNumber" class="form-control" value="#prc.userData.mobileNumber#" required="true" min="10" pattern="[0-9]+">
                    <h5>Email Address</h5>
                    <input type="email" class="form-control" id="email" value="#prc.userData.email#" name="email" required="true">
                    <h5>ID Type</h5>
                    <select class="d-inline-block form-select form-control form-select-sm" name="idType" required>
                        <option value="" >Choose ID Type</option>
                        <option value="Voter Card" >Voter Card</option>
                        <option value="Aadhar Card" >Aadhar Card</option>
                        <option value="Driving Licence Card" >Driving Licence Card</option>
                        <option value="Passport" >Passport</option>
                    </select>
                    <h5>Gender</h5>
                    <input type="radio" id="Male" name="gender" value="Male">
                    <label for="Male">Male</label><br>
                    <input type="radio" id="Female" name="gender" value="Female">
                    <label for="Female">Female</label>
                    <h5>Address</h5>
                    <textarea name="address"></textarea>
                    <h5>Checkin Date</h5>
                    <input type="date" value="" class="form-control" name="checkInDate"  required="true">
                    <h5>Checkout Date</h5>
                    <input type="date" value="" class="form-control" name="checkOutDate"  required="true">
                    <br/>
                    <input type="submit" >
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</cfoutput>