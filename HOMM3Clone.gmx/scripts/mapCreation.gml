/*
    Placeholder generation:
    32 x 32 map
    Row of water,
    14 rows of grass,
    1 row of water,
    14 rows of grass,
    1 row of water,
*/

script_execute(TestMap);
var height = MapController.height;
var width = MapController.width;
var mapString = string_digits(MapController.mapString);
var tileSize = 32;


var i = 0;
var j = 0;
var mapStringPosition = 0;
var tileCode = 0;
var tileObject = GrassTile;

for (i = 0; i < height; i += 1) {
    for (j = 0; j < width; j += 1) {
        mapStringPosition += 1;
        tileCode = real(string_char_at(mapString, mapStringPosition));
        switch (tileCode) {
            case 0: //Water
                tileObject = WaterTile;
                break;
            case 1: //Grass
                tileObject = GrassTile;
                break;
            default:
                tileObject = GrassTile;
                break; 
        }
        var mapID = instance_create(j * tileSize, i * tileSize, tileObject);
    }
}

instance_create(5 * tileSize, 8 * tileSize, Terra);

with (MapTile) {
     var neighbor = instance_position(x - tileSize, y, MapTile);
     west = neighbor;
     neighbor = instance_position(x + tileSize, y, MapTile);
     east = neighbor;
     neighbor = instance_position(x, y - tileSize, MapTile);
     north = neighbor;
     neighbor = instance_position(x, y + tileSize, MapTile);
     south = neighbor;
}
