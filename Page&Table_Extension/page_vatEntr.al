pageextension 50106 VatEntryExtension extends "VAT Entries"
{
    layout
    {
        addbefore(Amount)
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