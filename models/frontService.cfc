/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	property name="BCrypt" inject="BCrypt@BCrypt";

	// Validation Constraints
	this.constraints = {
		// Example: age = { required=true, min="18", type="numeric" }
	};

	// Constraint Profiles
	this.constraintProfiles = {
		"update" : {}
	};

	// Population Control
	this.population = {
		include : [],
		exclude : [ "id" ]
	};

    // Mementifier
	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = [ "*" ],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {}
	};

	/**
	 * Constructor
	 */
	frontService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the frontService
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

    /**
	 * About
	 */ 
	public query function about(){
		var loc = {};
        loc.aboutData = {};
		loc.q = new query();
		
        /* Room Data */
		loc.sql = 'SELECT * FROM about';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.aboutData = loc.result;
		
		return loc.aboutData;
	}

    /**
	 * Contact
	 */ 
	public query function contact(){
		var loc = {};
        loc.contactData = {};
		loc.q = new query();
		
        /* Room Data */
		loc.sql = 'SELECT * FROM contact';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.contactData = loc.result;
		
		return loc.contactData;
	}

    /**
	 * Category
	 */ 
	public query function category(){
		var loc = {};
        loc.categoryData = {};
		loc.q = new query();
		
        /* Room Data */
		loc.sql = 'SELECT * FROM category  ORDER BY price';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.categoryData = loc.result;
		
		return loc.categoryData;
	}

    /**
	 * Rooms By Category
	 */ 
	public query function roomsByCategory( required numeric categoryID){
		var loc = {};
        loc.roomsDataByCategory = {};
		loc.q = new query();
		
        /* Category Data*/
        loc.q.addParam(name="categoryID",value=arguments.categoryID,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'SELECT * FROM category WHERE id=:categoryID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.categoryTitle = loc.result.title;

        /* Rooms Data By Category*/
        loc.q.addParam(name="category",value=loc.categoryTitle,CFSQLTYPE="cf_sql_varchar");
        loc.sql = 'SELECT * FROM rooms WHERE category=:category ORDER BY price';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();

        loc.roomsDataByCategory = loc.result;
		
		return loc.roomsDataByCategory;
	}

    /**
	 * Rooms
	 */ 
	public query function room(){
		var loc = {};
        loc.roomsData = {};
		loc.q = new query();
		
        /* Room Data */
		loc.sql = 'SELECT * FROM rooms  ORDER BY price';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomsData = loc.result;
		
		return loc.roomsData;
	}

    /**
	 * User Data
	 */ 
	public query function userData( required numeric userID ){
		var loc = {};
		loc.q = new query();
		loc.sql = 'SELECT * FROM users WHERE id=#userID#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		return loc.result;
	}
	
	/**
	 * doEnquiry
	 */ 
	public numeric function doEnquiry(required struct formData){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.q.addParam(name="name",value=arguments.formData.name,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
        loc.q.addParam(name="message",value=arguments.formData.message,CFSQLTYPE="cf_sql_varchar");
        
		loc.sql = 'INSERT INTO enquiry SET name=:name, email=:email, mobileNumber=:mobileNumber, message=:message';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}

}