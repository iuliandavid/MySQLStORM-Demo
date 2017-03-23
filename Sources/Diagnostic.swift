import StORM
import MySQLStORM

class Diagnostic: MySQLStORM {

    // Set some properties for the object
	// These properties are reflected in the database table
	// NOTE: First param in class should be the ID.
	var code			: String = ""
	var name    		: String = ""
	var entity_level	: Int? = 0
	var parent_code		: String = ""

    // The name of the database table
	override open func table() -> String { return "diagnostics" }


    // The mapping that translates the database info back to the object
	// This is where you would do any validation or transformation as needed
	override func to(_ this: StORMRow) {
		code				= this.data["code"] as? String				?? ""
		name		        = this.data["name"] as? String		?? ""
		entity_level		    = this.data["entity_level"] as? Int		?? 0
		parent_code		    = this.data["parent_code"] as? String			?? ""
	}

	// A simple iteration.
	// Unfortunately necessary due to Swift's introspection limitations
	func rows() -> [Diagnostic] {
		var rows = [Diagnostic]()
		for i in 0..<self.results.rows.count {
			let row = Diagnostic()
			row.to(self.results.rows[i])
			rows.append(row)
		}
		return rows
	}
}