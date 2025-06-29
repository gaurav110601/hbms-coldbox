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
	userService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
	
	/**
	 * Users
	 */ 
    public query function users(){
		var loc = {};
        loc.usersData = {};
		loc.q = new query();
		
		loc.sql = 'SELECT * FROM users ORDER BY name';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.usersData = loc.result;
		
		return loc.usersData;
	}	

	/**
	 * User Bookings
	 */ 
    public struct function userBookings(required numeric id){
		var loc = {};
		loc.data = {};
		loc.q = new query();

		loc.sql = 'SELECT * FROM booking WHERE userID = #id#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.data.userBookingsData = loc.result;
		
		loc.sql = 'SELECT * FROM users WHERE id = #id#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.data.userName = loc.result.name;
		
		return loc.data;
	}	
	
}