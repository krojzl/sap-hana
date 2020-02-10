# Platform Specific Architecture for Azure (Microsoft Azure)

Description

<!-- TOC -->

- [Platform Specific Architecture for Azure (Microsoft Azure)](#platform-specific-architecture-for-azure-microsoft-azure)
  - [Azure: Overall Architecture](#azure-overall-architecture)
  - [Azure: Basic Architecture](#azure-basic-architecture)
    - [Azure: Storage Configurations](#azure-storage-configurations)
  - [Azure: Virtual Hostname/IP](#azure-virtual-hostnameip)
  - [Azure: High Availability](#azure-high-availability)
  - [Azure: Disaster Recovery](#azure-disaster-recovery)
  - [Azure: Data Tiering Options](#azure-data-tiering-options)
  - [Azure: XSA](#azure-xsa)

<!-- /TOC -->

## Azure: Overall Architecture

![Azure: Overall Architecture](../../images/arch-azure-overall.png)

- some general text
  - some basic links to Azure reference architectures and documentation

## Azure: Basic Architecture

Link to generic content: [Module: Basic Architecture](pages/generic_architecture/module_basic_architecture.md#module-basic-architecture)

- supported instance types
- description of single node implementation (storage) + picture
- description of scale-out implementations (storage) + picture
- mention that subnets are stretched across AZs
- links to Azure documentation

### Azure: Storage Configurations

- visualization of storage for Azure

## Azure: Virtual Hostname/IP

Link to generic content: [Module: Virtual Hostname/IP](pages/generic_architecture/module_virtual_hostname.md#module-virtual-hostnameip)

- how to implement virtual IP - maybe additional network interface?
- reference to Instance Move and how to execute Azure specific steps (move network interface?)

## Azure: High Availability

Link to generic content: [Module: High Availability](pages/generic_architecture/module_high_availability.md#module-high-availability)

- link to list of Availability Zones in Azure
- comment that it is important to measure AZ latency via niping (I will add this as new section in general part)
- fencing mechanism (options, recommendation)
- how to implement cluster IP (as load balancer)
  - explain why we need load balancer (no ARP invalidations)
  - it is managed by cluster (explain how - but opening port on active node)
  - link to [Video](https://youtu.be/axyPUGS7Wu4) and [PDF](https://www.suse.com/media/presentation/TUT1134_Microsoft_Azure_and_SUSE_HAE%20_When_Availability_Matters.pdf)
- links to Azure/SUSE/RHEL documentation
- how to modify cluster to have active/active
- how to modify cluster to have tenant specific cluster IPs
- anything else?

## Azure: Disaster Recovery

Link to generic content: [Module: Disaster Recovery](pages/generic_architecture/module_disaster_recovery.md#module-disaster-recovery)

- anything to consider? bandwidth?

## Azure: Data Tiering Options

Link to generic content: [Module: Data Tiering Options](pages/generic_architecture/module_data_tiering.md#module-data-tiering-options)

- what is supported what is not (matrix)
- links to Azure documentation
- modified pictures of storage setup (if required)

## Azure: XSA

Link to generic content: [Module: SAP XSA](pages/generic_architecture/module_xsa.md#module-sap-xsa)

- I think there is nothing infrastructure specific
