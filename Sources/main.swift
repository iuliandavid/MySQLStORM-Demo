//
//  main.swift
//  MySQLStORM Demo
//
//  Created by Jonathan Guthrie on 2017-01-10.
//
//


import StORM
import MySQLStORM

// Set the connection properties
// Change to suit your specific environment
MySQLConnector.host		= "192.168.39.6"
MySQLConnector.username	= "iuli"
MySQLConnector.password	= "mypass"
MySQLConnector.database	= "swift_test"
MySQLConnector.port		= 3306


// Instantiate the table via "setup"
let obj = User()
let diagnostic = User()
try? obj.setup()
try? diagnostic.setup()



/*	===========================================================
	Create actions
===========================================================  */

// Standard Save
do {
	let _ = try saveNew()
} catch {
	print("\(error)")
}

// Direct Create
do {
	let _ = try saveCreate()
} catch {
	print("\(error)")
}

// Insert the long way
do {
	let _ = try insertDemo()
} catch {
	print("\(error)")
}

// insert another long way
do {
	let _ = try insertDemoColumns()
} catch {
	print("\(error)")
}




/*	===========================================================
	Update actions
===========================================================  */

// Standard Update
do {
	let _ = try saveUpdate()
} catch {
	print("\(error)")
}

// long for Update action
do {
	let _ = try saveUpdateLongForm()
} catch {
	print("\(error)")
}


/*	===========================================================
	Find / Select actions
===========================================================  */

// get by id
do {
	let _ = try getByID()
} catch {
	print("\(error)")
}

// perform a find
do {
	let _ = try findByStringAny()
} catch {
	print("\(error)")
}

// perform a find
do {
	let diagnostic = try findDiagnosticByStringAny()
	print("diagnostic found \(diagnostic)")
} catch {
	print("\(error)")
}
// perform a select
do {
	let _ = try findBySelect()
} catch {
	print("\(error)")
}



/*	===========================================================
	Delete actions
===========================================================  */

// deleting an object
do {
	let _ = try deleteObject()
} catch {
	print("\(error)")
}

// deleting an object by id reference
do {
	let _ = try deleteObjectByID()
} catch {
	print("\(error)")
}

