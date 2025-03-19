<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64">
    <p>
        <h1>Unit 9 Worksheet - Containerization with Podman on Linux</h1>
    </p>
</div>

This unit is all about containerization using Docker/Podman.

We'll cover what a container is, how to utilize and administer containers as Linux
sysadmins, and how to both download and build new container images.

We also touch on different types of environments (dev/prod) and the concept of CI/CD
pipelines.

### Resources / Important Links

- [Dockerfile Reference Page](https://docs.docker.com/reference/dockerfile/)
- [Podman Command List](https://docs.podman.io/en/latest/Commands.html)

### Unit 9 Recording

<iframe
    style="width: 100%; height: 100%; border: none;
    aspect-ratio: 16/9; border-radius: 1rem; background:black"
    src="https://www.youtube.com/embed/_lo50mgERJY?si=diwjdV3x4pZfO7F_"
    title="Unit 9: Containerization with Podman on Linux"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    referrerpolicy="strict-origin-when-cross-origin"
    allowfullscreen>
</iframe>

## Instructions

---

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

It’s a slow day in the NOC and you have heard that a new system of container deployments are being used by your developers. Do some reading about containers, docker, and podman.

1.  What resources helped you answer this?

2.  What did you learn about that you didn’t know before?

3.  What seems to be the major benefit of containers?

4.  What seems to be some obstacles to container deployment?

#### Discussion Post #2

Scenario:

<blockquote>

You get your first ticket about a problem with containers. One of the engineers is trying to move his container up to the Dev environment shared server. He sends you over this information about the command he’s trying to run.

```plaintext
[developer1@devserver read]$ podman ps
CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
[developer1@devserver read]$ podman images
REPOSITORY                TAG                IMAGE ID      CREATED      SIZE
localhost/read_docker     latest             2c0728a1f483  5 days ago   68.2 MB
docker.io/library/python  3.13.0-alpine3.19  9edd75ff93ac  3 weeks ago  47.5 MB
[developer1@devserver read]$ podman run -dt -p 8080:80/tcp docker.io/library/httpd
```

You decide to check out the server

```plaintext
[developer1@devserver read] ss -ntulp
Netid   State    Recv-Q   Send-Q      Local Address:Port        Peer Address:Port         Process
udp     UNCONN   0        0           127.0.0.53%lo:53               0.0.0.0:*             users:(("systemd-resolve",pid=166693,fd=13))
tcp     LISTEN   0        80              127.0.0.1:3306             0.0.0.0:*             users:(("mariadbd",pid=234918,fd=20))
tcp     LISTEN   0        128               0.0.0.0:22               0.0.0.0:*             users:(("sshd",pid=166657,fd=3))
tcp     LISTEN   0        4096        127.0.0.53%lo:53               0.0.0.0:*             users:(("systemd-resolve",pid=166693,fd=14))
tcp     LISTEN   0        4096                    *:8080                   *:*             users:(("node_exporter",pid=662,fd=3))
```

</blockquote>

1. What do you think the problem might be?

   - How will you test this?

2. The developer tells you that he’s pulling a local image. Do you find this to be
   true, or is something else happening in their `run` command?

<div class="warning">
Submit your input by following the link below:
</div>

- [Link to Discussion Posts](https://discord.com/channels/611027490848374811/1304889728281084017)

## Definitions

---

Container:

Docker:

Podman:

CI/CD:

Dev/Prod Environments (Development/Production Environments):

Dockerfile:

Docker/Podman images:

Repository:

## Digging Deeper

---

1. Find a blog on deployment of some service or application in a container that interests you.  
   See if you can get the deployment working in the lab.

   - What worked well?
   - What did you have to troubleshoot?
   - What documentation can you make to be able to do this faster next time?

2. Run this scenario and play with K3s: <https://killercoda.com/k3s/scenario/intro>

## Reflection Questions

---

1. What questions do you still have about this week?

2. How can you apply this now in your current role in IT? If you’re not in IT, how
   can you look to put something like this into your resume or portfolio?
