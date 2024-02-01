codeunit 50100 MyCodeunit
{
    trigger OnRun()


    begin
        case Difficulty of
            1 .. 5:
                begin
                    level := ' Beginner';
                    suggestions := 'taker elearning or remote training';
                end;

        end;

        case Difficulty of
            6 .. 7:
                begin
                    level := 'Intermidiate';
                    suggestions := 'Attend instructor-led';
                end;
        end;

        case Difficulty of
            8 .. 10:
                begin
                    level := 'AAdvance';
                    suggestions := 'Attend instructor-led and self study';
                end;


        end;
    end;

    var
        Level: Text[20];

        suggestions: text[50];

        Difficulty: Integer;
}