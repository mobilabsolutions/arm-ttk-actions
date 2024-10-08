FROM mcr.microsoft.com/powershell:lts-ubuntu-18.04

LABEL "com.github.actions.name"="ARM Template Toolkit (ARM TTK)"
LABEL "com.github.actions.description"="Run ARM Template Toolkit (ARM TTK) against your ARM templates"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/aliencube/arm-ttk-actions"
LABEL "homepage"="http://github.com/aliencube"
LABEL "maintainer"="Justin Yoo <no-reply@aliencube.com>"

# Install git
RUN apt-get update && apt-get install -y \
    git jq \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Azure/arm-ttk.git /arm-ttk

ADD entrypoint.ps1 /entrypoint.ps1
RUN chmod +x /entrypoint.ps1

# ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT ["pwsh", "-File", "/entrypoint.ps1"]
