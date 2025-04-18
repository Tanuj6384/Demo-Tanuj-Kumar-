page 50504 Teacher_PageCard
{
    ApplicationArea = All;
    Caption = 'Teacher_PageCard';
    PageType = Card;
    SourceTable = Teacher;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Work Phone No."; Rec."Work Phone No.")
                {
                    ToolTip = 'Specifies the value of the Work Phone No. field.', Comment = '%';
                }
                field("Personal Phone No"; Rec."Personal Phone No")
                {
                    ToolTip = 'Specifies the value of the Personal Phone No field.', Comment = '%';
                }
                field("Website URL"; Rec."Website URL")
                {
                    ToolTip = 'Specifies the value of the Website URL field.', Comment = '%';
                }
                field("e-mail"; Rec."e-mail")
                {
                    ToolTip = 'Specifies the value of the e-mail field.', Comment = '%';
                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.', Comment = '%';
                }
            }

            part("Class Schedule"; "Teacher Class Schedule Subform")
            {
                SubPageLink = "Teacher ID" = field(ID);
                ApplicationArea = all;
            }
        }
    }
}
