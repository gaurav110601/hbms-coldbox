/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	property name="BCrypt" inject="BCrypt@BCrypt";

	/**
	 * Constructor
	 */
	bookingService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
	
	/**
	 * Bookings
	 */
    public struct function bookings(){
		var loc = {};
        loc.bookingData = {};
		loc.q = new query();

        /* All Bookings */
		loc.sql = 'SELECT * FROM booking ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.bookingData.allBookings = loc.result;

		/* Cancelled Bookings */
		loc.sql = 'SELECT * FROM booking WHERE status=0 ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.bookingData.cancelledBookings = loc.result;

		/* New Bookings */
		loc.sql = 'SELECT * FROM booking WHERE status=1 ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.bookingData.newBookings = loc.result;
		
		/* Approved Bookings */
		loc.sql = 'SELECT * FROM booking WHERE status=2 ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.bookingData.approvedBookings = loc.result;
		
		return loc.bookingData;
	}
	
	/**
	 * View Bookings
	 */
    public struct function viewBooking( required numeric id ){
		var loc = {};
		var loc.viewBooking = {};
		loc.q = new query();

        /* View Booking Data */
		loc.sql = 'SELECT * FROM booking WHERE id = #id#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.viewBooking.bookingData = loc.result;
		
		loc.sql = 'SELECT * FROM rooms WHERE id = #loc.viewBooking.bookingData.roomID#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.viewBooking.roomData = loc.result;
		
		return loc.viewBooking;
	}
	
	/**
	 * Booking Action
	 */
    public struct function bookingAction( required struct formData ){
		var loc = {};
		loc.result = { success: false, message: "", data:{}};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.formData.bookingID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="bookingRemark",value=arguments.formData.bookingRemark,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="bookingStatus",value=arguments.formData.bookingStatus,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'UPDATE booking SET remarks=:bookingRemark, status=:bookingStatus WHERE id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute();

		loc.result.success = true;
		loc.result.message = "Booking Remark & Status Updated !!";
		loc.result.data={'id':arguments.formData.bookingID};

		return loc.result;
	}
	
	
}