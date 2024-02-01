pageextension 50113 postedsalesInvExtension extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
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