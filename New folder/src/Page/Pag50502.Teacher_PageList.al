page 50502 "Teacher Page List"
{
    Caption = 'Teacher Page List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Teacher;
    CardPageId = Teacher_PageCard;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Work Phone No."; Rec."Work Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Personal Phone No"; Rec."Personal Phone No")
                {
                    ApplicationArea = All;
                }
                field("Website URL"; Rec."Website URL")
                {
                    ApplicationArea = All;
                }
                field("e-mail"; Rec."e-mail")
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}