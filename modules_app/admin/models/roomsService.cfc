/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	property name="BCrypt" inject="BCrypt@BCrypt";
	/* property name="settings"    inject="coldbox:settings:"; */
	property name="config" inject="coldbox:configSettings";
	

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
	roomsService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

    /**
	 * Room
	 */ 
	public query function room(){
		var loc = {};
        loc.roomData = {};
		loc.q = new query();
		
        /* Room Data */
		loc.sql = 'SELECT * FROM rooms ORDER BY price';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomData = loc.result;
		
		return loc.roomData;
	}

	/**
	 * Edit Room
	 */ 
	public query function editRoom(required numeric roomID){
		var loc = {};
        loc.roomData = {};
		loc.q = new query();
		loc.q.addParam(name="roomID",value=roomID,CFSQLTYPE="cf_sql_varchar");

        /* Room Data */
		loc.sql = 'SELECT * FROM rooms WHERE id=:roomID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomData = loc.result;
		
		return loc.roomData;
	}

	/**
	 * Add Room
	 */ 
	public numeric function addRoom(required struct formData){
		var loc = {};
		loc.rV = 0;

		loc.q = new query();
		loc.q.addParam(name="roomName",value=arguments.formData.roomName,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM rooms WHERE name=:roomName';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        if(loc.result.recordcount GT 0){
			return loc.rV;
		}
		
		loc.imgData = fileUpload(config.fileUploadPath, "#formData.roomImage#", " ", "makeunique");
		loc.imgData.imgPathLen = len(loc.imgData.serverdirectory);
		loc.imgData.imgPathFind = find("include", loc.imgData.serverdirectory);
		loc.imgData.imgPath = mid(loc.imgData.serverdirectory, loc.imgData.imgPathFind, (loc.imgData.imgPathLen+1-loc.imgData.imgPathFind));
		loc.imgData.imgName = loc.imgData.serverfile;

		loc.q.addParam(name="roomCategory",value=arguments.formData.roomCategory,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="maxAdult",value=arguments.formData.maxAdult,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="maxChild",value=arguments.formData.maxChild,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomDescription",value=arguments.formData.roomDescription,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="numberOfBed",value=arguments.formData.numberOfBed,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomImagePath",value=loc.imgData.imgPath,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomImageName",value=loc.imgData.imgName,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM category WHERE title=:roomCategory';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomPrice = loc.result.price;

		loc.q.addParam(name="roomPrice",value=loc.roomPrice,CFSQLTYPE="cf_sql_varchar");
		
		loc.sql = 'INSERT INTO rooms SET category=:roomCategory, name=:roomName, maxAdult=:maxAdult, maxChild=:maxChild, description=:roomDescription, beds=:numberOfBed, imageName=:roomImageName, imagePath=:roomImagePath, price=:roomPrice';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}
	
	/**
	 * Update Room
	 */ 
	public numeric function updateRoom(required struct formData){
		var loc = {};
		loc.rV = 0;
		
		loc.q = new query();
		loc.q.addParam(name="roomID",value=arguments.formData.roomID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomName",value=arguments.formData.roomName,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomCategory",value=arguments.formData.roomCategory,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="maxAdult",value=arguments.formData.maxAdult,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="maxChild",value=arguments.formData.maxChild,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomDescription",value=arguments.formData.roomDescription,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="numberOfBed",value=arguments.formData.numberOfBed,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM rooms WHERE name=:roomName AND id!=:roomID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        if(loc.result.recordcount EQ 1){
			return loc.rV;
		}

		if(arguments.formData.roomImage == ''){
			loc.sql = 'UPDATE rooms SET category=:roomCategory, name=:roomName, maxAdult=:maxAdult, maxChild=:maxChild, description=:roomDescription, beds=:numberOfBed WHERE id=:roomID';
			loc.q.setSQL(loc.sql);
			loc.rV = loc.q.execute().getPrefix().recordCount;
			return loc.rV;
		}

		loc.roomImageName = arguments.formData.roomImageName;
		loc.roomImagePath = arguments.formData.roomImagePath;/* 
		writeDump(expandPath("\#loc.roomImagePath#\#loc.roomImageName#"));abort; */
		fileDelete(expandPath("\#loc.roomImagePath#\#loc.roomImageName#"));

		loc.imgData = fileUpload(config.fileUploadPath, "#formData.roomImage#", " ", "makeunique");
		loc.imgData.imgPathLen = len(loc.imgData.serverdirectory);
		loc.imgData.imgPathFind = find("include", loc.imgData.serverdirectory);
		loc.imgData.imgPath = mid(loc.imgData.serverdirectory, loc.imgData.imgPathFind, (loc.imgData.imgPathLen+1-loc.imgData.imgPathFind));
		loc.imgData.imgName = loc.imgData.serverfile;

		loc.q.addParam(name="roomImagePath",value=loc.imgData.imgPath,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomImageName",value=loc.imgData.imgName,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM category WHERE title=:roomCategory';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomPrice = loc.result.price;

		loc.q.addParam(name="roomPrice",value=loc.roomPrice,CFSQLTYPE="cf_sql_varchar");
		
		loc.sql = 'UPDATE rooms SET category=:roomCategory, name=:roomName, maxAdult=:maxAdult, maxChild=:maxChild, description=:roomDescription, beds=:numberOfBed, imageName=:roomImageName, imagePath=:roomImagePath, price=:roomPrice WHERE id=:roomID';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}
	
	/**
	 * Delete Room
	 */ 
	public numeric function deleteRoom( required numeric roomID ){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.q.addParam(name="roomID",value=roomID,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM rooms WHERE id=:roomID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.roomImageName = loc.result.imageName;
		loc.roomImagePath = loc.result.imagePath;

		fileDelete(expandPath("\#loc.roomImagePath#\#loc.roomImageName#"));
		
		loc.sql = 'DELETE FROM rooms WHERE id=:roomID';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		if(loc.rV GT 0){
			return loc.rV;
		}
	}
	
	
}