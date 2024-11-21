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
                    AzureOpenAI: Codeunit "Azure OpenAI";
                    ChatMessages: Codeunit "AOAI Chat Messages";
                    ChatCompletionParams: Codeunit "AOAI Chat Completion Params";
                    OperationResponse: Codeunit "AOAI Operation Response";
                    GeneratedText: Text;
                begin
                    ChatMessages.AddUserMessage(UserPrompt);
                    ChatCompletionParams.SetMaxTokens(100);
                    AzureOpenAI.GenerateChatCompletion(ChatMessages, ChatCompletionParams, OperationResponse);
                    GeneratedText := OperationResponse.GetResult();

                    Message('Generated Text: %1', GeneratedText);
                end;
            }
        }
    }
    var
        UserPrompt: Text[100];
}