{
  description = ''Web Technologies based Crossplatform GUI Framework'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-crowngui-v0_2_8.flake = false;
  inputs.src-crowngui-v0_2_8.ref   = "refs/tags/v0.2.8";
  inputs.src-crowngui-v0_2_8.owner = "bung87";
  inputs.src-crowngui-v0_2_8.repo  = "crowngui";
  inputs.src-crowngui-v0_2_8.type  = "github";
  
  inputs."regex".owner = "nim-nix-pkgs";
  inputs."regex".ref   = "master";
  inputs."regex".repo  = "regex";
  inputs."regex".dir   = "v0_19_0";
  inputs."regex".type  = "github";
  inputs."regex".inputs.nixpkgs.follows = "nixpkgs";
  inputs."regex".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."xlsx".owner = "nim-nix-pkgs";
  inputs."xlsx".ref   = "master";
  inputs."xlsx".repo  = "xlsx";
  inputs."xlsx".dir   = "0_4_5";
  inputs."xlsx".type  = "github";
  inputs."xlsx".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xlsx".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."static_server".owner = "nim-nix-pkgs";
  inputs."static_server".ref   = "master";
  inputs."static_server".repo  = "static_server";
  inputs."static_server".dir   = "v2_2_1";
  inputs."static_server".type  = "github";
  inputs."static_server".inputs.nixpkgs.follows = "nixpkgs";
  inputs."static_server".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."jsonschema".owner = "nim-nix-pkgs";
  inputs."jsonschema".ref   = "master";
  inputs."jsonschema".repo  = "jsonschema";
  inputs."jsonschema".dir   = "master";
  inputs."jsonschema".type  = "github";
  inputs."jsonschema".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jsonschema".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."objc_runtime".owner = "nim-nix-pkgs";
  inputs."objc_runtime".ref   = "master";
  inputs."objc_runtime".repo  = "objc_runtime";
  inputs."objc_runtime".dir   = "v0_1_3";
  inputs."objc_runtime".type  = "github";
  inputs."objc_runtime".inputs.nixpkgs.follows = "nixpkgs";
  inputs."objc_runtime".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."darwin".owner = "nim-nix-pkgs";
  inputs."darwin".ref   = "master";
  inputs."darwin".repo  = "darwin";
  inputs."darwin".dir   = "master";
  inputs."darwin".type  = "github";
  inputs."darwin".inputs.nixpkgs.follows = "nixpkgs";
  inputs."darwin".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-crowngui-v0_2_8"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-crowngui-v0_2_8";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}