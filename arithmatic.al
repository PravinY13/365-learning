page 50111 Arithmetic
{
    PageType = card;
    ApplicationArea = All;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {
            group(input)

            {
                Caption = 'Enter your Input Here: ';


                field(value1; value1)
                {
                    ApplicationArea = All;

                }


                field(value2; value2)
                {
                    ApplicationArea = All;

                }

                group(Output)
                {
                    Caption = 'Your Output ';


                    field(summ; summ)
                    {
                        ApplicationArea = All;

                    }

                    field(multiplication; multiplication)
                    {
                        ApplicationArea = All;

                    }


                    field(division; division)
                    {
                        ApplicationArea = All;

                    }

                    field(difference; difference)
                    {
                        ApplicationArea = All;
                    }
                    field(Quo; Quo)
                    {
                        ApplicationArea = All;
                        //FieldPropertyName = FieldPropertyValue;
                    }

                    // field(modd; modd)
                    // {
                    //     ApplicationArea = All;
                    //     //FieldPropertyName = FieldPropertyValue;
                    // }





                }

            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                caption = 'execute';
                Image = CalculateCost;


                trigger OnAction()
                begin
                    summ := value1 + value2;
                    multiplication := value1 * value2;
                    division := value1 div value2;
                    difference := value1 - value2;
                    Quo := value1 / value2;
                    //modd := value1 mod value2;
                end;
            }
        }
    }

    var


        value1: Integer;
        value2: Integer;
        summ: Integer;
        multiplication: Integer;
        division: Integer;
        difference: integer;
        Quo: decimal;
        modd: decimal;
}
