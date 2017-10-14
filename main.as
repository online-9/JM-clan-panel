package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import fl.data.*;
	import fl.controls.*;

	// Own imports
	import lib.*;
	import amf.*;
	import cls.*;


	public class main extends MovieClip
	{
		public function main()
		{
			// constructor code
			addFrameScript(4,this.startCP);
		}

		public var timer:Timer;
		public var charObj:Object = [];
		public var dataGrid:DataGrid;
		
		public var tableMc:Table;
		public var selectRow:*;

		function startCP():*
		{
			this.stop();
			trace("Hello world!");
			this["showInfoMc"].visible=false;
			
			this.tableMc = new Table(this["dataGrid"]); // Initialize
			this.tableMc.table.sortableColumns=false;
			this.tableMc.table.addEventListener(MouseEvent.CLICK, this.selectedRow);
			
			this["auto_addBtn"].addEventListener(MouseEvent.CLICK, this.auto_add_chars);
			this["manual_addBtn"].addEventListener(MouseEvent.CLICK, this.manual_add_chars);
			
			this["add_from_db_mc"].visible=false;
			this["add_from_db_mc"]["exit"].label = "X";
			this["add_from_db_mc"]["add_char"].label = "Add character(s)";
			this["add_from_db_mc"]["exit"].addEventListener(MouseEvent.CLICK,this.hidedbmc);
			this["add_from_db_mc"]["add_char"].addEventListener(MouseEvent.CLICK, this.auto_addchar);
			
			this["add_from_manual_mc"].visible=false;
			this["add_from_manual_mc"]["exit"].label = "X";
			this["add_from_manual_mc"]["exit"].addEventListener(MouseEvent.CLICK,this.hidedbmc);
			this["add_from_manual_mc"]["add_char"].label = "Add character(s)";
			this["add_from_manual_mc"]["add_char"].addEventListener(MouseEvent.CLICK, this.manual_addchar);
		}
		
		function hidedbmc(e:MouseEvent):void {
			this["add_from_manual_mc"].visible=false;
			this["add_from_db_mc"].visible=false;
		}
		
		function selectedRow(e:MouseEvent):void {
			trace(this.tableMc.table.selectedIndex);
			this.selectRow = this.tableMc.table.selectedIndex;
		}
		
		function loadChars(e:MouseEvent):void {
			trace("add chars!");
			this.tableMc.testadd(1,2,3,4,5,6,8);
			this.tableMc.testadd(5,6,100,3,12,1,0);
		}
		
		//----------------------------------------------------------------
		function auto_add_chars(e:MouseEvent):void {
			// From milos website
			this["add_from_db_mc"].visible=true;
		}
		
		function auto_addchar(e:MouseEvent):void {
			
		}
		
		//----------------------------------------------------------------
		function manual_add_chars(e:MouseEvent):void {
			// using normal fb_at stuff
			this["add_from_manual_mc"].visible=true;
		}
		
		var fb_at:*="";
		var fb_uid:*="";
		var fb_sig:*="";
		var char_id:*="";
		
		
		function manual_addchar(e:MouseEvent):void {
			this.showInfo("Some fields are blank!");
		}
		
		function showInfo(s:*):void {
			this["showInfoMc"].visible=true;
			this["showInfoMc"]["txt"].text = s;
			this.timer = new Timer(1000,1);
			this["showInfoMc"].addEventListener(TimerEvent.TIMER_COMPLETE, this.closeShowInfo);
			this.timer.start();
			trace("open!");
		}
		
		function closeShowInfo(e:TimerEvent):void {
			trace("close!");
			this["showInfoMc"].visible=false;
		}

	}
}