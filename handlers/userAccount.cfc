/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="Base"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){
		relocate("userAccount.profile");
	}
	
	/**
	 * Profile
	 */
	function profile( event, rc, prc ){
		prc.pageTitle="Profile";
		prc.user = variables.loginService.getUser(  prc.userID );
		prc.userData = variables.frontService.userData(  prc.userID );
	}

	/**
	 * Profile Update
	 */
	function profileUpdate( event, rc, prc ){
		if(trim(rc.name) EQ "" OR trim(rc.mobileNumber) EQ "" OR trim(rc.email) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "userAccount.profile" );
		}

		prc.pageTitle="My Account";
		var result = variables.loginService.profileUpdate( rc );

		if( result.result.success EQ true){
			variables.messagebox.success( result.result.message );
		}else{
			variables.messagebox.error( result.result.message );
		}
		relocate(  "userAccount.profile" );
	}

	/**
	 * Bookings
	 */
	function bookings( event, rc, prc ){
		prc.pageTitle="My Bookings";
		prc.sn = 1;
		prc.userBookingsData = variables.loginService.userBookings( prc.userID );
	} 

	/**
	 * View Booking
	 */
	function viewBooking( event, rc, prc ){
		prc.pageTitle="View Booking";
		prc.viewBookingData = variables.loginService.viewBooking( rc.id);
		prc.bookingData = prc.viewBookingData.bookingData;
		prc.roomData = prc.viewBookingData.roomData;
	}
	
	/**
	 * Logout
	 */
	function logout( event, rc, prc ){
		variables.sessionStorage.delete("userID");
		variables.sessionStorage.delete("userName");
		/* variables.messagebox.success( "Logged Out!" ); */
		relocate(  "Main.index" );
	}

	
	/**
	 * Change Password
	 */
	function changePassword( event, rc, prc ){
		prc.pageTitle="Change Password";
	}

	/**
	 * Password Update
	 */
	function passwordUpdate( event, rc, prc ){
		if(trim(rc.oldPassword) EQ "" OR trim(rc.newPassword) EQ "" OR trim(rc.confirmPassword) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "userAccount.changePassword" );
		}

		var passwordUpdate = variables.loginService.passwordUpdate( rc );

		if( passwordUpdate.result1.success EQ true){
			variables.messagebox.success( passwordUpdate.result1.message );
		}else{
			variables.messagebox.error( passwordUpdate.result1.message );
		}
		relocate(  "userAccount.changePassword" );
	}
	
	/**
	 * Room Booking
	 */
	function roomBooking( event, rc, prc ){
		if(structKeyExists(prc, "userID")){
			prc.pageTitle="Room Booking";
			prc.userData = variables.frontService.userData(  prc.userID );
			event.setView("userAccount/roombooking")
		}else{
			variables.messagebox.error( "Please Login First!!" );
			relocate("main.signin");
		}
	}

	/**
	 * Do Room Booking
	 */
	function doRoomBooking( event, rc, prc ){
		if(trim(rc.name) EQ "" OR trim(rc.mobileNumber) EQ "" OR trim(rc.email) EQ "" OR trim(rc.idType) EQ "" OR trim(rc.gender) EQ "" OR trim(rc.address) EQ "" OR trim(rc.checkInDate) EQ "" OR trim(rc.checkOutDate) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  event="userAccount.roomBooking", queryString="id=#rc.id#" );
		}

		var result = variables.loginService.doRoomBooking( rc );

		if( result GT 0){
			relocate(  "main.index" );
		}/* else{
			variables.messagebox.error( "Email Already Exists!!" );
			relocate( "main/signup" );
		} */
	}

}

