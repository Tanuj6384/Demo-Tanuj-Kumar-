page 71010 Vowels
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Vowels;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Enter Word"; Rec."Enter Word")
                {
                    ApplicationArea = all;

                }
                field("Enter Word For Counnt"; Rec."Enter Word For Counnt")
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
            action("Check Viwels or Continent ")
            {
                ApplicationArea = all;
                Image = SalesInvoice;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    int: Integer;
                    len: Text;
                    CountV: Integer;
                    CountC: Integer;
                    lenght: Integer;
                    Word: Text;
                    Countter: Integer;
                    PrintwordV: Text;
                    PrintwordC: Text;
                begin
                    CountV := 0;
                    CountC := 0;
                    Countter := 1;
                    lenght := StrLen(Rec."Enter Word");
                    PrintwordV := '';
                    PrintwordC := '';
                    Word := '';
                    for int := 1 to lenght do begin
                        Word := CopyStr(Rec."Enter Word", int, 1);
                        if (Word = 'A') or (Word = 'E') OR (Word = 'I') or (Word = 'O') or (Word = 'U') then begin
                            CountV += 1;
                            PrintwordV += Word;
                        end else begin
                            CountC += 1;
                            PrintwordC += Word;
                        end;
                    end;
                    Message('Wovels is %1 and Words is %2', CountV, PrintwordV);
                    Message('Continent is %1 and Words is %2', CountC, PrintwordC);
                end;
            }
            action("Check Word Count")
            {
                Caption = 'Check Word Count';
                ApplicationArea = all;
                Image = Account;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Int: Integer;
                    counter: Integer;
                    Wordlength: Integer;
                    CheckWord: Text;
                    finalwods: Text;
                    PintWord: Text;

                begin
                    Wordlength := 0;
                    CheckWord := '';
                    finalwods := '';
                    Wordlength := StrLen(Rec."Enter Word For Counnt");
                    for Int := 1 to Wordlength do begin
                        CheckWord := CopyStr(Rec."Enter Word For Counnt", Int, 1);
                        if CheckWord = finalwods then begin
                            counter += 1;
                            PintWord += CheckWord;
                        end else begin
                            counter := 0;
                        end;
                        finalwods := CheckWord;

                    end;
                    Message('Word is %1  %2 Times',PintWord, counter);


                end;
            }
        }
    }

    var
        myInt: Integer;
}