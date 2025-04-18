page 50506 Student_Card_Page
{
    ApplicationArea = All;
    Caption = 'Student_Card_Page';
    PageType = Card;
    SourceTable = Student;

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
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("e-Mail"; Rec."e-Mail")
                {
                    ToolTip = 'Specifies the value of the e-Mail field.', Comment = '%';
                }
                field(Latitude; Rec.Latitude)
                {
                    ToolTip = 'Specifies the value of the Latitude field.', Comment = '%';
                }
                field(Longitude; Rec.Longitude)
                {
                    ToolTip = 'Specifies the value of the Longitude field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.', Comment = '%';
                }
            }
            group("Course Register")
            {
                part(StudentRegistrationLine; "Student Registration ListPart")
                {
                    SubPageLink = "Student ID" = field(ID);
                    ApplicationArea = all;
                }

            }
        }
    }
}
