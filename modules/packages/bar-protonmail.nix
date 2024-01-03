{
  lib,
  fetchFromGitHub,
  python3Packages,
  libnotify,
  font-awesome,
}: let
  proton-client = python3Packages.proton-client.overridePythonAttrs (old: {
    src = fetchFromGitHub {
      owner = "crabvk";
      repo = "proton-python-client";
      rev = "99980018f8d807692b82b39a3f0b883351edb060";
      sha256 = "sha256-aY5jwCJlTdvPHKPpMhwWt/Bx/gUFakiJIeQXbieKizM=";
    };

    patches = (old.patches or []) ++ [ ./fix-timeout-value-error.patch ];
  });
in
  python3Packages.buildPythonApplication rec {
    pname = "bar-protonmail";
    version = "1.0.2";

    src = fetchFromGitHub {
      owner = "crabvk";
      repo = "bar-protonmail";
      rev = version;
      sha256 = "sha256-VyWchZLzfr1BBNOsV+MH49DESS/BWXpshFFqRuGs7QA=";
    };

    format = "pyproject";

    nativeBuildInputs = [python3Packages.poetry-core];

    pythonPath = [
      python3Packages.dnspython
      proton-client
    ];

    propagatedBuildInputs = [libnotify font-awesome];

    meta = {
      description = "New message notifications and unread messages count from ProtonMail (Waybar/Polybar module)";
      homepage = "https://github.com/crabvk/bar-protonmail";
      licenses = [lib.licenses.mit];
    };
  }
