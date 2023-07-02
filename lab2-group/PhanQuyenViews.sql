use QLBongDa
go

grant select on [dbo].[vCau1] to [BDRead], [BDU03], [BDU04]
go

grant select on [dbo].[vCau2] to [BDRead], [BDU03], [BDU04]
go

grant select on [dbo].[vCau3] to [BDRead], [BDU03], [BDU04]
go

grant select on [dbo].[vCau4] to [BDRead], [BDU03]
go

grant select on [dbo].[vCau5] to [BDRead], [BDU01]
go

grant select on [dbo].[vCau6] to [BDRead], [BDU01]
go

grant select on [dbo].[vCau7] to [BDRead], [BDU01]
go

grant select on [dbo].[vCau8] to [BDRead], [BDU01]
go

grant select on [dbo].[vCau9] to [BDRead], [BDU01]
go

grant select on [dbo].[vCau10] to [BDRead], [BDU01]
go


---test--
---BDRead---
select* from vCau1
select* from vCau5

---BDU01---
select* from vCau2
select* from vCau10

---BDU03
select * from vCau1
select * from vCau2
select * from vCau3
select * from vCau4

---BDU04---
select * from vCau1
select * from vCau2
select * from vCau3
select * from vCau4
