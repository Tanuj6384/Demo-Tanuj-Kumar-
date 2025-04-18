table 50504 "Class Schedule"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Teacher ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Teacher;

            trigger OnValidate()
            var
                recTeacher: Record Teacher;
            begin
                if xRec."Teacher ID" <> Rec."Teacher ID" then begin
                    recTeacher.Reset();
                    if recTeacher.Get("Teacher ID") then begin
                        "Teacher Name" := recTeacher.Name;
                    end;
                end;
            end;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Class ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Class;

            trigger OnValidate()
            var
                recClasses: Record Class;
                recTeacher: Record Teacher;

            begin
                if xRec."Class ID" <> Rec."Class ID" then begin
                    recClasses.Reset();
                    if recClasses.Get("Class ID") then begin
                        "Class Name" := recClasses.Name;
                    end;

                    recTeacher.Reset();
                    if recTeacher.Get("Teacher ID") then begin
                        "Teacher Name" := recTeacher.Name;
                    end;

                end;
            end;
        }
        field(4; "Schedule Day"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Moday,Tuesday,wednesday,Thursday,Friday,Saturday,Sunday;
            OptionCaption = 'Moday,Tuesday,wednesday,Thursday,Friday,Saturday,Sunday';

        }
        field(5; "Schedule Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Scheduled Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Duration"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Scheduled End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Schedule End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Teacher Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Class Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Teacher ID", "Line No.")
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