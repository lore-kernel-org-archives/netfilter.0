From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Scripting a firewall in front of a SMTP server
Date: Sun, 27 Nov 2005 18:11:48 +0100
Message-ID: <000c01c5f375$a70baa90$0101000a@sterenborg.info>
References: <7834b9550511270828o50b7b429o@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7834b9550511270828o50b7b429o@mail.gmail.com>
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

> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP

You're making it harder for yourself setting the policy of OUTPUT to
DROP.
You can always do that when your script is working, if you still want
to.

> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED -p tcp
> --dport 80 -j ACCEPT 
> 
> iptables -A INPUT -i eth0 -m state --state ESTABLISHED -p tcp --sport
> 80 -j ACCEPT 
> 
> iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED -p tcp
> --dport 80 -j ACCEPT 
> 
> iptables -A INPUT -i eth0 -m state --state ESTABLISHED -p tcp --sport
> 80 -j ACCEPT 

Get rid of the 4 rules above because you're going to DNAT port 80.
Forwarded http traffic will hit the FORWARD chain, not INPUT or OUTPUT.
See also :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSING
OFTABLES

> iptables -t nat -A PREROUTING -d xxx.yyy.zzz.ttt -p tcp --dport 80 -j
> DNAT --to-destination 192.168.0.2:80
> 
> iptables -t nat -A PREROUTING -d xxx.yyy.zzz.ttt -p tcp --dport 25 -j
> DNAT --to-destination 192.168.0.2:25
> 
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> iptables -A FORWARD -o eth1 -i eth0 -j ACCEPT
> 
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --destination-port 80 -m
> state --state NEW,ESTABLISHED -j ACCEPT
> 
> iptables -A FORWARD -o eth0 -i eth1 -p tcp --source-port 80 -m state
> --state NEW,ESTABLISHED -j ACCEPT
> 
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --destination-port 25 -m
> state --state NEW,ESTABLISHED -j ACCEPT
>
> iptables -A FORWARD -o eth0 -i eth1 -p tcp --source-port 25 -m state
> --state ESTABLISHED -j ACCEPT 

First, you allow packets to be forwarded from eth0 <-> eth1. No state
matching, so any state matches.
Next, you are trying to match packets with state. They have already
matched.

Try this (only forwarding here, the rest you already have) :

echo 0 > /proc/sys/net/ipv4/ip_forward

iptables -P FORWARD DROP

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -m state --state NEW -i eth0 -o eth1 \
  -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT

iptables -A FORWARD -m state --state NEW -i eth0 -o eth1 \
  -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT

iptables -t nat -A PREROUTING -i eth0 -d xxx.yyy.zzz.ttt \
  -p tcp --dport 80 -j DNAT --to 192.168.0.2:80

iptables -t nat -A PREROUTING -i eth0 -d xxx.yyy.zzz.ttt \
  -p tcp --dport 25 -j DNAT --to 192.168.0.2:25

echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob


