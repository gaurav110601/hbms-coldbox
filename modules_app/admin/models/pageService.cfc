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
	pageService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
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

        /* About Data */
		loc.sql = 'SELECT * FROM about';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.aboutData = loc.result;
		
		return loc.aboutData;
	}
	
	/**
	 * About Update
	 */ 
	public struct function aboutUpdate(required struct formData){
		var loc = {};
		loc.result = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.formData.id,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="aboutTitle",value=arguments.formData.pageTitle,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="aboutDescription",value=arguments.formData.pageDescription,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'SELECT * FROM about WHERE title=:aboutTitle AND description=:aboutDescription AND id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute().getPrefix();
		if(loc.rs.recordcount GT 0){
			loc.result.message = "No Changes Done";
			return loc.result;
		}
		loc.sql = 'UPDATE about SET title=:aboutTitle, description=:aboutDescription WHERE id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute();

		loc.result.success = true;
		loc.result.message = "About Page Updated Successfully";

		return loc.result;
	}
	
	/**
	 * Contact
	 */ 
	public query function contact(){
		var loc = {};
        loc.contactData = {};
		loc.q = new query();

        /* About Data */
		loc.sql = 'SELECT * FROM contact';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.contactData = loc.result;
		
		return loc.contactData;
	}
	
	/**
	 * Contact Update
	 */ 
	public struct function contactUpdate(required struct formData){
		var loc = {};
		loc.result = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.formData.id,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="contactTitle",value=arguments.formData.pageTitle,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="contactDescription",value=arguments.formData.pageDescription,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'SELECT * FROM contact WHERE title=:contactTitle AND email=:email AND mobileNumber=:mobileNumber AND description=:contactDescription AND id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute().getPrefix();
		if(loc.rs.recordcount GT 0){
			loc.result.message = "No Changes Done";
			return loc.result;
		}
		loc.sql = 'UPDATE contact SET title=:contactTitle, email=:email, mobileNumber=:mobileNumber, description=:contactDescription WHERE id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute();

		loc.result.success = true;
		loc.result.message = "Contact Page Updated Successfully";

		return loc.result;
	}


}