page 50101 "Prompt Dialog"
{
    PageType = PromptDialog;
    UsageCategory = Administration;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Prompt Dialog';

    layout
    {
        area(Prompt)
        {
            group(Group)
            {
                field("Prompt Field"; UserPromptText)
                {
                    ApplicationArea = All;
                    Caption = 'Enter Prompt';
                }
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';
                trigger OnAction()
                var
                    CopilotJob: Codeunit CopilotJob;
                begin
                    CopilotJob.Generate(UserPromptText);
                end;
            }
        }
    }

    var
        UserPromptText: Text[100];
}