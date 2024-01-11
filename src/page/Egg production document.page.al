page 50108 "Egg Production Document"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Egg Production Header";



    layout
    {
        area(Content)
        {
            group(General)

            {
                field("NDocument Date"; Rec."NDocument Date")
                {
                    ToolTip = 'Specifies the value of the NDocument Date field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }

            part(Lines; "egg production subpage")
            {

                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}