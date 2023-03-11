let
  # RTX 3070 Ti
  gpuIDs = [
    "1002:731f" # Graphics
    "1002:ab38" # Audio
  ];
in { pkgs, lib, config, ... }: {
  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";

  config = let cfg = config.vfio;
  in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        "vfio_virqfd"

        "amdgpu"
       ];
      extraModprobeConfig = ''
        options kvm ignore_msrs=1
        options kvm report_ignored_msrs=0
      '';

      kernelParams = [
        # enable IOMMU
        "amd_iommu=on" "iommu=pt" "initcall_blacklist=sysfb_init" 
      ] ++ lib.optional cfg.enable
        # isolate the GPU
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    hardware.opengl.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}

