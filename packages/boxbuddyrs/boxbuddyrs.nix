{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  wrapGAppsHook4,
  cairo,
  gdk-pixbuf,
  glib,
  gtk4,
  libadwaita,
  pango,
}:
rustPlatform.buildRustPackage rec {
  pname = "box-buddy-rs";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Dvlv";
    repo = "BoxBuddyRS";
    rev = version;
    hash = "sha256-Drn7zQkzgp3VPVwx5Q0Bp7n9mPt6l82JQyvxFG+U+Lw=";
  };

  cargoHash = "sha256-t/RWKwbfK1KTzhu9MamjoHHVzsd4aTCUKxKmI4eYAtM=";

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    cairo
    gdk-pixbuf
    glib
    gtk4
    libadwaita
    pango
  ];

  meta = with lib; {
    description = "A Graphical Interface for Distrobox";
    homepage = "https://github.com/Dvlv/BoxBuddyRS";
    license = licenses.mit;
    maintainers = with maintainers; [iynaix];
    mainProgram = "box-buddy-rs";
  };
}
