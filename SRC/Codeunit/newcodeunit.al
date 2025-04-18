// codeunit 50002 "Event SubscriberN"
// {
//     trigger OnRun()
//     begin
//     end;






// // ##################################################################################
//     //...........................................Sales invoice line To Posted Sales Invoice Line......................................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvLineInsert', '', false, false)]
//     local procedure OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PostingSalesLine: Record "Sales Line"; SalesShipmentHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; var ReturnReceiptHeader: Record "Return Receipt Header")
//     begin
//         SalesInvLine."Additional Discount %" := SalesLine."Additional Discount %";
//         SalesInvLine."OEM Std. Packing" := SalesLine."OEM Std. Packing";
//         SalesInvLine."Domestic Std. Packing" := SalesLine."Domestic Std. Packing";
//         SalesInvLine."Export Std. Packing" := SalesLine."Export Std. Packing";
//         SalesInvLine.QPB := SalesLine.QPB;
//         SalesInvLine.Box := SalesLine.Box;
//         SalesInvLine.Loose := SalesLine.Loose;
//     end;
//     //...........................................Sales invoice line To Posted Sales Invoice Line......................................................................


//     //...........................................Sales invoice Header To Posted Sales Invoice Header..................................................................

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', false, false)]
//     local procedure OnAfterSalesInvHeaderInsert(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header"; PreviewMode: Boolean)
//     begin
//         SalesInvHeader."Shipping Marking Code" := SalesHeader."Shipping Marking Code";
//         SalesInvHeader."No. of Box" := SalesHeader."No. of Box";
//         SalesInvHeader."Freight Type" := SalesHeader."Freight Type";
//         SalesInvHeader."Booking Station" := SalesHeader."Booking Station";
//         SalesInvHeader."Work Description1" := SalesHeader."Work Description1";
//         SalesInvHeader.Remarks := SalesHeader."Work Description1";
//         SalesInvHeader."External Doument Date" := SalesHeader."External Doument Date";
//         SalesInvHeader."Transporter name" := SalesHeader."Agent Name.";
//         SalesInvHeader."Total No. of Box2" := SalesHeader."Total No. of Box2";
//         SalesInvHeader."Transporter vehicle No." := SalesHeader."Transporter vehicle No.";
//         SalesInvHeader."LR Date" := SalesHeader."LR Date";
//         SalesInvHeader."LR No." := SalesHeader."LR No.";

//     end;
//     //...........................................Sales invoice Header To Posted Sales Invoice Header..................................................................


//     //...........................................sales Line To Sales shipment line...................................................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesShptLineInsert', '', false, false)]
//     local procedure OnBeforeSalesShptLineInsert(var SalesShptLine: Record "Sales Shipment Line"; SalesShptHeader: Record "Sales Shipment Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; PostedWhseShipmentLine: Record "Posted Whse. Shipment Line"; SalesHeader: Record "Sales Header"; WhseShip: Boolean; WhseReceive: Boolean; ItemLedgShptEntryNo: Integer; xSalesLine: record "Sales Line"; var TempSalesLineGlobal: record "Sales Line" temporary; var IsHandled: Boolean)
//     begin
//         SalesShptLine."Additional Discount %" := SalesLine."Additional Discount %";
//         SalesShptLine."Shipping Marking Code" := SalesLine."Shipping Marking Code";
//         SalesShptLine."Freight Type" := SalesLine."Freight Type";
//         SalesShptLine."Booking Station" := SalesLine."Booking Station";
//         SalesShptLine."Customer Segment" := SalesLine."Customer Segment";
//         SalesShptLine."No. of Box" := SalesLine."No. of Box";
//         SalesShptLine."OEM Std. Packing" := SalesLine."OEM Std. Packing";
//         SalesShptLine."Domestic Std. Packing" := SalesLine."Domestic Std. Packing";
//         SalesShptLine."Export Std. Packing" := SalesLine."Export Std. Packing";
//         SalesShptLine.QPB := SalesLine.QPB;
//         SalesShptLine.Box := SalesLine.Box;
//         SalesShptLine.Loose := SalesLine.Loose;
//     end;
//     //...........................................sales Line To Sales shipment line...................................................................................

