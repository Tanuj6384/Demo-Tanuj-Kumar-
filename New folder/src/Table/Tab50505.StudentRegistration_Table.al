table 50505 "Student Registrations"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Student;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Class ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Class;

            trigger OnValidate()
            var
                recClasses: Record Class;
            begin
                if xRec."Class ID" <> Rec."Class ID" then begin
                    recClasses.Reset();
                    if recClasses.Get("Class ID") then begin
                        "Class Name" := recClasses.Name;
                        "Class Mode" := Format(recClasses.Mode);
                    end;
                end;
            end;
        }
        field(4; "Class Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = Class.Name;
            Editable = false;
        }
        field(5; "Class Mode"; Text[50])
        {
            TableRelation = class.Mode;
            DataClassification = ToBeClassified;

            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Student ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}