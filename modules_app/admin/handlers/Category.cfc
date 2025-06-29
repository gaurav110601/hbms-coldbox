/**
 * The main module handler
 */

 component extends="Base"{

	property name="categoryService" inject="categoryService@admin";
    
	
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	/**
	 * Add Category
	 */
	function addCategory( event, rc, prc ){
		prc.pageTitle="Add Category";
		event.setView( "category/addCategory" );
   	}
	function doAddCategory( event, rc, prc ){
		if(trim(rc.categoryTitle) EQ "" OR trim(rc.categoryDescription) EQ "" OR trim(rc.categoryPrice) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:category.addCategory" );
		}
		var result = variables.categoryService.addCategory( rc );

		if( result GT 0){
			variables.messagebox.success( "Category Added!!" );
		}else{
			variables.messagebox.error( "Category Already Exists!!" );
		}
		relocate(  "admin:category.addCategory" );
   	}

	/**
	 * Manage Category
	 */
	function manageCategory( event, rc, prc ){
		prc.pageTitle="Manage Category";
		prc.categoryData = variables.categoryService.category();
		event.setView( "category/manageCategory" );
   	}
	function editCategory( event, rc, prc ){
		prc.pageTitle = "Edit Category";
		/* Category Data */
		prc.categoryData = variables.categoryService.editcategory(rc.id);
		event.setView( "category/editCategory" );
   	}
	function updateCategory( event, rc, prc ){
		if(trim(rc.categoryTitle) EQ "" OR trim(rc.categoryDescription) EQ "" OR trim(rc.categoryPrice) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  event="admin:category.editCategory", queryString="id=#rc.categoryID#" );
		}
		var result = variables.categoryService.updateCategory( rc );

		if( result GT 0){
			variables.messagebox.success( "Category Updated!!" );
		}else{
			variables.messagebox.error( "Category Already Exists!!" );
		}
		relocate(  "admin:category.manageCategory" );
   	}
	function deleteCategory( event, rc, prc ){
		var result = variables.categoryService.deleteCategory( rc.id );

		if( result GT 0){
			variables.messagebox.success( "Category Deleted!!" );
		}else{
			variables.messagebox.error( "Database Error!!" );
		}
		relocate(  "admin:category.manageCategory" );
   	}

}
