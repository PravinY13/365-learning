 codeunit 50101 eventhandler
{








}


























// {
//     Permissions = tabledata "G/L Entry" = rmid;




//     EventSubscriberInstance = StaticAutomatic;
//     //item name
//     // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnCopyFromItemOnAfterCheck',
//     //  '', true, true)]
//     // local procedure OnCopyFromItemOnAfterCheck(Item: Record Item; var SalesLine: Record "Sales Line")
//     // begin
//     //     SalesLine.Name := Item.Name;
//     // end;


//     //posted sales invoice
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterGetSalesLines', '', true, true)]
//     local procedure OnAfterGetSalesLines(var NewSalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line")
//     begin
//         NewSalesLine.Name := TempSalesLineGlobal.Name;
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromCustLedgEntry', '', true, true)]
//     local procedure OnAfterCopyGenJnlLineFromCustLedgEntry(CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
//     begin
//         CustLedgerEntry.Name1 := GenJournalLine.Name;

//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnAfterInitFromSalesLine', '', true, true)]
//     local procedure OnAfterInitFromSalesLine(SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; var SalesInvLine: Record "Sales Invoice Line")
//     begin
//         SalesInvLine.Name := SalesLine.Name;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
//     local procedure OnAfterInitCustLedgEntry(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
//     begin
//         CustLedgerEntry.Name1 := GenJournalLine.Name;
//     end;
//     //salesheader to gen.jnl line
//     // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
//     // local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
//     // begin
//     //     GenJournalLine.Name := SalesHeader.name1
//     // end;
//     //Header to cust.ledger entry
//     [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
//     local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
//     begin
//         CustLedgerEntry.Name1 := GenJournalLine.Name;
//     end;
//     //lines to 
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', true, true)]
//     // local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
//     // begin
//     //     SalesHeader.Name := SalesLine.Name;
//     // end;

//     //glEntry
//     [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
//     local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
//     begin
//         GLEntry.Name1 := GenJournalLine.Name;
//     end;
//     //detaild.cust.ledge.entry
//     // [EventSubscriber(ObjectType::Table, Database::"Detailed Cust. Ledg. Entry", '', '', true, true)]
//     // local procedure MyProcedure()
//     // begin

//     // end;













































































































































//     //item name
//     // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnCopyFromItemOnAfterCheck',
//     //  '', true, true)]
//     // local procedure OnCopyFromItemOnAfterCheck(Item: Record Item; var SalesLine: Record "Sales Line")
//     // begin
//     //     // SalesLine.Name := Item.name;
//     // end;


//     // //posted sales invoice
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterGetSalesLines', '', true, true)]
//     // local procedure OnAfterGetSalesLines(var NewSalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line")
//     // begin
//     //     NewSalesLine.Name := TempSalesLineGlobal.Name;
//     // end;



//     // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromCustLedgEntry', '', true, true)]
//     // local procedure OnAfterCopyGenJnlLineFromCustLedgEntry(CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
//     // begin
//     //     CustLedgerEntry.Name1 := GenJournalLine.Name;

//     // end;



//     // [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnAfterInitFromSalesLine', '', true, true)]
//     // local procedure OnAfterInitFromSalesLine(SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; var SalesInvLine: Record "Sales Invoice Line")
//     // begin
//     //     SalesInvLine.Name := SalesLine.Name;
//     // end;



//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
//     // local procedure OnAfterInitCustLedgEntry(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
//     // begin
//     //     CustLedgerEntry.Name1 := GenJournalLine.Name;
//     // end;



//     // //salesheader to gen.jnl line
//     // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
//     // local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
//     // begin
//     //     //GenJournalLine.Name1 := SalesHeader.Name1
//     // end;



//     // //Header to cust.ledger entry
//     // [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
//     // local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
//     // begin
//     //     CustLedgerEntry.Name1 := GenJournalLine.Name;
//     // end;



//     // //lines to 
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', true, true)]
//     // local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
//     // begin
//     //     //SalesHeader.Name1 := SalesLine.Name;
//     // end;

//     // //glEntry
//     // [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
//     // local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
//     // begin
//     //     GLEntry.Name1 := GenJournalLine.name;
//     // end;






//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterGetSalesLines', '', true, true)]
//     // local procedure OnAfterGetSalesLines(var NewSalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line")
//     // var
//     //     "G/l entry": Record "G/L Entry";

//     // begin
//     //     NewSalesLine.Name := TempSalesLineGlobal.Name;

//     //     "G/l entry".Insert();

//     // end;

//     // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
//     // local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
//     // begin
//     //     GenJournalLine.name := SalesHeader.Name
//     // end;

