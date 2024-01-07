{...}: {
  services = {
    # Conflicts with auto-cpufreq
    power-profiles-daemon = {
      enable = false;
    };
    # Laptop/Power Savings
    auto-cpufreq = {
      enable = true;
    };
    tlp = {
      enable = false;
    };
    # Intel only
    thermald = {
      enable = true;
    };
  };
}
