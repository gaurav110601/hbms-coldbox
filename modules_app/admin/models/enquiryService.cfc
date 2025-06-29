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
	enquiryService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
    /**
	 * Enquiry
	 */
	public struct function enquiry(){
		var loc = {};
		loc.enquiryData = {};
		loc.q = new query();

		/* Read Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE status=1 ORDER BY id DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.enquiryData.readEnquiry = loc.result;

		/* Unread Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE status=0';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.enquiryData.unreadEnquiry = loc.result;

		return loc.enquiryData;
	}
	public query function viewEnquiry(required numeric id){
		var loc = {};
		loc.enquiryData = {};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.id,CFSQLTYPE="cf_sql_varchar");

		/* View Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE id=:id';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		if(loc.result.status EQ 0){
			loc.sql = 'UPDATE enquiry SET status=1 WHERE id=:id';
			loc.q.setSQL(loc.sql);
			loc.rs = loc.q.execute();
		}
		loc.enquiryData.readEnquiry = loc.result;

		return loc.enquiryData.readEnquiry;
	}
	
}