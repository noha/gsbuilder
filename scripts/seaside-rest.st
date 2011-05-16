run
Gofer new
	squeaksource: 'Seaside30Addons';
	package: 'Seaside-REST-Core' constraint: [ :version |
                        version versionNumber = 4 ];
	package: 'Seaside-GemStone-REST-Core' constraint: [ :version |
                        version versionNumber = 1 ];
	load.
%
