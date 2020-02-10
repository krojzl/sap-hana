# Platform Specific Architecture for AWS (Amazon Web Services)

Description

<!-- TOC -->

- [Platform Specific Architecture for AWS (Amazon Web Services)](#platform-specific-architecture-for-aws-amazon-web-services)
  - [AWS: Overall Architecture](#aws-overall-architecture)
  - [AWS: Basic Architecture](#aws-basic-architecture)
    - [AWS: Storage Configurations](#aws-storage-configurations)
  - [AWS: Virtual Hostname/IP](#aws-virtual-hostnameip)
  - [AWS: High Availability](#aws-high-availability)
  - [AWS: Disaster Recovery](#aws-disaster-recovery)
  - [AWS: Data Tiering Options](#aws-data-tiering-options)
  - [AWS: XSA](#aws-xsa)

<!-- /TOC -->

## AWS: Overall Architecture

![AWS: Overall Architecture](../../images/arch-aws-overall.png)

- some general text
  - some basic links to AWS reference architectures and documentation

## AWS: Basic Architecture

Link to generic content: [Module: Basic Architecture](pages/generic_architecture/module_basic_architecture.md#module-basic-architecture)

- supported instance types
- description of single node implementation (storage) + picture
- description of scale-out implementations (storage) + picture
- mention that each AZ is its own subnet
- links to AWS documentation

### AWS: Storage Configurations

- visualization of storage for AWS

## AWS: Virtual Hostname/IP

Link to generic content: [Module: Virtual Hostname/IP](pages/generic_architecture/module_virtual_hostname.md#module-virtual-hostnameip)

- how to implement virtual IP - maybe additional elastic network interface?
- reference to Instance Move and how to execute AWS specific steps (move elastic network interface?)

## AWS: High Availability

Link to generic content: [Module: High Availability](pages/generic_architecture/module_high_availability.md#module-high-availability)

- link to list of Availability Zones in AWS
- comment that it is important to measure AZ latency via niping (I will add this as new section in general part)
- fencing mechanism (options, recommendation)
- how to implement cluster IP (also referred as overlay IP)
  - relation to different subnets per AZ
  - entry in VPC routing table
  - it is managed by cluster (need to assign IAM roles to VM)
  - need to disable source/destination check on interface
- links to AWS/SUSE/RHEL documentation
- how to modify cluster to have active/active
- how to modify cluster to have tenant specific cluster IPs
- anything else?

## AWS: Disaster Recovery

Link to generic content: [Module: Disaster Recovery](pages/generic_architecture/module_disaster_recovery.md#module-disaster-recovery)

- anything to consider? bandwidth?

## AWS: Data Tiering Options

Link to generic content: [Module: Data Tiering Options](pages/generic_architecture/module_data_tiering.md#module-data-tiering-options)

- what is supported what is not (matrix)
- links to AWS documentation
- modified pictures of storage setup (if required)

## AWS: XSA

Link to generic content: [Module: SAP XSA](pages/generic_architecture/module_xsa.md#module-sap-xsa)

- I think there is nothing infrastructure specific
