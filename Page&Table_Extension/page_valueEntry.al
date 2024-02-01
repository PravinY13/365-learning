pageextension 50108 ValueEntryExtension extends "Value Entries"
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