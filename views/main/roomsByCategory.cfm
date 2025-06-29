<cfoutput>
    <!--rooms-->
    <div class="content">
        <div class="room-section">
            <div class="container">
                <h2>Rooms Details</h2>
                <div class="room-grids">
                        <cfif '#prc.roomsDataByCategory.recordcount#' GT 0>
                            <cfloop query="#prc.roomsDataByCategory#">
                                <div class="room1">
                                    <div class="col-md-5 room-grid" style="padding-bottom: 50px">
                                    <a href="##" class="mask">
                                        <img src="\#imagePath#\#imageName#" class=" mask img-responsive zoom-img" alt="" /></a>
                                        
                                    </div>
                                    <div class="col-md-7 room-grid1">
                                        <h4> #name# </h4>
                                        <p>#description#</p>
                                        <p>Max Adult:#maxAdult#</p>
                                        <p>Max Child:#maxChild#</p>
                                        <p>No of Beds:#beds#</p>
                                        <p>Price: #price#</p>
                                        <a class="btn btn-success" href="#event.buildLink( "userAccount.roomBooking", "id=#id#" )#">Book</a>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>						
                            </cfloop>
                        <cfelse>
                            <center><h4 style="color: red;">No Rooms Available in this Category</h2></center>
                        </cfif>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--rooms-->
</cfoutput>