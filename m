From: Peter Kaagman <prjv.kaagman@gmail.com>
Subject: Ipsec and masquerading
Date: Tue, 30 Mar 2010 21:01:50 +0200
Message-ID: <c59a952f1003301201o1da401ffsc515d797fe56d3ff@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=BlDFGmupZboSXaaA7rp7OXRwWt/FouS1fjza8ev0BY0=;
        b=UcMvb+ybhVIWWvOelCjwdYvwlQCImoBcUK0470kJMdp6iXP8TIlKR0NMpwp18pDC1f
         lS8XYuDYbnP3abqI5xm7XO8GiULM4aXC+2tzxbFVCv+zlQVOFfLQyfkk4m7Vvs4X5Slu
         PCWNMs/iIfqrOPyz0JHBIYlXQ+fJi/8SF3I3k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there list,

For our school administration (I work for a school) we need to make a site
to site ipsec tunnel. Which is our very first ipsec tunnel we need. In
production this tunnel would go over the Internet. For testing purposes
I've made a lab kinda resembling the situation. The host "aap" would be our
router/firewall which is connected to the internet. The host "pfSense" is
the router/firewall on the other end (they actually have a cisco box to do
the job).

           10.9.2.95   10.9.0.9/16   10.9.2.89
 ____________                            _________
| aap        |                          | pfSense|
| ubuntu 9.10|--------------------------| 2.0    |
 ------------                           ----------
      |10.3.0.1                              |10.1.0.1
      |                                      |
      |                                      |
      |10.3.0.0/16                           |10.1.0.0/16
      |                                      |
      |                                      |
 _____|__                              ______|______
| noot   |10.3.0.2                     | mies       |10.1.0.2
| winxp  |                             | ubuntu 9.10|
 --------                               ------------

One of our subnets (10.9.0.0/16) acts as the Internet in this lab. The
other subnets 10.3.0.0/16 and 10.1.0.0/16 are the respective private
subnets. Neither router/firewall has a route to the others private subnet.

The ipsec part itself is not the problem: whenever I start the tunnel mies
can ping noot and noot can ping mies. Tcpdump confirms that traffic takes
place over the tunnel. The problem starts whenever I load the iptable rules
on aap:

#! /bin/sh

# Some vars
ext_if="eth1"
int_if="eth0"
lo_if="lo"

# Init commands
# flush en clear all rules and reset counters
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z

#iptables -P INPUT ACCEPT
#iptables -P FORWARD ACCEPT
#iptables -P OUTPUT ACCEPT
#iptables -t nat -P PREROUTING ACCEPT
#iptables -t nat -P POSTROUTING ACCEPT
#iptables -t nat -P OUTPUT ACCEPT
#exit 1

# set de default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
# kernel
# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
#
# Rules
###################################################
# Sysop-2 has access through ssh
###################################################
iptables -A INPUT  -i $ext_if -p tcp -s 10.9.0.20 --dport 22 -j ACCEPT
iptables -A OUTPUT -o $ext_if -p tcp -d 10.9.0.20 --sport 22 -j ACCEPT
# Enable loopback
iptables -A INPUT  -i $lo_if -j ACCEPT
iptables -A OUTPUT -o $lo_if -j ACCEPT
# Masquerade
#iptables -t nat -I POSTROUTING 1  -p 50 -j ACCEPT
#iptables -t nat -I POSTROUTING 2  -p 51 -j ACCEPT
iptables -A POSTROUTING -t nat -o $ext_if -j MASQUERADE
###################################################
# Accept ESTABLISHED and RELATED connection
###################################################
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state INVALID  \
         -j LOG --log-prefix "INVALID Input: "
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID \
         -j LOG --log-prefix "INVALID Output: "
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID \
         -j LOG --log-prefix "INVALID Forward: "
iptables -A FORWARD -m state --state INVALID -j DROP
###################################################
# IPSec
###################################################
remote=10.9.2.89
remotenw=10.3.0.0/16
# Allow esp, ah and key exchange
iptables -A INPUT  -i $ext_if -p esp -s $remote -j ACCEPT
iptables -A INPUT  -i $ext_if -p ah  -s $remote -j ACCEPT
iptables -A OUTPUT  -o $ext_if -p esp -d $remote -j ACCEPT
iptables -A OUTPUT  -o $ext_if -p ah  -d $remote -j ACCEPT
iptables -A INPUT  -i $ext_if -p udp --sport 500 --dport 500 \
         -s $remote -j ACCEPT
iptables -A OUTPUT -o $ext_if -p udp --sport 500 --dport 500 \
         -d $remote -j ACCEPT

# Open the tunnel
iptables -A FORWARD -i $ext_if -s $remotenw -j ACCEPT
iptables -A FORWARD -o $ext_if -d $remotenw -j ACCEPT
####################################################################
# Collect trash
####################################################################
iptables -A INPUT   -j LOG --log-prefix "filtered on INPUT "
iptables -A OUTPUT  -j LOG --log-prefix "filtered on OUTPUT "
iptables -A FORWARD -j LOG --log-prefix "filtered on FORWARD "


(trimmed it down as much as possible)
Whenever I load thes rules mies keeps on pinging noot. But noot can no
longer reach mies. Instead the traffic is routed to 10.9.0.1 and from there
to our (real) Internet gateway. That gateway gladly reports it wil not
route to a private range ip (good for him).


The problem seems to be the line:
iptables -A POSTROUTING -t nat -o $ext_if -j MASQUERADE

When I comment out that line everything works as it should. Except for
masquarading offcourse. I do need to masq though.

If I understand correctly masquerading takes place as a last step before
the packet is put through my external interface. Because it than has a src
adress 10.9.2.95 it no longer enters the tunnel and is treated as a normal
package and routed to the default gateway 10.9.0.1.

When I googled the problem I found a couple of hints on what to do. One of
them was adding the following lines before the masquarading is done:
iptables -t nat -I POSTROUTING 1  -p 50 -j ACCEPT
iptables -t nat -I POSTROUTING 2  -p 51 -j ACCEPT
These line would make sure the ipsec traffic is not masquaraded. It didn't
work. Besides that... I really do not understand how those lines work.

An other suggestion was altering the masquarading line to:
iptables -A POSTROUTING -t nat -o $ext_if ! -p esp -j MASQUERADE
(btw... how do you put esp AND ah in that line :S)
That one looked good - I can even make sense of it - but it didn't do the
trick either :(

Thought about using nat-t... but as far as I know nat-t only applies when
the ipsec gateway is behind a masquerading firewall, in my case the ipsec
gateway IS the firewall. Allso thought about replacing my firewall with
pfSense since it seems to be doing the job. But the current stable release
(1.2.3) does not have the traffic shaping options I need and the 2.0 is far
from stable yet.

It sounds logical that ipsec traffic should bypass the masquerading. But at
the moment I am at a complete loss on how to do this. Your help would be
greatly appreciated... a solution would be great... recommended reading
(rtfm ;))just fine.

Since ipsec seems to work just fine I did not put in the setkey script and
the racoon.conf. If you think it would help... just say so and I'll post it
here.

Peter
