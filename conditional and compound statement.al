page 50112 "condition and compond state"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {
            group(Input)
            {
                caption = 'Input';
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;

                }


            }

            group(Output)
            {
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Editable = false;

                }

                field(suggestions; suggestions)
                {
                    ApplicationArea = All;
                    Editable = false;

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Difficuties)


            {


                ApplicationArea = All;

                trigger OnAction()

                var
                    Codeunitrec: Codeunit MyCodeunit;
                begin
                    Codeunitrec.Run();
                    //     case Difficulty of
                    //         1 .. 5:
                    //             begin
                    //                 level := ' Beginner';
                    //                 suggestions := 'taker elearning or remote training';
                    //             end;

                    //     end;

                    //     case Difficulty of
                    //         6 .. 7:
                    //             begin
                    //                 level := 'Intermidiate';
                    //                 suggestions := 'Attend instructor-led';
                    //             end;
                    //     end;

                    //     case Difficulty of
                    //         8 .. 10:
                    //             begin
                    //                 level := 'AAdvance';
                    //                 suggestions := 'Attend instructor-led and self study';
                    //             end;


                    //     end;
                end;
            }
        }
    }

    var
        Level: Text[20];

        suggestions: text[50];

        Difficulty: Integer;


}