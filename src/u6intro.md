# Unit 6

## Overview 

### Concepts  

This unit focuses on Nohup environments and firewalls. 

- We will cover Nohup tools and how to properly use Nohup environments.
- We will explore different types of firewalls and learn the use cases for each firewall type.

## Learning Objectives

1. **Become familiar with the `nohup` command:**  
   - Learn real-life use cases of the `nohup` command.  
   - Understand the correlation between jump boxes and Nohup environments, including `screen` and `tmux`.  

2. **Implement and manage Nohup environments:**  
   - Learn how `nohup` allows processes to continue running after a user logs out, ensuring that long-running tasks are not interrupted.  
   - Develop skills in managing background processes effectively using `nohup`, `screen`, and `tmux`.  

3. **Develop effective troubleshooting methodologies:**  
   - Acquire systematic approaches to diagnosing firewall misconfigurations, network connectivity issues, and unauthorized access attempts.  
   - Apply structured troubleshooting strategies to minimize downtime and maintain high availability.  

## Prerequisites

- A basic understanding of how processes work.  
- Familiarity with the `firewalld` service.  
- The ability to understand `.xml` files.  

## Key Terms and Definitions

1. **Firewall**: A security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules. Firewalls can be hardware, software, or a combination of both.  

2. **Zone**: A segment of a network with a defined security level, often used in firewall configurations to separate trusted, untrusted, and semi-trusted areas.  

3. **Service**: A network application or function that listens on a specific port, such as web services, email, or remote access.  

4. **DMZ (Demilitarized Zone)**: A network segment that sits between an internal network and an external network. It is used to host public-facing services while isolating them from the internal network for security purposes.  

5. **Proxy**: An intermediary server that processes network requests on behalf of clients. Proxies can enhance security, privacy, and performance by filtering traffic, caching content, and masking IP addresses.  

6. **Stateful Packet Filtering**: A type of firewall filtering that tracks active connections and makes decisions based on the state of the connection. It allows returning traffic from an established session but blocks unsolicited packets.  

7. **Stateless Packet Filtering**: A simpler form of firewall filtering that inspects packets independently, without keeping track of established connections. It applies rules based only on packet headers.  

8. **WAF (Web Application Firewall)**: A specialized firewall that protects web applications by filtering, monitoring, and blocking malicious traffic.  

9. **NGFW (Next-Generation Firewall)**: An advanced firewall that combines traditional firewall capabilities with additional security features.  
