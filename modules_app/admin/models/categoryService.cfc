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
	categoryService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
	
	/**
	 * Category
	 */ 
	public query function category(){
		var loc = {};
        loc.categorygData = {};
		loc.q = new query();

        /* All Category Data */
		loc.sql = 'SELECT * FROM category ORDER BY price';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.categorygData = loc.result;
		
		return loc.categorygData;
	}
	
	/**
	 * Add Category
	 */ 
	public numeric function addCategory(required struct formData){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.sql = 'SELECT * FROM category WHERE title="#arguments.formdata.categoryTitle#"';
		loc.q.setSQL(loc.sql);
		loc.result = loc.q.execute().getPrefix().recordCount;
		if(loc.result GT 0){
			return loc.rV;
		}
		loc.q.addParam(name="categoryTitle",value=arguments.formData.categoryTitle,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="categoryDescription",value=arguments.formData.categoryDescription,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="categoryPrice",value=arguments.formData.categoryPrice,CFSQLTYPE="cf_sql_varchar");
	
		loc.sql = 'INSERT INTO category SET title=:categoryTitle, description=:categoryDescription, price=:categoryPrice';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}
	
	/**
	 * Edit Category
	 */ 
	public query function editCategory(required numeric categoryID){
		var loc = {};
        loc.categoryData = {};
		loc.q = new query();
		loc.q.addParam(name="categoryID",value=categoryID,CFSQLTYPE="cf_sql_varchar");

        /* Category Data */
		loc.sql = 'SELECT * FROM category WHERE id=:categoryID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.categoryData = loc.result;
		
		return loc.categoryData;
	}

	/**
	 * Update Category
	 */ 
	public numeric function updateCategory(required struct formData){
		var loc = {};
		loc.rV = 0;
		
		loc.q = new query();
		loc.q.addParam(name="categoryID",value=arguments.formData.categoryID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="categoryTitle",value=arguments.formData.categoryTitle,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="categoryDescription",value=arguments.formData.categoryDescription,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="categoryPrice",value=arguments.formData.categoryPrice,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'SELECT * FROM category WHERE title=:categoryTitle AND id!=:categoryID';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        if(loc.result.recordcount EQ 1){
			return loc.rV;
		}

		loc.sql = 'UPDATE category SET title=:categoryTitle, description=:categoryDescription, price=:categoryPrice WHERE id=:categoryID';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}
	
	/**
	 * Delete Category
	 */ 
	public numeric function deleteCategory( required numeric categoryID ){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.sql = 'DELETE FROM category WHERE id="#categoryID#"';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		if(loc.rV GT 0){
			return loc.rV;
		}
	}
	
	
}