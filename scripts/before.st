set user DataCurator pass swordfish gems $BUILD_NAME
display oops

iferror where

login

run
MCPlatformSupport autoCommit: true.
MCPlatformSupport autoMigrate: true.
%
