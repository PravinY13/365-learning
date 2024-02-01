pageextension 50109 D_GSTLedgEntExtension extends "Detailed GST Ledger Entry"
{
    layout
    {
        addbefore("Document Type")
        {
            field(name1; Rec.name1)
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}