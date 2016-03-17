@echo off

SET asdocPath="C:\Program Files (x86)\Adobe\Flex Builder 3\sdks\3.4.1\bin\asdoc.exe"

%asdocPath% -source-path "E:\framework\rtmpconnection"   -doc-sources "E:\framework\rtmpconnection" -output doc -main-title "RTMPConnection API" -window-title "RTMPConnection Library"

@pause