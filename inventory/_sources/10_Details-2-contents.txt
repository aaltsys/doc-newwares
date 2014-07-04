Make_Unit::

   * defined by convention
   Unit<1,Un$Wt_UOM,row> = UM_Weight
   Unit<1,Un$In_UOM,row> = UM_Inner
   
   *defined by product
   Unit<1,Un$Un_Net,row> = Fact_Weight
   Unit<1,Un$Inner,row> = Fact_Pack
   Unit<1,Un$Un_Tare,row> = Unit_Tare
   Unit<1,Un$Un_UOM,row> = UM_Unit
   Unit<1,Un$Cn_UOM,row> = UM_Cont
   Unit<1,Un$Cn_Tare,row> = Cont_Grs - Cont_Net

   * defined by lot
   Unit<1,Un$Product,row> = Product
   Unit<1,Un$Control,row> = Control
   Fact_Store
   
   * defined by line
   Unit<1,Un$Status,row> = Status
   Unit<1,Un$Received,row> = Received
   Unit<1,Un$Document,row> = Document
   
   * defined by unit through calculation or serialization
   Unit<1,Un$Unit_ID,row> = Unit_Id
   Unit<1,Un$Description,row> = Description
   Unit<1,Un$Location,row> = Location
   Unit<1,Un$Content,row> = Content
   Unit<1,Un$Cn_Net,row> = Wt_Net
   Unit<1,Un$In_Wt,row> = Wt_Net / Fact_Pack
