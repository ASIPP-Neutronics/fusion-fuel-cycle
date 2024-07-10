import os
#tep_T = os.popen("~/projects/moose/framework/contrib/hit/hit find Openmodelica/tep/T ~/opt/moose_to_om/hitplus/learn.i")
#tep_t = int(tep_T.readline().split("= ", -1)[1].strip('\n'))
#print(tep_T.readline())
# os.system("~/projects/moose/framework/contrib/hit/hit find Openmodelica/tep/T ~/opt/moose_to_om/learn.i")
#subsys = os.popen("~/opt/moose_to_om/hitplus/hitplus output Openmodelica ~/opt/moose_to_om/hitplus/learn.i")
#print(subsys.readline())
with os.popen("~/opt/moose_to_om/hitplus/hitplus output Openmodelica ~/opt/moose_to_om/hitplus/learn.i") as f:
    subsystems = f.readlines()[-1].split("_")
    subsystems.pop()

def WritingSubsystem(subsystem):
    with os.popen(f"~/opt/moose_to_om/hitplus/hitplus output Openmodelica/{subsystem} ~/opt/moose_to_om/hitplus/learn.i") as f:
        parameters = f.readlines()[-1].split("_")
        parameters.pop()
    for para in parameters:
        with os.popen(f"~/opt/moose_to_om/hitplus/hitplus find Openmodelica/{subsystem}/{para} ~/opt/moose_to_om/hitplus/learn.i") as f:
            