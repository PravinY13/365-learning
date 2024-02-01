pageextension 50103 MyGLExtension extends "General Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {

            field("Name1"; Rec.Name1)
            {
                ApplicationArea = All;

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