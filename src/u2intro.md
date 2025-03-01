# Unit 2

## Overview

### What is the skill/tech/concept we are dealing with?
This unit centers on  a focus on security and troubleshooting.
- The use of **SELinux** for implementing mandatory access controls, managing file permissions with **ACLs (Access Control Lists)**,
- Understanding operational methodologies for incident triage.

## Learning Objectives
1. **Understand and Configure SELinux:**
   - Grasp the core concepts of SELinux, including security contexts, labels, and its role in enforcing mandatory access control.
   - Learn how to configure and troubleshoot SELinux settings to ensure system security and compliance.

2. **Master Access Control Lists (ACLs):**
   - Recognize the limitations of traditional Unix permissions and how ACLs provide granular control over file and directory access.
   - Develop skills in applying and managing ACLs in a complex Linux environment.

3. **Develop Effective Troubleshooting Methodologies:**
   - Acquire techniques to diagnose and resolve system access issues, particularly those arising from SELinux policies and ACL misconfigurations.
   - Apply structured troubleshooting strategies to ensure minimal downtime and maintain high availability.

4. **Integrate Theoretical Knowledge with Practical Application:**
   - Engage with interactive exercises, discussion prompts, and real-world scenarios to reinforce learning.
   - Utilize external resources, such as technical documentation and instructional videos, to supplement hands-on practice.

5. **Enhance Collaborative Problem-Solving Skills:**
   - Participate in peer discussions and reflective exercises to compare different approaches to system administration challenges.
   - Learn to articulate and document troubleshooting processes and system configurations for continuous improvement.

6. **Build a Foundation for Advanced Security Practices:**
   - Understand how SELinux and ACLs fit into the broader context of system security and operational stability.
   - Prepare for more advanced topics by reinforcing the fundamental skills needed to manage and secure Red Hat Enterprise Linux environments.

These objectives aim to ensure that learners not only acquire specific technical skills but also develop a holistic understanding of how to secure and manage Linux systems in enterprise settings.

## Relevance & Context

### Why is it important to Linux Administrators/Engineers?
For Linux administrators and engineers, mastering SELinux and ACLs is essential because these tools add critical layers of security and control over system resources. By understanding how to use security contexts and labels, professionals can:
- **Enhance System Security:** Implementing SELinux helps mitigate vulnerabilities by enforcing strict access controls.

- **Troubleshoot Access Issues:** Knowledge of ACLs and SELinux enables the identification and resolution of permission-related issues, which are common in complex, multi-user environments.

- **Improve System Reliability:** Understanding these concepts supports the broader goal of maintaining high availability and operational stability, especially when systems must operate under varying security configurations.

## Prerequisites

### Briefly mention concepts or skills the reader should already understand before starting the chapter.
Before engaging with this unit, readers should have a foundational understanding of:
- **Basic Linux Commands and File System Structure:** Familiarity with navigating Linux directories, managing files, and using the terminal.

- **Traditional Unix Permissions:** A solid grasp of the standard user/group/other permission model.

- **Fundamental Security Principles:** An introductory knowledge of concepts like Discretionary Access Control (DAC) and Mandatory Access Control (MAC), which provide the groundwork for understanding SELinux.

- **Basic Troubleshooting Techniques:** Experience with diagnosing and resolving common system issues will be beneficial when applying the methodologies discussed in the unit.

## Key terms and Definitions

1. **SELinux (Security-Enhanced Linux):**
   A security module integrated into the Linux kernel that enforces mandatory access controls. Key aspects include security contexts, labels, and operating modes that help confine processes and protect system resources.

2. **Access Control Lists (ACLs):**
   Mechanisms that extend traditional Unix file permission models to provide granular control over who can access files and directories, allowing specific permissions for individual users or groups.

3. **Security Contexts:**
   Attributes assigned to files and processes in SELinux that determine their security properties. These contexts help define what actions are allowed or denied, based on predefined policies.

4. **Mandatory Access Control (MAC):**
   A security approach where access policies are enforced by the system rather than by the discretion of individual users. SELinux is an example of MAC, contrasting with Discretionary Access Control (DAC).

5. **Discretionary Access Control (DAC):**
   A traditional security model where users have the freedom to set permissions for the resources they own. This is the basis of Unix file permission systems but is limited compared to MAC.

6. **Uptime:**
   A measure of system reliability and availability, crucial for maintaining service continuity in enterprise environments.

7. **Standard Streams (stdin, stdout, stderr):**
   The fundamental data streams in Unix/Linux systems used for input, output, and error messages, which are important when troubleshooting and scripting.

8. **High Availability (HA):** 
   The design and implementation of systems to ensure continuous operation and minimal downtime. Understanding HA is essential when troubleshooting incidents that affect system performance and uptime.

9. **Service Level Objectives (SLOs):**
   Specific targets for system performance and availability, used as benchmarks to ensure that operational parameters are maintained, contributing to overall system reliability.

10. **Troubleshooting Methodologies:**
    Systematic approaches and techniques used to diagnose, isolate, and resolve issues within a Linux environment, with an emphasis on security and access control issues in this unit.