//     //...........................................Sales Line to Warehouse Shipment Line...............................................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", OnAfterInitNewWhseShptLine, '', false, false)]
//     local procedure "Whse.-Create Source Document_OnAfterInitNewWhseShptLine"(var WhseShptLine: Record "Warehouse Shipment Line"; WhseShptHeader: Record "Warehouse Shipment Header"; SalesLine: Record "Sales Line"; AssembleToOrder: Boolean)
//     begin
//         // Filter Sales Lines related to the Warehouse Shipment Header
//         WhseShptLine.QPB := 0;
//         WhseShptLine.Box := 0;
//         WhseShptLine.Loose := 0;
//         SalesLine.Reset();
//         SalesLine.SetRange("Document No.", WhseShptLine."Source No.");
//         SalesLine.SetRange("No.", WhseShptLine."Item No.");
//         // SalesLine.SetRange("Line No.",WhseShptLine.);
//         if SalesLine.FindFirst() then
//             repeat

//                 WhseShptLine.QPB := SalesLine.QPB;
//                 WhseShptLine.Box := SalesLine.Box;
//                 WhseShptLine.Loose := SalesLine.Loose;
//                 WhseShptLine."Domestic Std. Packing" := SalesLine."Domestic Std. Packing";
//                 WhseShptLine."Export Std. Packing" := SalesLine."Export Std. Packing";
//                 WhseShptLine."OEM Std. Packing" := SalesLine."OEM Std. Packing";
//             until SalesLine.Next() = 0;
//     end;
//     // end;
//     //...........................................Sales Line to Warehouse Shipment Line...............................................................................



//     //...........................................Warehouse Shipment Line to Posted Sales Shipment Line...............................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnCheckPostWhseShptLinesOnAfterWhseShptLinesFound', '', true, true)]
//     local procedure OnCheckPostWhseShptLinesOnAfterWhseShptLinesFound(var SalesShipmentLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; var WhseShptLinesFound: Boolean; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; WarehouseReceiptHeader: Record "Warehouse Receipt Header"; WhseShip: Boolean; WhseReceive: Boolean; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
//     begin
//         SalesShipmentLine."OEM Std. Packing" := WarehouseShipmentLine."OEM Std. Packing";
//         SalesShipmentLine."Domestic Std. Packing" := WarehouseShipmentLine."Domestic Std. Packing";
//         SalesShipmentLine."Export Std. Packing" := WarehouseShipmentLine."Export Std. Packing";
//         SalesShipmentLine.QPB := WarehouseShipmentLine.QPB;
//         SalesShipmentLine.Box := WarehouseShipmentLine.Box;
//         SalesShipmentLine.Loose := WarehouseShipmentLine.Loose;

//     end;
//     //...........................................Warehouse Shipment Line to Posted Sales Shipment Line...............................................................



//     //...........................................Warehouse Shipment Header to Posted Sales Shipment Header...........................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesShptHeaderInsert, '', false, false)]
//     local procedure OnBeforeSalesShptHeaderInsert(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; WhseShip: Boolean; InvtPickPutaway: Boolean);
//     begin
//         SalesShptHeader."No. of (Boxes.)" := TempWhseShptHeader."No. of (Boxes.)";
//         SalesShptHeader."No. of Boxes(Loose)" := TempWhseShptHeader."No. of Boxes(Loose)";
//         SalesShptHeader."Total No. of Boxes" := TempWhseShptHeader."Total No. of Boxes";
//         SalesShptHeader."Transporter name" := TempWhseShptHeader."Transporter name";
//         SalesShptHeader."Transporter vehicle No." := TempWhseShptHeader."Transporter vehicle No.";
//         SalesShptHeader."LR Date" := TempWhseShptHeader."LR Date";
//         SalesShptHeader."LR No." := TempWhseShptHeader."LR No.";


//     end;
//     //...........................................Warehouse Shipment Header to Posted Sales Shipment Header...........................................................



