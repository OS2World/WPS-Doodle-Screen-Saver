#                      -- Makefile to create EXE file --

#-----------------------------------------------------------------------------
# This section should be modified according to the target to build!
#-----------------------------------------------------------------------------
exename=Tester
object_files=Tester.obj

# Create debug build?
debug_build=defined

# Define the following if there is a resource file to be used, and also 
# define the (rcname) to the name of RC file to be used
has_resource_file=defined
rcname=Tester

# The result can be LXLite'd too
#create_packed_exe=defined

#-----------------------------------------------------------------------------
# The next part is somewhat general, for creation of EXE files.
#-----------------------------------------------------------------------------

!ifdef debug_build
debugflags = -d2 -dDEBUG_BUILD
cflags = $(debugflags) -bm -bt=OS2 -6s -fp6 -sg -wx
!else
debugflags =
cflags = $(debugflags) -bm -bt=OS2 -6s -fp6 -sg -otexanr -wx
!endif

.before
    set include=$(%os2tk)\h;$(%include);..\;

.extensions:
.extensions: .exe .obj .c

all : $(exename).exe

$(exename).exe: $(object_files)

.c.obj : .AUTODEPEND
    wcc386 $[* $(cflags)

.obj.exe : .AUTODEPEND
    wlink @$(exename)
!ifdef has_resource_file
    rc $(rcname) $(exename).exe
!endif
!ifdef create_packed_exe
    lxlite $(exename).exe
!endif
clean : .SYMBOLIC
        @if exist *.exe del *.exe
        @if exist *.obj del *.obj
        @if exist *.map del *.map
        @if exist *.res del *.res
        @if exist *.lst del *.lst
