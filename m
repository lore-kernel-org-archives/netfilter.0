From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Port forwarding with multiple public IPs
Date: Fri, 26 Mar 2004 18:13:13 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403270213.i2R2D9sV011674@server5.bandwidthco.com>
References: <20040325112139.05d42d01@localhost>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040325112139.05d42d01@localhost>
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
To: 'Shane Hickey' <shane@howsyournetwork.com>, netfilter@lists.netfilter.org

No need to apologize.  The answer to your question is NO.  Once the NAT
grabs the initial DNAT connection and accepts, the state tracking process
takes care of the rest from there.  So you do not need to SNAT packets from
the same connection back out.  However, you DNATed packets still need to
pass through the filter table, so you do need an additional rule to accept
them.  By the way, I did not read all your rules as I was able to answer
your question without doing so.  I trust your rules do not contradict the
intent of your question. 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Shane Hickey
Sent: Thursday, March 25, 2004 10:22 AM
To: netfilter@lists.netfilter.org
Subject: Port forwarding with multiple public IPs

Howdy all,
	I apologize if question could have been easily answered somewhere
else.
 I was up till 3AM googling and I wasn't able to find a solution. 
Anyway, I'm migrating my firewall to Linux/Netfilter from FreeBSD/ipfilter.
	My basic question is whether an incoming connection on the external
interface that gets DNAT'd will keep track of itself.  What I mean is that
if I have a public IP address that is mapped to multiple internal servers
(depending on the destination port), do I need to craft SNAT POSTROUTING
rules for each case or will it automagically work?  In ipfilter, I just set
up my 'rdr' lines for my portmap'd and nat'd servers and then I had a global
catch-all 'map' that basically just did masquerading.  If someone wants to
see my ipf and ipnat rules, I can post them.  Hell, if there is some sort of
wonderful ipfilter-to-netfilter converter out there, I'll buy it a 12-pack
of beer.
	Anyway, here is my current broken rule.  Maybe it's just missing
something simple?  With the rule in place, all my internal machines can see
the outside world, but nothing new seems to make it to machines offering
public services.

#!/bin/bash

modprobe iptable_nat
echo 1 > /proc/sys/net/ipv4/ip_forward

OUTSIDE_IP1=<snip>
OUTSIDE_IP2=<snip>
OUTSIDE_IP3=<snip>

# Set default polcies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# Flush all tables
iptables -F
iptables -t nat -F
iptables -t filter -F
# Allow local traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -j ACCEPT

# PREROUTING statements for 1:1 NAT
# (Connections originating from the Internet) #oddballs iptables -t nat -A
PREROUTING -p tcp -d $OUTSIDE_IP1 --dport 22 \ -i eth1 -j DNAT --to
10.0.0.73:22 iptables -t nat -A PREROUTING -p udp -d $OUTSIDE_IP1 --dport
514 \ -i eth1 -j DNAT --to 10.0.0.66:514

#This ip only goes one-to-one
iptables -t nat -A PREROUTING -d $OUTSIDE_IP2 -i eth1 \ -j DNAT --to
10.0.0.68

#This IP is shared by various internal machines iptables -t nat -A
PREROUTING -p tcp -d $OUTSIDE_IP3 --dport 25 \ -i eth1 -j DNAT --to
10.0.0.66:25 iptables -t nat -A PREROUTING -p tcp -d $OUTSIDE_IP3 --dport 53
\ -i eth1 -j DNAT--to 10.0.0.66:53 iptables -t nat -A PREROUTING -p udp -d
$OUTSIDE_IP3 --dport 53 \ -i eth1 -j DNAT --to 10.0.0.66:53 iptables -t nat
-A PREROUTING -p tcp -d $OUTSIDE_IP3 --dport 80 \ -i eth1 -j DNAT--to
10.0.0.69:80 iptables -t nat -A PREROUTING -p tcp -d $OUTSIDE_IP3 --dport
443 \ -i eth1 -j DNAT --to 10.0.0.70:443

