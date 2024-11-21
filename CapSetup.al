codeunit 50100 "Secrets And Capabilities Setup"
{
    Subtype = Install;
    InherentEntitlements = X;
    InherentPermissions = X;
    Access = Internal;

    trigger OnInstallAppPerDatabase()
    begin
        RegisterCapability();
    end;

    local procedure RegisterCapability()
    var
        EnvironmentInfo: Codeunit "Environment Information";
        CopilotCapability: Codeunit "Copilot Capability";
        LearnMoreUrlTxt: Label 'https://example.com/DraftaJob', Locked = true;
    begin
        if EnvironmentInfo.IsSaaSInfrastructure() then
            if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::Test) then
                CopilotCapability.RegisterCapability(
                      Enum::"Copilot Capability"::Test,
                      Enum::"Copilot Availability"::"Generally Available", LearnMoreUrlTxt);
    end;
}