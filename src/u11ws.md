<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
    <p>
        <h1>Unit 11 Worksheet - Monitoring</h1>
    </p>
</div>

(However, these are not hard fast templates, as long as the style is maintained
there is a degree of freedom. We are using `prettier` for formatting.)

Linux Telemetry is one of the most critical parts of monitoring your system. With good data gathering, 
you can benchmark and baseline current systems. You can predict future capacity and mitigate risk in 
a system. Key Performance Indicators (KPIs) can be established and tracked throughout the lifecycle 
of the system.

### Resources / Important Links

---

- [How to easily monitor your Linux server | Grafana Labs](https://grafana.com/solutions/linux-node/monitor/)
- [30 Linux System Monitoring Tools Every SysAdmin Should Know](https://www.cyberciti.biz/tips/top-linux-monitoring-tools.html)
- [Monitoring Linux Using SNMP - Nagios](https://www.nagios.com/solutions/linux-monitoring/)

### Unit 11 Recording

---

<iframe
    style="width: 100%; height: 100%; border: none;
    aspect-ratio: 16/9; border-radius: 1rem; background:black"
    src="https://www.youtube.com/live/6VOHFYkptOw?si=yXcGL_gE9ckoA9ty"
    title="Unit 11 Recording - ProLUG Linux Systems Administration Course - Free in Discord"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    referrerpolicy="strict-origin-when-cross-origin"
    allowfullscreen>
</iframe>

## Instructions

---

<!-- The instructions are the same for all worksheets. -->

A major aspect of this course is to intake, comprehend, and discuss the assigned
topics. Take the time to fully absorb each topic and contribute to the
discussion thread by sharing your thoughts. Interaction with peers is also
expected; the goal is to compare and contrast ideas to build a solid
foundation of knowledge.

Fill out this worksheet as you watch the unit video.  
Discussion posts can be completed afterwards, answers to be posted in Discord.
You must both answer the discussion questions and respond to another student's
answers. This is only required if you want the certification.

#### Discussion Post #1
---

<blockquote>
Unit 11 Discussion Post 1: You’ve heard the term “loose coupling” thrown around the
office about a new monitoring solution coming down the pike. You find a good resource and
read the section on “Prefer Loose Coupling” https://sre.google/workbook/monitoring/
</blockquote>

1. What does “loose coupling” mean, if you had to summarize to your junior team
members?

2. What is the advantage given for why you might want to implement this type of
tooling in your monitoring? Do you agree? Why or why not?

3. They mention “exposing metrics” what does it mean to expose metrics? What
happens to metrics that are exposed but never collected?

<div class="warning">
Submit your input by following the link below:
</div>

- [Link to Discussion Post 1](PLACEHOLDER) 

#### Discussion Post #2
---

<blockquote> 
Your HPC team is asking for more information about how CPU0
is behaving on a set of servers. Your team has node exporter writing data out to Prometheus
(Use this to simulate https://promlabs.com/promql-cheat-sheet/).
</blockquote>

1. Can you see the usage of CPU0 and what is the query?

2. Can you see the usage of CPU0 for just the last 5 minutes and what is the query?

3. You know that CPU0 is excluded from Slurm, can you exclude that and only pull the
user and system for the remaining CPUs and what is that query?

<div class="warning">
Submit your input by following the link below:
</div>

- [Link to Discussion Post 2](PLACEHOLDER)

## Definitions

---

SLO

SLA

SLIKPI

Span

Trace

Prometheus

Node_Exporter

Grafana

Dashboard

Heads up Display

## Digging Deeper

---

1. Read the rest of the chapter [https://sre.google/workbook/monitoring/](https://sre.google/workbook/monitoring/) 
and note anything else of interest when it comes to monitoring and dashboarding.

2. Look up the “ProLUG Prometheus Certified Associate Prep 2024” in Resources ->
Presentations in our ProLUG Discord. Study that for a deep dive into Prometheus.

3. Complete the project section of “Monitoring Deep Dive Project Guide” from the
prolug-projects section of the Discord. We have a Youtube video on that project as
well. [https://www.youtube.com/watch?v=54VgGHr99Qg](https://www.youtube.com/watch?v=54VgGHr99Qg)

## Reflection Questions

---

<!-- The first reflection question is always the same. -->

1. What questions do you still have about this week?

2. How can you apply this now in your current role in IT? If you’re not in IT, how can you
look to put something like this into your resume or portfolio?

