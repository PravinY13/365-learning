pageextension 50101 MyExtension extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst("&Invoice")
        {

            action(Button)
            {
                promoted = true;
                PromotedCategory = process;
                ApplicationArea = all;
                RunObject = report 50121;

                // trigger OnAction()
                // var
            }
        }
        // Add changes to page actions here


    }

    var
        myInt: Integer;
}