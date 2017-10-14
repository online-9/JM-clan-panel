package cls{

	// Own imports
	import lib.*;
	import amf.*;
	import cls.*;

	public class Character extends Object {
		
		/* Character vars */

		public var AMF:*;
		
		public var fb_at:*;
		public var fb_uid:*;
		public var fb_sig:*;
		public var fb_name:*;
		public var time:*;
		public var hash_time:*;
		public var version:*;
		
		public var sessionkey:*;
		public var char_id:*;
		public var char_list:* = [];
		
		public var char_name:*;
		
		public var token:*;
		public var gold:*;

		public var clan_name:*;
		public var clan_id:*;

		public var stamina_item:*;
		public var stamina:*;
		public var max_stamina:*;

		public var petArray:*;
		public var exp:*;
		public var max_exp:*;

		public var mission:*;
		public var missionArray:* = [];
		
		public var msg:*= "Initial message";
		
		public var rank:*;
		
		public function Character(fb_at:*,fb_uid:*,fb_sig:*, version:*, char_id="") {
			// constructor code
			trace("new character :)");

			this.fb_at 		= fb_at;
			this.fb_uid 	= fb_uid;
			this.fb_sig 	= fb_sig;
			this.version 	= version;
			this.char_id 	= char_id;
			
			AMF 			= new amfConnect();
			//this.msg 		= "Character initialized. You may use the functions now..." ;
			//this.login();
		}
		
		public function login():void {
			var codec:* = "85224034668";
			var req:* = "16849899572db5d92caf92.35187695";
			var loc1:* = req+String(this.fb_uid)+"facebook"+String(this.version)+codec;
			var loc2:* = (new clientLibrary).getLoginHash(req,loc1);
			AMF.service("SystemService.snsLogin",[this.fb_uid,"facebook",this.version,req,loc2,this.fb_sig,this.fb_at,"en"], this.snsLoginResult);
		}
		
		public function snsLoginResult(e:Object):void {
			trace("func: snsLoginResult");
			if(e.error == 308) {
				this.msg = "Error 308";
			}
			else if (e.error == 102) {
				this.msg = "Error 102";
			}
			else {
				trace("Logged in.. sessionkey: " + String(e.result[3]));
				this.msg = "Logged in..";
				this.sessionkey = e.result[3];
				AMF.service("CharacterDAO.getCharactersList", [this.sessionkey], this.getCharbyID);
				this.msg = "Getting character list...";
			}
		}
		
		public function getCharbyID(e:Object):void{
			trace("func: getCharbyID");
			if(e.status == 0){
				this.msg = "Error loading character.";
			}
			else{
				if (this.char_id == "") {
					trace("Char id not specified, using 1st char... id: " + String(e.result[0][0]));
					this.msg = "Char id not specified, using 1st char...";
					this.char_id = e.result[0][0];
					AMF.service("CharacterDAO.getCharacterById", [this.sessionkey, int(this.char_id)], this.getCharbyIDdone);
				}
				else {
					AMF.service("CharacterDAO.getCharacterById", [this.sessionkey, int(this.char_id)], this.getCharbyIDdone);
				}
				
			}
		}
		
		public function getCharbyIDdone(e:Object) {
			trace("Done loading character. " );
			
			this.gold=e.result.character_gold;
			
			this.msg = "Done loading character.";
		}
	}
}
