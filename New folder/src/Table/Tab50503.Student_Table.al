table 50503 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

        }
        field(3; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            var
                Length: Integer;
                Pos: Text;
            begin
                Length := StrLen(Rec."Phone No.");
                if (Length <> 10) then
                    Error('Length Should be 10 Digit');

                Pos := CopyStr(Rec."Phone No.", 1, 1);
                if (Pos IN ['1' .. '5']) then
                    Error('Intial Should be 6,7,8,9');
            end;

        }
        field(4; "e-Mail"; Text[250])
        {
            Caption = 'e-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

        }
        field(9; "Website"; Text[250])
        {
            Caption = 'e-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

        }
        field(5; Latitude; Decimal)
        {
            Caption = 'Latitude';
            DataClassification = ToBeClassified;

        }
        field(6; Longitude; Decimal)
        {
            Caption = 'Longitude';
            DataClassification = ToBeClassified;

        }
        field(7; City; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;

        }

        field(8; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = ToBeClassified;
        }

        field(10; "Web ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
