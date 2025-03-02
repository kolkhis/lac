<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
    <p>
        <h1>Unit 4</h1>
    </p>
</div>

### What is the skill/tech/concept we are dealing with?

This unit concentrates on the core tasks involved in **operating running systems** in a Linux environment, particularly with Red Hat Enterprise Linux (RHEL). It covers:

- **System Monitoring and Resource Management:** Understanding resource usage (CPU, memory, disk I/O) is paramount for maintaining system performance and ensuring processes run optimally.

- **Managing Services and Processes:** Familiarity with service management frameworks (e.g., `systemd`) is critical for starting, stopping, and monitoring system services, as well as handling process life cycles.

- **Logging and Log Analysis:** System logs provide vital information about service health, security events, and system performance. Properly configuring and analyzing these logs is essential to diagnose and prevent issues.

- **Task Scheduling and Automation:** Tools like `cron`, `at`, and `systemd` timers enable administrators to schedule repetitive jobs or maintenance tasks, ensuring essential operations run consistently and without manual intervention.

## Learning Objectives

1. **Monitor and Manage System Resources:**

   - Learn to track CPU, memory, disk, and network usage using common RHEL utilities.
   - Understand best practices for troubleshooting performance bottlenecks.

2. **Master Service and Process Control:**

   - Gain proficiency with `systemd` for managing services and understanding dependency trees.
   - Acquire the ability to identify, start, stop, and restart services and processes as needed.

3. **Configure and Interpret System Logs:**

   - Explore journald and syslog-based logging to collect and store vital system events.
   - Develop techniques to analyze log files for troubleshooting and security assessments.

4. **Implement Scheduling and Automation:**
   - Use `cron`, `at`, and `systemd` timers to automate recurring tasks.
   - Understand how automated job scheduling improves reliability and reduces manual intervention.

These objectives ensure learners can sustain, troubleshoot, and improve actively running Linux systems within enterprise environments, reducing downtime and increasing system reliability.

## Relevance & Context

### Why is it important to Linux Administrators/Engineers?

Operating running systems is central to any Linux administrator’s responsibilities for several reasons:

- **System Stability and Performance:**  
  Continuous monitoring and immediate remediation of issues ensure critical services remain available and performant.

- **Proactive Problem Resolution:**  
  Effective log management and automation allow administrators to detect anomalies early, schedule essential maintenance, and minimize disruptions.

- **Security and Compliance:**  
  Logs are often the first line of evidence in security auditing and breach investigations. Regularly reviewing and correlating logs is crucial to maintaining a secure environment.

- **Enterprise Uptime and Reliability:**  
  In production environments, even brief outages can lead to significant operational and financial impacts. Proper management of running systems ensures high availability and robust service delivery.

## Prerequisites

### Briefly mention concepts or skills the reader should already understand before starting the chapter.

Before tackling the tasks of operating running systems, learners should possess:

- **Command-Line Proficiency:**  
  Familiarity with fundamental shell commands, directory structures, and file management is critical to executing system operations efficiently.

- **Basic Text Editing Skills:**  
  Experience using editors like `vi/vim` or `nano` to view and modify configuration files or system logs.

- **Understanding of System Components:**  
  Knowledge of how processes, services, and the Linux file hierarchy interact within the operating system, including permissions and ownership, sets the stage for more advanced tasks in service management and logging.

## Key Terms and Definitions

- **systemd:**  
  The modern Linux service manager responsible for controlling how services start, stop, and run at boot time. It centralizes service management, logging, and system states.

- **Journalctl:**  
  A command-line utility for viewing systemd’s journal logs, helping administrators filter and analyze system events efficiently.

- **Cron / At / Systemd Timers:**  
  Scheduling utilities used to automate tasks at specified intervals (cron/systemd timers) or single-use future tasks (at).

- **Daemon:**  
  A background service that starts at boot or on-demand, often managing network services, device interactions, or system events.
