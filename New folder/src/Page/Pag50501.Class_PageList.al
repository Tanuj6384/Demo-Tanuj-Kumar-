page 50501 Class_Page_List
{
    Caption = 'Class List Page';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Class;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = all;
                }
                field(Mode; Rec.Mode)
                {
                    ApplicationArea = all;
                }
                field(Fee; Rec.Fee)
                {
                    ApplicationArea = all;
                    
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Run';
                Promoted = true;
                PromotedCategory = Process;
                image = "8ball";

                trigger OnAction()
                var
                    recclass: Record Class;
                    NumTxt: array[2] of Text[250];
                    CheckRep: Report check;
                begin



                end;

            }
            action(sdfg)
            {
                ApplicationArea = All;
                Caption = 'Run Model';
                Promoted = true;
                PromotedCategory = Process;
                image = "8ball";

                trigger OnAction()
                var
                    recClass: Record Class;
                    sss: Integer;
                begin
                    recClass.Reset();
                    //recClass.SetCurrentKey(Name);
                        
                    if recClass.FindSet() then
                        recClass.CalcSums(Fee);
                    Message('%1',recClass.fee);
                    // repeat
                    //     Message('%1', recClass.Name);
                    // until recClass.Next() = 0;
                end;
            }
        }
    }
}