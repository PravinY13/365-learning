pageextension 50102 salesExtension extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

            field("Name1"; Rec.Name)
            {
                ApplicationArea = All;

            }

        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}