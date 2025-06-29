/**
 * The main module handler
 */

 component extends="Base"{

	property name="userService" inject="userService@admin";
    

	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
		prc.pageTitle="Registered Users";
		prc.usersData = variables.userService.users();
		event.setView( "users/index" );
	}

	/**
	 * User Bookings
	 */
	function userBookings( event, rc, prc ){
		prc.pageTitle="User Bookings";
		prc.data = variables.userService.userBookings(rc.id);
		prc.userBookingsData = prc.data.userBookingsData;
		prc.userName = prc.data.userName;
		event.setView( "users/userBookings" );
	}
	

}
