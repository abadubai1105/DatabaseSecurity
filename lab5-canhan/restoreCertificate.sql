USE master
GO
create master key
encryption by password = '20120335'
OPEN MASTER KEY
DECRYPTION BY PASSWORD = '20120335'
use master
go
CREATE CERTIFICATE QLBongDa_Cert
FROM FILE = 'E:\bckup\QLBongDa_Cert.cer'
WITH PRIVATE KEY (
    FILE = 'E:\bckup\QLBongDaKey.pvk',
    DECRYPTION BY PASSWORD = '20120335'
);


