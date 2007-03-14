From: Serge Matovic <matovics@yahoo.com>
Subject: Re: Please help with my bridge/router
Date: Wed, 14 Mar 2007 04:15:52 -0700 (PDT)
Message-ID: <20070314111552.75479.qmail@web50405.mail.re2.yahoo.com>
References: <45F74865.5090008@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F74865.5090008@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Thank you Martijn Lievaart for offering to help. I am
quite new to this topic and I am hesitant to say much,
because it will probably be so stupid. But I must say
that I'm quite proud of my achievement (with all help
from this mailing list) in setting (and making it
work) my home bridge/router/server, all on one Linux
PC.
As you requested here is my script:

=======================================================
#!/bin/sh
### This scriptis is addapted from
http://wiki.linuxquestions.org/wiki/A_basic_firewall_configuration_suitable_for_a_gateway/nat
### BUT modified by me to add my bridge (br0)

ifconfig br0 down
brctl delbr br0
ifconfig eth1 down
ifconfig eth2 down
brctl addbr br0
brctl stp br0 off
brctl addif br0 eth1
brctl addif br0 eth2
ifconfig eth1 down
ifconfig eth2 down
ifconfig eth1 0.0.0.0 up
ifconfig eth2 0.0.0.0 up
ifconfig br0 192.168.0.20 up

ipt=/sbin/iptables
extip=ppp0   # Connected to Sympatico ADSL modem
lan=br0 # My Home LAN

iptables -F
iptables -t nat -F
iptables -t mangle -F

# start firewall
echo 1 > /proc/sys/net/ipv4/ip_forward

# default policies
$ipt -P INPUT DROP
$ipt -P FORWARD DROP

# NAT
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

# INPUT chain
$ipt -A INPUT -i lo -j ACCEPT
$ipt -A INPUT -i br0 -j ACCEPT
$ipt -A INPUT -i ppp0 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$ipt -A INPUT -p tcp --destination-port 22 -j ACCEPT

# FORWARD chain
$ipt -A FORWARD -i br0 -j ACCEPT
$ipt -A FORWARD -i ppp0 -m state --state
ESTABLISHED,RELATED -j ACCEPT

#The following line solved the inabilty to load some
sites, like globaltv.com. It was suggested by
Alexandru Dragoi after I posted the question to
netfilter@lists.netfilter.org
iptables -I FORWARD -j TCPMSS  -o ppp0 -p tcp
--tcp-flags SYN,RST SYN --clamp-mss-to-pmtu

#The following line was also suggested by ArcosCom
Linux User after I posted the question to
netfilter@lists.netfilter.org in an effort to solve
the inabilty to load some sites, like globaltv.com,
but I haven't tried it yet.
#iptables -t mangle -A FORWARD -p tcp --tcp-flags
SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

exit 0
=======================================================

Thank you, and best regards,
serge.


--- Martijn Lievaart <m@rtij.nl> wrote:

> Serge Matovic wrote:
> > Alexandru !!! THANK YOU/THANK YOU/THANK YOU !!!!
> > I typed in your line (at the end of all of my
> commands
> > to setup the bridge and router) and it WORKS !!!
> > Now, I must find out what your line did to enable
> > those sites that failed to load before, to load
> now.
> >   
> 
> Most of the time, this means you don't allow the 
> icmp-fragmentation-needed-but-df-bit-is set packets
> in. If you don't 
> have these rules
> 
> -A FORWARD -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> 
> right on the top of your ruleset, that is your
> problem.
> 
> /me goes to bed, wondering how many bad recipes for
> iptables are on the 
> net. You're only the third this month....
> 
> Post the output of iptables-save so we can examine
> your ruleset please.
> 
> HTH,
> M4
> 
> 



 
____________________________________________________________________________________
Never miss an email again!
Yahoo! Toolbar alerts you the instant new Mail arrives.
http://tools.search.yahoo.com/toolbar/features/mail/

