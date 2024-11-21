page 50100 "Copilot Chat"
{
    PageType = Card;
    Caption = 'Copilot Chat';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CopilotTable;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("UserPrompt"; UserPrompt)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate")
            {
                ApplicationArea = All;
                Caption = 'Generate';
                Image = "Invoicing-Send";

                trigger OnAction()
                var
                    CopilotJob: Codeunit "CopilotJob";
                begin
                    CopilotJob.Generate(UserPrompt);
                end;
            }
        }
    }
    var
        UserPrompt: Text[100];
}