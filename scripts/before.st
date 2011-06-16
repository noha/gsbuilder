set user DataCurator pass swordfish gems $BUILD_NAME
display oops

iferror exit 3

login

run
MCPlatformSupport autoCommit: true.
MCPlatformSupport autoMigrate: true.
%
