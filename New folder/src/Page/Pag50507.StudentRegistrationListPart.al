page 50507 "Student Registration ListPart"
{
    ApplicationArea = All;
    Caption = 'Student Registration ListPart';
    PageType = ListPart;
    SourceTable = "Student Registrations";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Class ID"; Rec."Class ID")
                {
                    ApplicationArea = All;
                }
                field("Class Name"; Rec."Class Name")
                {
                    ApplicationArea = All;
                }
                field("Class Mode"; Rec."Class Mode")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}
