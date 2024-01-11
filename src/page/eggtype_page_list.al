page 50106 "egg type page list "
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Egg type";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Code:"; Rec."Code:")
                {
                    ToolTip = 'Specifies the value of the Code: field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
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