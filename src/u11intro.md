<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
    <p>
        <h1>Unit 11: Linux Monitoring</h1>
    </p>
</div>

In this unit, we focus on Linux system monitoring, using modern tools like **Grafana, Prometheus, Node Exporter, and Loki**. As Linux administrators, monitoring is essential to ensure system stability, performance, and security across environments.

We will explore how to collect, analyze, and visualize system metrics, and discuss best practices for monitoring and dashboard design that can improve troubleshooting and proactive system management.

## Relevance & Context

Monitoring is a **core responsibility** of Linux system administration, ensuring you know what’s happening under the hood before issues escalate. Modern IT environments rely on monitoring to track system performance, security events, and overall stability — whether in production, development, or cloud environments.

This unit focuses on Grafana for visualization and Prometheus with Node Exporter for **telemetry and metrics collection** — tools commonly used in enterprise, cloud, and HPC (High-Performance Computing) environments.

Whether you're in a NOC, SysAdmin, or DevOps role, understanding monitoring and telemetry makes you a key contributor to system reliability and performance.

## Learning Objectives

**By the end of this unit, you will be able to**:

- Explain core monitoring concepts like metrics, logs, SLOs, SLIs, and KPIs
- Set up Prometheus and Node Exporter to collect system metrics
- Use Grafana to create dashboards for visualizing system health and performance
- Write and execute PromQL queries to analyze system data
- Interpret monitoring data to diagnose system issues and support teams with actionable insights

## Prerequisites

**Before starting Unit 11, you should have**:

- Basic understanding of **Linux system administration and networking**
- Familiarity with **system processes, performance metrics, and logs**
- **Root or sudo** access to a Linux system (Rocky 9 or equivalent)
- Internet access to run labs via **Killercoda** and online resources
- ***(Optional but recommended)***: Exposure to containers and services like Grafana or Prometheus

## Topics Covered

- **Introduction to Linux system monitoring and why it matters**
- **Key monitoring concepts and terminology**:
  - SLO (Service Level Objective)
  - SLA (Service Level Agreement)
  - SLI (Service Level Indicator)
  - KPI (Key Performance Indicator)
  - Loose coupling in monitoring design
  - MTTD (Mean Time to Detect) and MTTR (Mean Time to Repair)
- **Types of monitoring data: Logs, metrics, traces** — how and why they matter
- **Hands-on setup and use of tools**:
  - Prometheus and Node Exporter for system metrics
  - Grafana for dashboard visualization
  - Loki (intro) for log aggregation
- **PromQL queries for real-time monitoring insights**:
  - Monitoring specific system components
  - Filtering and targeting metrics for troubleshooting

## Next Steps

- **Start with the Worksheet**: Reflect on monitoring concepts, PromQL, and real-world monitoring scenarios
- **Complete the Lab**: Set up monitoring using Grafana and Prometheus, and walk through the linked **Killercoda** labs
- **Engage in Discussions**: Share thoughts on loose coupling, SLO/SLI usage, and monitoring scenarios
- **Explore "Digging Deeper"**: Continue into advanced monitoring and dashboard design with resources like Google's SRE Workbook and ProLUG's Prometheus deep dive
