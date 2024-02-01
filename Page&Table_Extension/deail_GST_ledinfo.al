pageextension 50111 detailGstInfoExtension extends "Detailed GST Ledger Entry Info"
{
    layout
    {
        addbefore("Bill Of Export No.")
        {
            field(Name1; Rec.Name1)
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