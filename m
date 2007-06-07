From: Stefan Mayr <stefan@mayr-stefan.de>
Subject: Using DNAT and SNAT to do a local redirection does not work (want
 to do what rinetd does with iptables)
Date: Thu, 07 Jun 2007 22:30:57 +0200
Message-ID: <46686B01.6080605@mayr-stefan.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

assume the following clustering setup:

Loadbalancer              Server1:
eth0: 192.168.1.1/24  ->  eth0: 192.168.1.2/24
eth0: 192.168.1.101/32    lo0:  192.168.1.101/32 JBoss-Web bound to 8080
eth0: 192.168.1.102/32    lo0:  192.168.1.102/32 JBoss-Web bound to 8080
eth0: 192.168.1.103/32    lo0:  192.168.1.103/32 JBoss-Web bound to 8080
...                       ...

                          Server2:
                      ->  eth0: 192.168.1.3/24
                          lo0:  192.168.1.101/32 JBoss-Web bound to 8080
                          lo0:  192.168.1.102/32 JBoss-Web bound to 8080
                          lo0:  192.168.1.103/32 JBoss-Web bound to 8080
                          ...

all Linux machines (Balancer is Linux virtual server + keepalived with
direct routing setup)

Loadbalancing works so far:
1. Balancer receives packet and forwards it to Server1 or Server2 (L2
via MAC-address)
2. Server responds direct to the client (no backward traffic over the
loadbalancer)

And here comes the problem:
the loadbalancer should check whether the JBoss-Webservers are still
alive but internal check-utils can only connect to the ip eth0. The
different JBoss instances are not bound to this IP because they only the
first could bind to port 8080. But I can specify another port for each
health check. So my thought was:
Health check against Server1:
1. JBoss: check against 192.168.1.2:10001, NAT it to 192.168.1.101:8080
2. JBoss: check against 192.168.1.2:10002, NAT it to 192.168.1.102:8080
3. JBoss: check against 192.168.1.2:10003, NAT it to 192.168.1.103:8080
and so on for the next server.

I thought this would be easy to do with some simple iptables rules on
Server1/2. Maybe I am to stupid but I cannot get it to work.

I thought to use the following rules:
# Clear rules
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
# Setup NAT to change destination
iptables -t nat -A PREROUTING  -p tcp -d 192.168.1.2  --dport 10001 -j
DNAT --to-destination 192.168.1.101:8080
iptables -t nat -A PREROUTING  -p tcp -d 192.168.1.2  --dport 10002 -j
DNAT --to-destination 192.168.1.102:8080
iptables -t nat -A PREROUTING  -p tcp -d 192.168.1.2  --dport 10003 -j
DNAT --to-destination 192.168.1.103:8080
# make my answers appear from the server-ip and change source back
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.101  --sport 8080
-j SNAT --to-source=192.168.1.2:10001
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.102  --sport 8080
-j SNAT --to-source=192.168.1.2:10002
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.103  --sport 8080
-j SNAT --to-source=192.168.1.2:10003

so far my idea - but it doesn't work. I added some logging to these
rules an found out the following:
1. when I open a connection to the server, e.g. 192.168.1.2:10001, the
DNAT works (at least I see the "SYN" in the nat-PREROUTING-LOG)
2. the server responds with "ACK RST" but from 192.168.1.101:8080
(filter-OUTPUT-LOG)

- Why does the response not go through nat-POSTROUTING?
- Why the "RST"? Or do I read the logs all wrong?

I hope somebody can help me with this.

What I want to achive is the functionality of rinetd with NAT to
addresses/ports on the same machine instead of a daemon that acts like a
proxy (only another process that could die ...)

Thanks in advance,

    Stefan

PS: The "big picture" with by JBoss-instances is only my example setup.
To exclude the JBoss as problem I tested it also with httpd and telnetd.
rinetd works - but I prefer having this done in the linux kernel - if it
can do it. Just to eliminate sources of failure.


