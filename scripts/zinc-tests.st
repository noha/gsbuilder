run
Gofer new
        squeaksource: 'ZincHTTPComponents';
        package: 'ConfigurationOfZincHTTPComponents';
        load.
((Smalltalk at: #ConfigurationOfZincHTTPComponents) project latestVersion) load: 'Zinc-Tests'.

HDTestReport runPackages: #('Zinc-Tests').
%
