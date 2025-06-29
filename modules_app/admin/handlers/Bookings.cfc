/**
 * The main module handler
 */

 component extends="Base"{

	property name="bookingService" inject="bookingService@admin";
    
	
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	/**
	 * Bookings
	 */
	function allBookings( event, rc, prc ){
		prc.pageTitle="All Bookings";
		prc.bookingData = variables.bookingService.bookings();
		prc.allBookingsData = prc.bookingData.allBookings;
		event.setView( "bookings/allBookings" );
	}
	function cancelledBookings( event, rc, prc ){
		prc.pageTitle="Cancelled Bookings";
		prc.bookingData = variables.bookingService.bookings();
		prc.cancelledBookingsData = prc.bookingData.cancelledBookings;
		event.setView( "bookings/cancelledBookings" );
	}
	function newBookings( event, rc, prc ){
		prc.pageTitle="New Bookings";
		prc.bookingData = variables.bookingService.bookings();
		prc.newBookingsData = prc.bookingData.newBookings;
		event.setView( "bookings/newBookings" );
	}
	function approvedBookings( event, rc, prc ){
		prc.pageTitle="Approved Bookings";
		prc.bookingData = variables.bookingService.bookings();
		prc.approvedBookingsData = prc.bookingData.approvedBookings;
		event.setView( "bookings/approvedBookings" );
	}

	/**
	 * View Booking
	 */
	function viewBooking( event, rc, prc ){
		prc.pageTitle="View Bookings";
		prc.viewBookingData = variables.bookingService.viewBooking( rc.id);
		prc.bookingData = prc.viewBookingData.bookingData;
		prc.roomData = prc.viewBookingData.roomData;
		event.setView( "bookings/viewBooking" );
	}
	function bookingAction( event, rc, prc ){
		var result = variables.bookingService.bookingAction( rc );

		if( result.success EQ true){
			variables.messagebox.success( result.message );
		}else{
			variables.messagebox.error( result.message );
		}
		relocate( event="admin:bookings.viewBooking", queryString="id=#result.data.id#" );
	}

}
