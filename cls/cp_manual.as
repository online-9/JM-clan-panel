package cls {
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	// Own imports
	import lib.*;
	import amf.*;
	import cls.*;
	
	public class cp_manual extends Object {
		
		public var character:Object;
		
		public var timer:Timer;
		public var enemy_clan_id:*;
		public var enemy_clan:*;
		public var enemyChar:*
		public var code:* = "907672";
		
		public var AMF:*;
		
		public var status:* = "Initial Status";
		public var msg:* = "Initial Message";
		
		public function cp_manual(oChar:*) {
			trace("new cp :)");
			this.character = oChar;
			//trace(o.msg);
			AMF=new amfConnect();
		}
		
		//-------- Load clan ---------------------------------------------
		public function loadClan():void {
			trace("func: loadClan");
			AMF.service("ClanService.getClanStatus",[this.character.sessionkey], this.loadClanResult);
		}
		function loadClanResult(e:Object):void {
			trace("func: loadClanResult");
			AMF.service("ClanService.getClan", [this.character.sessionkey], this.getClanResult);
		}
		
		function getClanResult(e:Object):void {
			trace("func: getClanResult " + String(e.result));
			if(e.status == 0){
				//this["msg"].text = "Error " + e.error;
			}
			else if(e.result == 0){
				//this["msg"].text = "Char don\'t have a clan";
			}
			//else if(e.server_time > "1483142400"){
				//this["msg"].text = "Expired";
			//}
			else if (e.result == 1){
				//if(e.clan_data.id == "100196"){
					this.character.clan_name 	= e.clan_data.name;
					this.character.clan_id 		= e.clan_data.id;
					this.character.stamina 		= e.clan_data.character_stamina;
					this.character.max_stamina	= e.clan_data.character_max_stamina;
					//this.character.stamina_item = e.result.stamina_item;				// FIX here
					this.fileCheck();
				//}else{
					//this["msg"].text = "Error " + e.error;
				//}
			}
			//else {}
		}
		
		function fileCheck():void
		{
			trace("func: fileCheck");
			var loc1:* = String(this.character.version);
			var fileCheckArray:* = new Array([(("https://ns-static-bwhcb6a5289.netdna-ssl.com/swf/" + loc1) + "/swf/panels/clan_panel.swf"), int(this.code),int(this.code), Boolean(true), int(10), int(3), Object]);
			var loc2:* = (new clientLibrary).getHash(this.character.sessionkey, "" + fileCheckArray[0][0]);
			AMF.service("FileChecking.checkHackActivity", [this.character.sessionkey, fileCheckArray, loc2], this.fileCheckResult1);
		}
		
		function fileCheckResult1(e:Object):void{
			trace("func: fileCheckResult1 " + String(e.status));
			if(e.status == 0){
				//this["msg"].text = "Error " + e.error;
			}else{
				//this["msg"].text = "File check completed";
				//if (this.enemy_clan_id != null ) {
					//this.startAttack();
				//}
			}
		}
		//----------------------------------------------------------------
		
		
		var amfSeq = 0;
		
		function updateSequence():String{
			this.amfSeq++;
			var hash:* = (new clientLibrary).getHash(this.character.sessionkey, String(this.amfSeq) );
			return hash;
		}
		
		
		//-------- Attack ------------------------------------------------
		//----------------------------------------------------------------
		
		
		
		//-------- Restore ------------------------------------------------
		//-----------------------------------------------------------------
		
		//-------- Update visuals -----------------------------------------
		//-----------------------------------------------------------------
	}
}