//     //...........................................Warehouse Shipment Header to Posted Warehouse Shipment Header.......................................................

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforePostedWhseShptHeaderInsert', '', false, false)]
//     local procedure OnBeforePostedWhseShptHeaderInsert(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
//     begin
//         PostedWhseShipmentHeader."No. of (Boxes.)" := WarehouseShipmentHeader."No. of (Boxes.)";
//         PostedWhseShipmentHeader."No. of Boxes(Loose)" := WarehouseShipmentHeader."No. of Boxes(Loose)";
//         PostedWhseShipmentHeader."Total No. of Boxes" := WarehouseShipmentHeader."Total No. of Boxes";
//         PostedWhseShipmentHeader."Transporter name" := WarehouseShipmentHeader."Transporter name";
//         PostedWhseShipmentHeader."Transporter vehicle No." := WarehouseShipmentHeader."Transporter vehicle No.";
//         PostedWhseShipmentHeader."LR Date" := WarehouseShipmentHeader."LR Date";
//         PostedWhseShipmentHeader."LR No." := WarehouseShipmentHeader."LR No.";
//     end;
//     //...........................................Warehouse Shipment Header to Posted Warehouse Shipment Header.......................................................



//     //...........................................Warehouse Shipment Line to Posted Warehouse Shipment Line...........................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnAfterInitPostedShptLine', '', false, false)]
//     local procedure OnAfterInitPostedShptLine(var WhseShipmentLine: Record "Warehouse Shipment Line"; var PostedWhseShipmentLine: Record "Posted Whse. Shipment Line")
//     begin
//         PostedWhseShipmentLine."OEM Std. Packing" := WhseShipmentLine."OEM Std. Packing";
//         PostedWhseShipmentLine."Domestic Std. Packing" := WhseShipmentLine."Domestic Std. Packing";
//         PostedWhseShipmentLine."Export Std. Packing" := WhseShipmentLine."Export Std. Packing";
//         PostedWhseShipmentLine.QPB := WhseShipmentLine.QPB;
//         PostedWhseShipmentLine.Box := WhseShipmentLine.Box;
//         PostedWhseShipmentLine.Loose := WhseShipmentLine.Loose;
//     end;
//     //...........................................Warehouse Shipment Line to Posted Warehouse Shipment Line............................................................


//     //...........................................Sales Line to Warehouse Shipment Line...............................................................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnPurchLine2ReceiptLineOnAfterInitNewLine', '', false, false)]
//     local procedure OnPurchLine2ReceiptLineOnAfterInitNewLine(var WhseReceiptLine: Record "Warehouse Receipt Line"; WhseReceiptHeader: Record "Warehouse Receipt Header"; PurchaseLine: Record Microsoft.Purchases.Document."Purchase Line"; var IsHandled: Boolean)
//     begin
//         WhseReceiptLine."Applicable For QC" := PurchaseLine."Applicable For QC";
//         WhseReceiptLine."QC Templete code" := PurchaseLine."QC Templete code";
//     end;


//     //steps for sales header data flow to warehouse shipment header
//     //step 1 sales header to send data warehouse request................................ 
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Outbound", OnAfterFindWarehouseRequestForSalesOrder, '', false, false)]
//     local procedure OnAfterFindWarehouseRequestForSalesOrder(var WarehouseRequest: Record "Warehouse Request"; SalesHeader: Record "Sales Header")
//     begin
//         WarehouseRequest."Transporter name" := SalesHeader."Agent Name.";
//         WarehouseRequest.Modify(true);
//     end;
//     //step 1 sales header to send data warehouse request................................ 
//     //step 2 warehouse request  to warehouse shipment header...............................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Outbound", OnAfterCreateWhseShipmentHeaderFromWhseRequest, '', false, false)]
//     local procedure OnAfterCreateWhseShipmentHeaderFromWhseRequest(var WarehouseRequest: Record "Warehouse Request"; var WhseShptHeader: Record "Warehouse Shipment Header")
//     begin
//         // if WhseShptHeader."No." <> '' then begin
//         WhseShptHeader."Transporter name" := WarehouseRequest."Transporter name";
//         WhseShptHeader.Modify(true);
//         // end;
//     end;
//     //step 2 warehouse request  to warehouse shipment header...............................................