//     // [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
//     // local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
//     // begin
//     //     GLEntry.Name1 := GenJournalLine.Name;


//     // end;


//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
//     // local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean);
//     // var
//     //     salesline: Record "Sales Line";
//     //     "G/l entry": Record "G/L Entry";
//     // begin
//     //     salesline.Reset();
//     //     salesline.SetRange("Document No.", SalesHeader."No.");
//     //     if salesline.FindSet() then begin
//     //         repeat
//     //             "G/l entry".Name1 := salesline.Name;
//     //         until salesline.next() = 0;

//     //         "G/l entry".Modify();

//     //     end;

//     // end;



//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesLines, '', false, false)]
//     // local procedure OnAfterPostSalesLines(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; WhseShip: Boolean; WhseReceive: Boolean; var SalesLinesProcessed: Boolean; CommitIsSuppressed: Boolean; EverythingInvoiced: Boolean; var TempSalesLineGlobal: Record "Sales Line" temporary);

//     // var
//     //     salesline: Record "Sales Line";
//     //     "G/l entry": Record "G/L Entry";
//     // begin
//     //     TempSalesLineGlobal.Reset();
//     //     TempSalesLineGlobal.SetRange("Document No.", SalesHeader."No.");
//     //     if TempSalesLineGlobal.FindSet() then begin
//     //         repeat
//     //             "G/l entry".Name1 := TempSalesLineGlobal.Name;[EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Batch", OnPostLinesOnAfterPostLine, '', false, false)]
//     //             local procedure OnPostLinesOnAfterPostLine(var ItemJournalLine: Record "Item Journal Line"; var SuppressCommit: Boolean);
//     //             begin
//     //             end;
//     //             [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnPostItemChargePerOrderOnAfterCopyToItemJnlLine, '', false, false)]


//     //             local procedure OnPostItemChargePerOrderOnAfterCopyToItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; var SalesLine: Record "Sales Line"; GeneralLedgerSetup: Record "General Ledger Setup"; QtyToInvoice: Decimal; var TempItemChargeAssignmentSales: Record "Item Charge Assignment (Sales)" temporary);
//     //             begin
//     //             end;

//     //         until TempSalesLineGlobal.next() = 0;

//     //         "G/l entry".Modify();

//     //     end;
//     // end;




//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesLine, '', false, false)]
//     // local procedure OnAfterPostSalesLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var SalesInvLine: Record "Sales Invoice Line"; var SalesCrMemoLine: Record "Sales Cr.Memo Line"; var xSalesLine: Record "Sales Line");

//     // var

//     //     "G/l entry": Record "G/L Entry";
//     // begin
//     //     salesline.Reset();
//     //     salesline.SetRange("Document No.", SalesHeader."No.");
//     //     if salesline.FindSet() then begin
//     //         repeat
//     //             "G/l entry".Name1 := salesline.Name;
//     //         until salesline.next() = 0;

//     // "G/l entry".Modify();

//     //     end;
//     // end;


//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesLines, '', false, false)]
//     // local procedure OnBeforePostSalesLines(var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line" temporary; var TempVATAmountLine: Record "VAT Amount Line" temporary; var EverythingInvoiced: Boolean);
//     // var
//     //     salesline: Record "Sales Line";
//     //     "G/l entry": Record "G/L Entry";
//     // begin
//     //     salesline.Reset();
//     //     salesline.SetRange("Document No.", SalesHeader."No.");
//     //     if salesline.FindSet() then begin
//     //         repeat
//     //             "G/l entry".Name1 := salesline.Name;
//     //         until salesline.next() = 0;
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostInvPostBuffer, '', false, false)]
//     // local procedure OnAfterPostInvPostBuffer(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer" temporary; var SalesHeader: Record "Sales Header"; GLEntryNo: Integer; CommitIsSuppressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; xSalesLine: Record "Sales Line"; GenJnlLineDocNo: Code[20]; GenJnlLineExtDocNo: Code[35]; var GenJnlLineDocType: Enum "Gen. Journal Document Type");
//     // begin
//     //     GenJnlLine.name := xSalesLine.Name;
//     // end;

//     //         "G/l entry".Insert();

//     //     end;

//     // end;

//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostItemLine, '', false, false)]
//     // local procedure OnAfterPostItemLine(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; QtyToInvoice: Decimal; QtyToInvoiceBase: Decimal; CommitIsSuppressed: Boolean; var ItemJnlPostLine: Codeunit "Item Jnl.-Post Line");
//     // begin

//     // end;










// }