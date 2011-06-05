"((Smalltalk at: #ConfigurationOfXMLSupport) project latestVersion) load: 'Tests'."

"Run xml support test"
HDTestReport runPackages: #('XML-Parser').
"HDLintReport runPackages: #('XML-Parser' 'XML-Writer')."
