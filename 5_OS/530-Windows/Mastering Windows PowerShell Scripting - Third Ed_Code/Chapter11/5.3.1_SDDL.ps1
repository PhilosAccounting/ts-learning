(Get-Acl C:\).GetSecurityDescriptorSddlForm('All')

# Expects similar to:
#
# O:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464G:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464D:PAI(A;;LC;;;AU)(A;OICIIO;SDGXGWGR;;;AU)(A;;FA;;;SY)(A;OICIIO;GA;;;SY)(A;OICIIO;GA;;;BA)(A;;FA;;;BA)(A;OICI;0x1200a9;;;BU)