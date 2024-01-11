page 50101 "Chicken List page"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Chicken Type";
    CardPageId = 50102;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code:"; Rec."Code:")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
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
                    //  ApplicationArea=all;


                end;
            }
        }
    }

    var
        myInt: Integer;
}