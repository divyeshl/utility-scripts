#! /bin/perl -w -0777

# fetch filename & vertical
$filePath = $ARGV[0];
$vertical = $ARGV[1]  || "VERTICAL-TO-CONVERT";

# open file, store in a variable and close
open(IN, "<", $filePath) or die "could not open file";
$string = <IN>;
close IN;

# perform operation on stored variable
$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwMasterGetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::netti${vertical}Master\(\)\->select\(\$sql, \[\], \$params, \\PDO::FETCH_XXX\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwSlaveGetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::netti${vertical}Slave\(\)\->select\(\$sql, \[\], \$params, \\PDO::FETCH_XXX\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwMasterSetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::netti${vertical}Master\(\)\->update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)(gwwMasterSetQuery)\(([^;]+)\)\;$/$1\$sql = $3;\n$1DB::netti${vertical}Master\(\)\->update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwNettiXQuery)\(\s*([^;]+)\s*,\s*([^;]+)\s*\)\;$/$1\$sql = $5;\n$1\$result = DB::nettixMaster\($6\)\->select\-update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwNettiXSlaveQuery)\(\s*([^;]+)\s*,\s*([^;]+)\s*\)\;$/$1\$sql = $5;\n$1\$result = DB::nettixSlave\($6\)\->select\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)(gwwNettiXQuery)\(\s*([^;]+)\s*,\s*([^;]+)\s*\)\;$/$1\$sql = $3;\n$1\$result = DB::nettixMaster\($4\)\->select\-update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwUserMasterGetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::nettiCommonMaster\(\)\->select\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwUserMasterSetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::nettiCommonMaster\(\)\->update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)(gwwUserMasterSetQuery)\(([^;]+)\)\;$/$1\$sql = $3;\n$1\$result = DB::nettiCommonMaster\(\)\->update\-delete\-insert\(\$sql, \[\], \$params\);/gm;

$string =~ s/(?s)^(\s*)([a-zA-Z0-9_\$]+)( = )(gwwUserSlaveGetQuery)\(([^;]+)\)\;$/$1\$sql = $5;\n$1\$result = DB::nettiCommonSlave\(\)\->select\(\$sql, \[\], \$params\);/gm;

# open file for writing
open(OUT, ">", $filePath);
print OUT $string;
close(OUT);

