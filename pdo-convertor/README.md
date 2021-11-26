<br/><h3>PDO Convertor</h3>

<br/>a) What is this?
<ul>
<li>A simple tool to convert old gww.*Query function into new PDO functions.</li>
<li>The script automates all the manual task of copy pasting for you.</li>
<li>You just need to add a paramater array, add named paramters in sql and remove concatinating variables</li>
<li>Lastly verify and validate the changes.</li>
</ul>

<br/>b) What changes does this tool make?
1) Convert old gww functions to new functions
2) Remove gww_free_result function calls for you (in upcoming releases)
3) Convert gww_fetch_* functions (in while loops, conditions, etc) (in upcoming releases)


<br/>c) Steps to install PDO Convertor
1) clone this repository in ~/web/
<br/>`cd ~/web`
<br/>`git clone git@github.com:divyeshl/utility-scripts.git`
2) Put the following alias in your ~/.bashrc as Permenant Alias
<br/>`echo alias pdoConvertor2=\"perl \~/web/utility-scripts/pdo-convertor/pdoConvertor.pl\" >> ~/.bashrc`

<br/>d) Basic Tutorial
1) Get full path of file and run the command (eg. /home/{USERNAME}/web/.../file.php) {Alt + Enter in Eclipse to get full file path}
<br/>Basic syntax
<br/>`pdoConvertor2 /home/{USERNAME}/web/.../file.php {vertical name, for nettiauto, use auto}`
<br/>Example
<br/>`pdoConvertor2 /home/{USERNAME}/web/.../file.php auto`
2) A test file is included with the repository named testFile.txt, you can test the script on that file.
3) Don't forget to checkout testFile.txt after testing ;)
