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
        LearnMoreUrlTxt: Label 'https://tinyurl.com/yk58eyb5', Locked = true;
    begin
        if EnvironmentInfo.IsSaaSInfrastructure() then
            if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::"Copilot Playground") then
                CopilotCapability.RegisterCapability(
                      Enum::"Copilot Capability"::"Copilot Playground",
                      Enum::"Copilot Availability"::"Generally Available", LearnMoreUrlTxt);
    end;
}