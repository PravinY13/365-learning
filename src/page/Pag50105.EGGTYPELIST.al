page 50105 "EGG TYPE LIST"
{
    ApplicationArea = All;
    Caption = 'EGG TYPE LIST';
    PageType = List;
    SourceTable = "Egg type";
    UsageCategory = Administration;
    CardPageId = 50103;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
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
}
