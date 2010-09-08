From: giggzounet <giggzounet@gmail.com>
Subject: help to build iptables rules for an oscar cluster
Date: Wed, 08 Sep 2010 15:57:22 +0200
Message-ID: <i684o2$68n$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm new on this list and noob in iptables rules. So I'm searching a
little bit help. I'm trying to build a simple firewall for our cluster
(Oscar/CentOS 5.5). I just want a ssh access in input for the head node.
All the others things in input must be blocked (at the moment) for the
head node. The nodes must have a total free access to the head node.

On the head node I have in /etc/sysconfig/iptables

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [24392:5034163]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
#
#
-A INPUT -j RH-Firewall-1-INPUT
-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set
--name SSH --rsource -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -m recent --update --seconds 60
--hitcount 4 --rttl --name SSH --rsource -j LOG --log-prefix
"SSH_brute_force "
-A INPUT -p tcp -m tcp --dport 22 -m recent --update --seconds 60
--hitcount 4 --rttl --name SSH --rsource -j DROP
#
#
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
#
# begin: allowed networks
-A RH-Firewall-1-INPUT -s 192.168.0.0/255.255.255.0 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.100.0/255.255.255.0 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.200.0/255.255.255.0 -j ACCEPT
-A RH-Firewall-1-INPUT -s 139.11.215.0/255.255.128.0 -j ACCEPT
-A RH-Firewall-1-INPUT -s 139.11.0.0/255.255.0.0 -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -p esp -j ACCEPT
-A RH-Firewall-1-INPUT -p ah -j ACCEPT
-A RH-Firewall-1-INPUT -d 224.0.0.251 -p udp -m udp --dport 5353 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 631 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j
ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
-A RH-Firewall-1-INPUT -j LOG
-A RH-Firewall-1-INPUT -j DROP
COMMIT




An iptables -L gives me:
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
RH-Firewall-1-INPUT  all  --  anywhere             anywhere
RH-Firewall-1-INPUT  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
state NEW recent: SET name: SSH side: source
LOG        tcp  --  anywhere             anywhere            tcp dpt:ssh
recent: UPDATE seconds: 60 hit_count: 4 TTL-Match name: SSH side: source
LOG level warning prefix `SSH_brute_force '
DROP       tcp  --  anywhere             anywhere            tcp dpt:ssh
recent: UPDATE seconds: 60 hit_count: 4 TTL-Match name: SSH side: source

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
RH-Firewall-1-INPUT  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain RH-Firewall-1-INPUT (3 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  192.168.0.0/24       anywhere
ACCEPT     all  --  192.168.100.0/24     anywhere
ACCEPT     all  --  192.168.200.0/24     anywhere
ACCEPT     all  --  139.11.128.0/17      anywhere
ACCEPT     all  --  139.11.0.0/16        anywhere
ACCEPT     icmp --  anywhere             anywhere            icmp any
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
ACCEPT     esp  --  anywhere             anywhere
ACCEPT     ah   --  anywhere             anywhere
ACCEPT     udp  --  anywhere             224.0.0.251         udp dpt:mdns
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ipp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ipp
ACCEPT     tcp  --  anywhere             anywhere            state NEW
tcp dpt:http
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere            state NEW
tcp dpt:ssh
REJECT     all  --  anywhere             anywhere            reject-with
icmp-host-prohibited
LOG        all  --  anywhere             anywhere            LOG level
warning
DROP       all  --  anywhere             anywhere




Thx in advance,
Best regards,
GiGGz

