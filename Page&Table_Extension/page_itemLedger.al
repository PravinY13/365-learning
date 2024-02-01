pageextension 50105 ItemLedgExtension extends "Item Ledger Entries"
{
    layout
    {

        addbefore(Description)

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