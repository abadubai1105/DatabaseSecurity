use QLBongDa
go

grant exec on [dbo].[SPCau1] to [BDRead], [BDU03], [BDU04]
go

grant exec on [dbo].[SPCau2] to [BDRead], [BDU03], [BDU04]
go

grant exec on [dbo].[SPCau3] to [BDRead], [BDU03], [BDU04]
go

grant exec on [dbo].[SPCau4] to [BDRead], [BDU03]
go

grant exec on [dbo].[SPCau5] to [BDRead], [BDU01]
go

grant exec on [dbo].[SPCau6] to [BDRead], [BDU01]
go

grant exec on [dbo].[SPCau7] to [BDRead], [BDU01]
go

grant exec on [dbo].[SPCau8] to [BDRead], [BDU01]
go

grant exec on [dbo].[SPCau9] to [BDRead], [BDU01]
go

grant exec on [dbo].[SPCau10] to [BDRead], [BDU01]
go



---test--
---BDRead---
EXEC SPCau1 N'SHB Đà Nẵng', N'Brazil' 
EXEC SPCau9 3, 2009, 1 

---BDU01---

EXEC SPCau3 N'Việt Nam'
EXEC SPCau10 3, 2009, 5 

---BDU03

EXEC SPCau1 N'SHB Đà Nẵng', N'Brazil'
EXEC SPCau10 3, 2009 
EXEC SPCau3 N'Việt Nam'
EXEC SPCau4 N'Việt Nam'

---BDU04---

EXEC SPCau1 N'SHB Đà Nẵng', 'Brazil'
EXEC SPCau10 3, 2009 
EXEC SPCau3 N'Việt Nam' 
EXEC SPCau4 N'Việt Nam'

