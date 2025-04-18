page 50503 "Student Page List"
{
    ApplicationArea = All;
    Caption = 'Student Page List';
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;
    CardPageId = Student_Card_Page;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    ApplicationArea = all;

                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                    ApplicationArea = all;

                }
                field("e-Mail"; Rec."e-Mail")
                {
                    ToolTip = 'Specifies the value of the e-Mail field.', Comment = '%';
                    ApplicationArea = all;

                }
                field(Website; Rec.Website)
                {
                    ApplicationArea = All;
                }

                field(Latitude; Rec.Latitude)
                {
                    ToolTip = 'Specifies the value of the Latitude field.', Comment = '%';
                    ApplicationArea = all;

                }
                field(Longitude; Rec.Longitude)
                {
                    ToolTip = 'Specifies the value of the Longitude field.', Comment = '%';
                    ApplicationArea = all;

                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                    ApplicationArea = all;

                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.', Comment = '%';
                    ApplicationArea = all;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Get Student INFO API")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = PostDocument;

                trigger OnAction()
                var
                    Http_Client: HttpClient;
                    Http_ResponseMsg: HttpResponseMessage;
                    response: Text;
                begin
                    Http_Client.Get('https://jsonplaceholder.typicode.com/users', Http_ResponseMsg);
                    Http_ResponseMsg.Content.ReadAs(response);
                    Message(response);
                end;
            }
        }
    }
}
