codeunit 50101 eventhandler
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterGetSalesLines', '', true, true)]
    local procedure OnAfterGetSalesLines(var NewSalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line")
    begin
        NewSalesLine.Name := TempSalesLineGlobal.Name;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    // local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    // begin
    //     GenJournalLine.name := SalesHeader.Name
    // end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry.Name1 := GenJournalLine.Name;
    end;



}