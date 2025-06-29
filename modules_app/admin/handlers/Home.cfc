/**
 * The main module handler
 */

component extends="Base"{

	property name="bookingService" inject="bookingService@admin";
    property name="userService" inject="userService@admin";
	property name="enquiryService" inject="enquiryService@admin";

	
	
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
		prc.pageTitle="Dashboard";
		prc.bookingData = variables.bookingService.bookings();
		prc.usersData = variables.userService.users();
		prc.enquiryData = variables.enquiryService.enquiry();
		event.setView( "home/index" );
	}
	
	

}
