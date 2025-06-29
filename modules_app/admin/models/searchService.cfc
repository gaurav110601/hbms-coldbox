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
	searchService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
	
	/**
	 * Booking Search
	 */
    public query function searchBooking( required string tableSearch){
		var loc = {};
		loc.q = new query();
		loc.q.addParam(name="tableSearch",value=arguments.tableSearch,CFSQLTYPE="cf_sql_varchar");

		/* Search Booking */
		loc.sql = 'SELECT * FROM booking WHERE bookingNumber LIKE "%":tableSearch"%" OR name LIKE "%":tableSearch"%" ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.searchBookingData = loc.result;

		return loc.searchBookingData;
	}

    /**
	 * Enquiry Search
	 */
    public query function searchEnquiry( required string tableSearch){
		var loc = {};
		loc.q = new query();
		loc.q.addParam(name="tableSearch",value=arguments.tableSearch,CFSQLTYPE="cf_sql_varchar");

		/* Search Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE mobileNumber LIKE "%":tableSearch"%" OR name LIKE "%":tableSearch"%" ORDER BY id DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.searchEnquiryData = loc.result;

		return loc.searchEnquiryData;
	}
	
}