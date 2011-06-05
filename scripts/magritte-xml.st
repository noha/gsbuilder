| gofer |
gofer := Gofer new
        url: 'http://source.lukas-renggli.ch/magritte2addons/';
        package: 'Magritte-XMLBinding' constraint: [ :version |
                        version author = 'NorbertHartl' ];
        load.
Transcript show: 'loaded package', gofer model versions first info name.
