cl /I.\ /I..\..\..\..\Framework\Headers /I..\..\..\..\Modules\SharedHeaders /GR /EHsc /MT /D OV_DEBUG /FeOVIMGeneric.DLL /D WIN32 /LD ..\..\..\..\Modules\OVIMGeneric\*.cpp ..\..\..\..\Modules\SharedSource\*.cpp /link /DEF:..\..\OVModule.DEF
pause