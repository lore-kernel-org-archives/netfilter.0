From: Metal Gear <finattack@gmail.com>
Subject: Port forwarding error
Date: Tue, 1 Mar 2005 22:45:30 +0500
Message-ID: <110c78440503010945afcfa69@mail.gmail.com>
References: <110c784405030102077fa30d3e@mail.gmail.com>
	<42244EE2.5000206@mnemon.de>
Reply-To: Metal Gear <finattack@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42244EE2.5000206@mnemon.de>
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

First of all thanks for quick reply.
After reading the reply throughly i completed my rulesets and sending
it for ur review. I m need little explanation regarding rules u sent
to me
[Quote]
You can do it this way. Remember, that only NEW packages (with SYN
set) will hit this rule. Next step is to allow these connection in
FORWARD chain (assuming the policy id DROP or REJECT).
[/Quote] and

[Quote]
And don't forget to allow ICMP "Destination Unreachable" :)
[/Quote]

Why is this sooo??? Why we need the above two rules.

And for the rules for pop, smtp and dns forwarding what i understood
from the diagram (tables_traverse.jpg) of
(http://iptables-tutorial.frozentux.net/)
- We got a packet from network
- We done NAT PREROUTING
- We FORWARDED the packet
- We done NAT POSTROUTING
- The packet agains flow the interface
Am i right???????

Below is my final rules script based on your help

Thanks
-----------------------------------------------------------------------------------
#!/bin/sh

# Flushing the chains
iptables -F
iptables -F -t nat

# Allow icmp destination unreacable
iptables -A INPUT -p icmp -m icmp --icmp-type destination-unreachable -j ACCEPT

# Rules for Squid
iptables -A INPUT -p tcp -s $LAN_ADDRESS/$NETMASK --dport 3128 -m
state --state NEW,ESTABLISHED,RELATED -j accept
iptables -A OUTPUT -p tcp -d $LAN_ADDRESS/$NETMASK --sport 3128 -m
state --state ESTABLISHED,RELATED -j accept

# Enabling POP3 Forwarding
iptables -A PREROUTING -t nat -d squidip -p tcp --dport 110 -j DNAT
--to $POPSERVER
iptables -A FORWARD -p tcp --dport 110 -d $POPSERVER -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --sport 110 -s $POPSERVER -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -p tcp --dport 110 -d $POPSERVER -j
SNAT --to $SQUIDIP

# Enabling SMTP Forwarding
iptables -A PREROUTING -t nat -d squidip -p tcp --dport 25 -j DNAT
--to $SMTPSERVER
iptables -A FORWARD -p tcp --dport 25 -d $SMTPSERVER -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --sport 25 -s $SMTPSERVER -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -p tcp --dport 25 -d $SMTPSERVER -j
SNAT --to $SQUIDIP

# Enabling DNS Forwarding
iptables -A PREROUTING -t nat -d squidip -p udp --dport 53 -j DNAT
--to $DNSSERVER
iptables -A FORWARD -p udp --dport 53 -d $DNSSERVER -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -s $DNSSERVER -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -p udp --dport 53 -d $DNSSERVER -j SNAT
--to $SQUIDIP

