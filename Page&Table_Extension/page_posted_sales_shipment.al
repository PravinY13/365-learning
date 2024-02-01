pageextension 50112 postedsalesshipExtension extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addbefore(Description)
        {
            field(Name; Rec.Name)
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