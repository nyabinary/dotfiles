{ ... }:
{
  boot = {
    initrd = {
      systemd = {
        root = "gpt-auto";
        emergencyAccess = true;
      };
      supportedFilesystems = {
        bcachefs = true;
        vfat = true;
      };
    };
  };
}
