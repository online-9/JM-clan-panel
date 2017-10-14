package cls
{

	import fl.data.*;
	import flash.events.*;
	import fl.controls.DataGrid;

	// Own imports
	import lib.*;
	import amf.*;
	import cls.*;


	public class Table extends Object
	{

		public var table:DataGrid;
		

		public function Table(table:*)
		{
			// constructor code
			trace("new table :)");

			//this["dataGrid"].removeAllColumns();
			//this["dataGrid"].removeAll();
			//this["dataGrid"].move(10,10);
			//this["dataGrid"].setSize(300, 100);

			this.table = table;
			this.table.columns = ["#","Name","ID", "Clan", "Token", "Stamina", "Message"]; // Initialize table
			
			//this.table.addEventListener(MouseEvent.CLICK, this.selectDataGrid);
		}
		
		function initializeTestTable():void {
			// TEST TABLE
			this.table.columns = ["Name","Age","Job"];
			this.table.columns[0].width = 100;
			this.table.columns[1].width = 50;
			this.table.columns[2].width = 150;

			var myData:Array = [{Name: "John Jenkins", Age: "31", Job: "Shop manager"},
			{Name: "Anna Watson", Age: "28", Job: "Doctor"},
			{Name: "Susan McCallister", Age: "29", Job: "Chef"},
			{Name: "Joe Thompson", Age:"32", Job: "Janitor"},
			{Name: "Bob Anderson", Age:"31", Job: "Bank assistant"}];
			//
			this.table.dataProvider = new DataProvider(myData);
			
		}
		
		//--------- Adding characters to list -----------------------------------------
		public function addCharToList(char:Character):void {
			this.table.addItem({"#" : char.rank,
							   "Name" : char.char_name,
							   "ID" : char.char_id,
							   "Clan" : char.clan_name,
							   "Token" : char.token,
							   "Stamina" : String(char.stamina + "" + char.max_stamina),
							   "Message" : char.msg});
							   
		}
		
		public function testadd(s1:*,s2:*,s3:*,s4:*,s5:*,s6:*,s7:*):void {
			this.table.addItem({"#" : s1,
							   "Name" : s2,
							   "ID" : s3,
							   "Clan" : s4,
							   "Token" : s5,
							   "Stamina" : s6,
							   "Message" : s7});
		}
		
		//-----------------------------------------------------------------------------

		//--------- Remove characters from list -----------------------------------------
		function removeChar(char:Character):void {
			
		}
		//-------------------------------------------------------------------------------
		
		//--------- Update characters from list -----------------------------------------
		function updateChar(char:Character):void {
			
		}
		//-------------------------------------------------------------------------------
	}

}