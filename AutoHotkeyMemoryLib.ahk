if (A_PtrSize != 4)
{
	MsgBox, You are not running 32-bit version of Autohotkey L, reinstall correct version. Script will now terminate.
	ExitApp	
}
GetModuleInfo(ModuleName, PID, byRef mBase="", byRef mSize="")
{
    TH32CS_SNAPMODULE := 0x00000008
    INVALID_HANDLE_VALUE = -1
    VarSetCapacity(me32, 548, 0)
    NumPut(548, me32)
	
    snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", TH32CS_SNAPMODULE, "Uint", PID)
	
    If (snapMod = INVALID_HANDLE_VALUE) {
        Return 0
    }
	
    If (DllCall("Module32First", "Uint", snapMod, "Uint", &me32)){
		
		If StrGet(&me32 + 32, "cp0")=ModuleName
		{
                mBase:=NumGet(&me32 + 20)
				mSize:=NumGet(&me32 + 24)
                DllCall("CloseHandle", "UInt", snapMod)
				Return

		}
				
        while(DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)) 
		{
            If StrGet(&me32 + 32, "cp0")=ModuleName
			{
                mBase:=NumGet(&me32 + 20)
				mSize:=NumGet(&me32 + 24)
                DllCall("CloseHandle", "UInt", snapMod)
                Return
            }
        }
    }
	
    DllCall("CloseHandle", "Uint", snapMod)
}

GetProcessHandle(pid)
{
	return DllCall("OpenProcess", "UInt", 0x8|0x10|0x20, "UInt", 0, "UInt", pid, "UInt")
}

ReadMemFloat(ProcessHandle, MADDRESS) 
{
	if DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Float*",MVALUE,"UInt",4,"UInt*",0)!=0
	{
		return MVALUE
	}	
}

ReadMemUInt(ProcessHandle, MADDRESS) 
{ 
	if DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"UInt*",MVALUE,"UInt",4,"UInt*",0)!=0
	{
		return MVALUE
	}	
}

ReadMemSInt(ProcessHandle, MADDRESS) 
{ 
	if DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Int*",MVALUE,"UInt",4,"UInt*",0)!=0
	{
		return MVALUE
	}	
}

WriteMemUInt(ProcessHandle, MADDRESS, val) 
{ 
	DllCall("WriteProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"UInt*",val,"UInt",4,"UInt*",0)!=0
}

WriteMemSInt(ProcessHandle, MADDRESS, val) 
{ 
	DllCall("WriteProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Int*",val,"UInt",4,"UInt*",0)!=0
}

WriteMemFloat(ProcessHandle, MADDRESS, val) 
{ 
	DllCall("WriteProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Float*",val,"UInt",4,"UInt*",0)!=0
}

ReadMemStr(ProcessHandle, MADDRESS, maxlen=255, cp="cp0") 
{ 
	
	VarSetCapacity(MVALUE,maxlen)
	
	if DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"PTR",&MVALUE,"UInt",maxlen,"UInt*",bytesread)!=0
	{
		Str:=StrGet(&MVALUE,cp)
		VarSetCapacity(MVALUE,0)
		return Str
	}
	
	VarSetCapacity(MVALUE,0)	
}

GetMultilevelPointer(ProcessHandle, PARRAY)
{		
	if PARRAY._MaxIndex()<2
		return
	
	if (DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",PARRAY[1],"UInt*",currOffset,"UInt",4,"UInt*",0)!=0)	
	{

		i:=2
		while (i<=PARRAY._MaxIndex() && DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",currOffset+PARRAY[i],"UInt*",currOffset,"UInt",4,"UInt*",0)!=0)
		{
			i:=i+1
		}
		
		if (i>PARRAY._MaxIndex())
		{
			return currOffset
		}
	}
}

AobScan(ProcessHandle,mBase,mSize, ByRef patternArray)
{
	if (patternArray._MaxIndex()>mSize)
	{
		MsgBox, aobscan fail : pattern array is larger than module size
		return
	}

	VarSetCapacity(ClientCodeSegment,mSize)
	
	if (DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",mBase,"PTR",&ClientCodeSegment,"UInt",mSize,"UInt*",bytesread)!=0)
	{
		
		pLen:=patternArray._MaxIndex()		
		if (bytesread<>mSize)
		{
			VarSetCapacity(ClientCodeSegment,0)
			MsgBox, aobscan fail : mSize=%mSize%  bytesread=%bytesread%
			return
		}		
		i:=0
		
		while (i<=mSize-pLen-1)
		{
			j:=1
			while (j<=pLen)
			{
				if (patternArray[j]="?" || NumGet(ClientCodeSegment, i+j-1, "UChar")=patternArray[j])
				{
					j:=j+1
				}
				else
				{
					break
				}
			}
			
			if (j>pLen)
			{
				VarSetCapacity(ClientCodeSegment,0)
				return i
			}
			i:=i+1			
		}	
	}
	MsgBox, aobscan fail : pattern not found
	VarSetCapacity(ClientCodeSegment,0)
}
