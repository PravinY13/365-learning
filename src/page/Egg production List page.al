page 50109 "Egg production List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = "Egg Production Header";
    CardPageId = "Egg Production Document";

    layout
    {
        area(Content)
        {
            group(GroupName)
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