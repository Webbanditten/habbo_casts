Base: V17 hh_room.cst

Modifications:

* Registered new command `SET_RANDOM_STATE` `314` required by the furni `val_randomizer`. 
* Registered new message `handle_trading_status_update` `1001` which allows you to dynamically from the server update the trading status in the room by sending either `1` or `0` to the client when updating the room category. 
  - This includes new methods in `Room Component Class`, `Room Interface Class`, `Room Handler Class`
