From: Gadgeteer <gadgeteer@elegantinnovations.org>
Subject: ruleset review
Date: 17 Apr 2003 16:46:50 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050619610.3708.84.camel@penguin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>

Hi,

Been lurking and reading docs for a bit now.  I am getting to the point
with the ruleset for the gateway box that I am no longer sure that I am
not missing something.  If folks would review the script for
clueful-ness it would be greatly appreciated.  (If it turns out I have a
clue I would feel more qualified to comment on other's problems. :-)
Otherwise, I am happy to acquire some.)

The most helpful iptables doc was Iptables Tutorial by Oskar
Andreasson.  Thanks to this list I tossed the old-style IP alias set up
for the ip tool and the Linux Advanced Routing & Traffic Control HOWTO.

I have used bits and pieces from here and there thus I am worried about
the script's coherence.  I would love to hear about a better way of
allowing remote access to the winblows box.

cheers,
ken


/* iptables */

#! /bin/bash

# Delete and flush old tables and rulesets
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
iptables -t mangle -F

# define policy
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# enable loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# enable DNAT for win2k
iptables -t nat -A PREROUTING -p tcp -d <public ip> \
  -j DNAT --to <private ip>

# create user defined chains
iptables -N win2k
iptables -N traffic
iptables -N stopout
iptables -N ftp

# create/define win2k chain
iptables -A win2k -p tcp ! --syn -m state --state NEW -j LOG \
  --log-prefix "**NEW not syn: "
iptables -A win2k -p tcp ! --syn -m state --state NEW -j DROP
# remote host needs access to internal server
iptables -A win2k -p tcp -s <remote ip/32> -j ACCEPT
iptables -A win2k -p tcp --dport 80 -j ACCEPT
iptables -A win2k -p tcp -j traffic
iptables -A win2k -p all -j LOG -m limit --limit 1/s \
  --log-prefix "** End 'o chain  "
iptables -A win2k -p all -j DROP

# authorized lan traffic
iptables -A traffic -m state --state ESTABLISHED,RELATED \
 -j ACCEPT
iptables -A traffic -m state --state NEW -i ! eth1 -j ACCEPT
iptables -A traffic -j LOG -m limit --limit 1/s \
 --log-level info --log-prefix "**PACKET_DROP** "
iptables -A traffic -j DROP

iptables -A INPUT -j traffic
iptables -A OUTPUT -j traffic
iptables -A FORWARD -p tcp -d <private ip> -j win2k
iptables -A FORWARD -j traffic

# block braindead outbound traffic
iptables -A FORWARD -p udp --dport 137:138 -j stopout
iptables -A FORWARD -p tcp --dport 139 -j stopout
iptables -A FORWARD -p udp --dport 145 -j stopout
iptables -A FORWARD -p udp --dport 10008 -j stopout  # lion
iptables -A FORWARD -p udp --dport 65535 -j stopout  # ramen

# define stopout chain
iptables -A stopout -m limit --limit 1/s -j LOG \
  --log-level info --log-prefix "**WTF?**  "
iptables -A stopout -j DROP

# set up IP forwarding and snat
iptables -A FORWARD -i eth1 -o eth0 -m state \
 --state ESTABLISHED,RELATED -j ACCEPT 
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -j LOG -m limit --limit 1/s \
  --log-level info --log-prefix "**FORWARD_DROP** "
iptables -A FORWARD -j DROP
iptables -t nat -A POSTROUTING -o eth1 \
 -j SNAT --to <public ip> 

# connection tracking ftp
# allow outbound
iptables -A ftp -i eth0 -p tcp --sport 21 -m state \
 --state ESTABLISHED -j ACCEPT
iptables -A ftp -o eth1 -p tcp --dport 21 -m state \
 --state NEW,ESTABLISHED -j ACCEPT
# passive ftp
iptables -A ftp -i eth0 -p tcp --sport 1024:65535 --dport 1024:65535 \
 -m state --state ESTABLISHED -j ACCEPT
iptables -A ftp -o eth1 -p tcp --sport 1024:65535 --dport 1024:65535 \
 -m state --state ESTABLISHED,RELATED -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

/* end iptables */