//     //...............................Transfer Shipment header To ILE...............................................

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnBeforePostItemJournalLine', '', false, false)]
//     local procedure OnBeforePostItemJournalLine(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line"; CommitIsSuppressed: Boolean)
//     var
//         TranferHeader: Record "Transfer Header";
//         TransferShipmentHeader1: Record "Transfer Shipment Header";
//         ItemLedgerEntry: Record "Item Ledger Entry";
//     begin
//         if TranferHeader."Job Type" = TranferHeader."Job Type"::"Job work to job" then begin
//             ItemJournalLine."Parent Challan" := TransferShipmentHeader."Parent Challan";
//             ItemJournalLine."Job worker Challan No" := TransferShipmentHeader."Job worker Challan No";
//         end;

//         if TranferHeader."Job Type" = TranferHeader."Job Type"::"Delivery challan" then begin
//             TranferHeader.Reset();
//             TranferHeader.SetRange("No.", TransferLine."Document No.");
//             if TranferHeader.FindFirst() then begin
//                 if TranferHeader."Job worker Challan No" <> '' then begin
//                     ItemJournalLine."Job worker Challan No" := TranferHeader."Job worker Challan No";
//                 end;
//                 if TranferHeader."Parent Challan" <> '' then begin
//                     ItemJournalLine."Parent Challan" := TranferHeader."Parent Challan";
//                 end else
//                     ItemJournalLine."Parent Challan" := TransferShipmentHeader."No.";
//             end;
//         end;
//     end;

//     /*
//         [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterCreateItemJnlLine', '', false, false)]
//         local procedure OnAfterCreateItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line")
//         var
//             TransferHeader: Record "Transfer Header";
//         begin
//             if TransferHeader."Job Type" = TransferHeader."Job Type"::"Delivery challan" then begin
//                 if TransferShipmentHeader.Get(TransferHeader."Last Shipment No.") then begin
//                     TransferShipmentHeader."Parent Challan" := TransferShipmentHeader."No.";
//                     ItemJournalLine."Parent Challan" := TransferShipmentHeader."Parent Challan";
//                     TransferShipmentHeader.Modify();// Save the modification
//                 end;
//             end;
//             if TransferHeader."Job Type" = TransferHeader."Job Type"::"Job work to job" then begin
//                 ItemJournalLine."Parent Challan" := TransferShipmentHeader."Parent Challan";
//                 ItemJournalLine."Job worker Challan No" := TransferShipmentHeader."Job worker Challan No";
//             end;
//         end;*/
//     //...............................Transfer Shipment header To ILE...............................................



//     //...............................Transfer Reciept header To ILE...............................................
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforePostItemJournalLine', '', false, false)]
//     local procedure OnBeforePostItemJournalLineRec(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferReceiptHeader: Record "Transfer Receipt Header"; TransferReceiptLine: Record "Transfer Receipt Line"; CommitIsSuppressed: Boolean; TransLine: Record "Transfer Line"; PostedWhseRcptHeader: Record "Posted Whse. Receipt Header")
//     var
//         TranferHeader: Record "Transfer Header";
//         TransferShipmentHeader: Record "Transfer Shipment Header";
//     begin

//         if TranferHeader."Job Type" = TranferHeader."Job Type"::"Job work to job" then begin
//             ItemJournalLine."Parent Challan" := TransferReceiptHeader."Parent Challan";
//             ItemJournalLine."Job worker Challan No" := TransferReceiptHeader."Job worker Challan No";
//         end;


//         // ItemJournalLine.Modify()
//         //acx-im 18-Feb-2025

//         TranferHeader.Reset();
//         TranferHeader.SetRange("No.", TransferLine."Document No.");
//         if TranferHeader.FindFirst() then begin
//             if TranferHeader."Parent Challan" <> '' then begin

//                 ItemJournalLine."Parent Challan" := TranferHeader."Parent Challan";
//                 ItemJournalLine."Job worker Challan No" := TranferHeader."Job worker Challan No";
//             end
//             else begin
//                 if TransferShipmentHeader.Get(TranferHeader."Last Shipment No.") then begin
//                     ItemJournalLine."Parent Challan" := TransferShipmentHeader."Parent Challan";
//                     ItemJournalLine."Job worker Challan No" := TransferShipmentHeader."Job worker Challan No";
//                 end;
//             end;
//         end;

//         //acx-im 18-Feb-2025
//     end;
//     //...............................Transfer Reciept header To ILE.......................
// }