# POSTROUTING statements for 1:1 NAT
# (Connections originating from the home network servers) # # NOTE: I don't
believe these lines are needed, so I ditched them.  
# With these lines commented out, all my internal machines can see # the
outside world, but no incoming traffic to the allowed ports # will pass.
With them uncommented, it seemed like the .68 and .66 # machines couldn't do
anything in either direction.
#
#oddballs
#iptables -t nat -A POSTROUTING -p tcp -s 10.0.0.73 \ --sport 22 -o eth1 -j
SNAT --to $OUTSIDE_IP1:22 #iptables -t nat -A POSTROUTING -p udp -s
10.0.0.66 \ --sport 514 -o eth1 -j SNAT --to $OUTSIDE_IP1:514

#this ip only goes one-to-one
#iptables -t nat-A POSTROUTING -s 10.0.0.68 -o eth1 \ -j SNAT --to
$OUTSIDE_IP2

#This IP is shared by various internal machines #iptables -t nat -A
POSTROUTING -p tcp -s 10.0.0.66 \ --sport 25 -o eth1 -j SNAT --to
$OUTSIDE_IP3:25 #iptables -t nat -A POSTROUTING -p tcp -s 10.0.0.66 \
--sport 53 -o eth1 -j SNAT --to $OUTSIDE_IP3:53 #iptables -t nat -A
POSTROUTING -p udp -s 10.0.0.66 \ --sport 53 -o eth1 -j SNAT --to
$OUTSIDE_IP3:53 #iptables -t nat -A POSTROUTING -p tcp -s 10.0.0.69 \
--sport 80 -o eth1 -j SNAT --to $OUTSIDE_IP3:80 #iptables -t nat -A
POSTROUTING -p tcp -s 10.0.0.70 \ --sport 443 -o eth1 -j SNAT--to
$OUTSIDE_IP3:443

# POSTROUTING statements for Many:1 NAT
# (Connections originating from the entire home network)

iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth1 \ -j SNAT --to
$OUTSIDE_IP1

# Allow forwarding to each of the servers configured for 1:1 NAT

# DNS, FTP, SMTP, POP3, HTTP, HTTPS Server iptables -A FORWARD -p tcp -i
eth1 -o eth0 -d 10.0.0.68 \ -m state --state NEW -m multiport --dports
21,25,53,80,110,443 \ -j ACCEPT iptables -A FORWARD -p tcp -i eth1 -o eth0
-d 10.0.0.68 \ -m state--state NEW --dport 50000:50020 -j ACCEPT iptables -A
FORWARD -p udp -i eth1 -o eth0 -d 10.0.0.68 \ -m state --state NEW --dport
53 -j ACCEPT

# DNS, SMTP Server
iptables -A FORWARD -p tcp -i eth1 -o eth0 -d 10.0.0.66 \ -m state --state
NEW -m multiport--dports 25,53 -j ACCEPT iptables -A FORWARD -p udp -i eth1
-o eth0 -d 10.0.0.66 \ -m state --state NEW --dport 53 -j ACCEPT

# SSH Server
iptables -A FORWARD -p tcp -i eth1 -o eth0 -d 10.0.0.73 \ -m state --state
NEW--dport 22 -j ACCEPT

# HTTPS SERVER
iptables -A FORWARD -p tcp -i eth1 -o eth0 -d 10.0.0.70 \ -m state --state
NEW --dport 443-j ACCEPT

# HTTP SERVER
iptables -A FORWARD -p tcp -i eth1 -o eth0 -d 10.0.0.69 \ -m state --state
NEW --dport 80 -j ACCEPT


# Allow forwarding for all New and Established SNAT connections
# originating on the home network AND already established
# DNAT connections

iptables -A FORWARD -t filter -i eth0 -m state -s 10.0.0.0/24 \
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow forwarding for all 1:1 NAT connections originating on
# the Internet that have already passed through the NEW forwarding
# statements above

iptables -A FORWARD -t filter -i eth1 -m state \
--state ESTABLISHED,RELATED -j ACCEPT

# Debugging.  Probably a better way to do it.
#
iptables -A OUTPUT -j LOG --log-prefix "FW_OUTPUT   "
iptables -A INPUT -j LOG --log-prefix "FW_INPUT   "
iptabes -A PREROUTING -j LOG --log-prefix "FW_PREROUTING   "
iptabes -A POSTROUTING -j LOG --log-prefix "FW_POSTROUTING   "
iptables -A FORWARD -j LOG --log-prefix "FW_FORWARD    "

-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F
Listening to: 04



