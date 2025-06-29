/**
 * The main module handler
 */

 component extends="Base"{

	property name="roomsService" inject="roomsService@admin";
    property name="categoryService" inject="categoryService@admin";
    
	
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	/**
	 * Add Room
	 */
	function addRoom( event, rc, prc ){
		prc.pageTitle = "Add Room";
		/* Category Data */
		prc.categoryData = variables.categoryService.category();
		event.setView( "rooms/addRoom" );
   	}

	/**
	 * Do Add Room
	 */
	function doAddRoom( event, rc, prc ){
		if(trim(rc.roomCategory) EQ "" OR trim(rc.roomName) EQ "" OR trim(rc.maxAdult) EQ "" OR trim(rc.maxChild) EQ "" OR trim(rc.roomDescription) EQ "" OR trim(rc.numberOfBed) EQ "" OR trim(rc.roomImage) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:rooms.addRoom" );
		}
		var result = variables.roomsService.addRoom( rc );

		if( result GT 0){
			variables.messagebox.success( "Room Added!!" );
		}else{
			variables.messagebox.error( "Room Already Exists!!" );
		}
		relocate(  "admin:rooms.addRoom" );
   	}

	/**
	 * Manage Room
	 */
	function manageRoom( event, rc, prc ){
		prc.pageTitle = "Manage Room";
		/* Room Data */
		prc.roomsData = variables.roomsService.room();
		event.setView( "rooms/manageRoom" );
   	}
	function editRoom( event, rc, prc ){
		prc.pageTitle = "Edit Room";
		/* Category Data */
		prc.categoryData = variables.categoryService.category();
		/* Room Data */
		prc.roomData = variables.roomsService.editRoom( rc.id );
		event.setView( "rooms/editRoom" );
   	}
	function updateRoom( event, rc, prc ){
		if(trim(rc.roomCategory) EQ "" OR trim(rc.roomName) EQ "" OR trim(rc.maxAdult) EQ "" OR trim(rc.maxChild) EQ "" OR trim(rc.roomDescription) EQ "" OR trim(rc.numberOfBed) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  event="admin:rooms.editRoom", queryString="id=#rc.roomID#" );
		}
		var result = variables.roomsService.updateRoom( rc );

		if( result GT 0){
			variables.messagebox.success( "Room Updated!!" );
		}else{
			variables.messagebox.error( "Room Already Exists!!" );
		}
		relocate(  "admin:rooms.manageRoom" );
   	}
	function deleteRoom( event, rc, prc ){
		var result = variables.roomsService.deleteRoom( rc.id );

		if( result GT 0){
			variables.messagebox.success( "Room Deleted!!" );
		}else{
			variables.messagebox.error( "Database Error!!" );
		}
		relocate(  "admin:rooms.manageRoom" );
   	}

}
