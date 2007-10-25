From: Timothy Meader <Timothy.Meader@gsfc.nasa.gov>
Subject: Setting Source IP for outgoing traffic?
Date: Wed, 24 Oct 2007 22:47:12 -0400
Message-ID: <6.2.5.6.2.20071024220938.034412a8@gsfc.nasa.gov>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I'm having an issue that I'm hoping someone could provide me 
some help on. To give a brief synopsis of the situation:

We originally had a single server setup running OSSEC. Last week, we 
decided to combine this server with another two that were running as 
a simple log server (in high availability fail-over mode using 
heartbeat) to make better use of the existing systems. The log server 
portion is running on the virtual IP xxx.xxx.xxx.7 on eth0:0, the 
OSSEC server is setup to run on a secondary virtual IP, 
xxx.xxx.xxx.29, on eth0:1. When running on a single server, OSSEC 
worked fine. But now, the clients refuse to communicate properly with 
the server.

Using tcpdump, I tracked this communications problem down to the fact 
that the server response from OSSEC in the high availability setup is 
going back to the client with the ACTUAL address of eth0 
(xxx.xxx.xxx.17 or 18 depending on which of the two high-avail nodes 
it's currently running on). What I need is for the server response to 
come back to the client with the xxx.xxx.xxx.29 address as the 
source. I've investigated the "IPsrcaddr" script that comes with 
heartbeat, but unfortunately there are two issues that preclude me 
from using it, so I'm looking to iptables for a means to handle this.

Basically, I need the responses to any traffic coming in on UDP port 
1514 (or, alternatively, to the destination IP x.29) to go back out 
with a src address of x.29 instead of x.17 or x.18. Is there a method 
using iptables that can handle this problem? Or barring that, can 
anyone think of any other means to accomplish this task if iptables 
can't handle this on its own? Below, I've included the current 
iptables data rules that the two cluster nodes are presently sharing.

Thank you in advance for any and all replies up-front.

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -i eth1 -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 514 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 514 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 720 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 
1514 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 
5514 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 
5140 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 
8000:8001 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 
8089 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT

---
Tim Meader
L-3 Communications, NASA EOS Security Operations
Timothy.Meader@gsfc.nasa.gov
(301) 614-6371 

