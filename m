From: =?ISO-8859-15?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ppooe state RELATED,ESTABLISHED issue
Date: Fri, 05 Aug 2005 10:55:58 +0200
Message-ID: <42F3299E.9030701@mnemon.de>
References: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
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

Ted Kaczmarek schrieb:
> Today I was testing a Centos 4.1(RH ES4 clone) with  2.6.9-11.EL and a
> Verizon dsl connection. I couldn't get any connection tracking related
> rules working on the pppoe interface.
> 
> -A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> The only way I could get it to forward traffic 
> was to allow all INPUT and FORWARD traffic for ppp0.

Definitely not what you want :)

> The pppoe is using eth0 and the inside interface is eth1.
> 
> Googling uncovered a thread with respect to connection tracking being
> broken 
> with bridging.
> 
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0506.2/0422.html
> 
> Is this really the same issue? If packets are coming in eth1 and leaving
> ppp0(using eth0) are they not just being routed?

With policies set to ACCEPT and no other rules in place: Yes.

> If eth0 is up the I can see packets
> being bridged from ppp0e to eth0, but with eth0 down I am at a loss as
> to why this is happening.

Ofcourse, if eth0 is down no ppp traffic is possible.

> Also is this issue specific to 2.6? A 2.4 based machine would likely
> suffice in this application.

Probably not, but I don't know.

Well to start off, ppp0 is a logical interface, encapsulating the
physical interface (here: eth0). So, all your rules - as you did - must
be applied to eth1 and ppp0. You are forwarding packets, so must
MASQUERADE all outgoing traffic through ppp0. In most cases you can't
use SNAT, except your ISP gives you allways the same IP when you go
online (in Germany DSL connections are disconnected by the ISP once a day).

So, a basic rule-set could look like this:

echo 1 > /proc/sys/net/ipv4/ip_forward

-P INPUT DROP
-P FORWARD DROP

-A INPUT[FORWARD] -m state --state RELATED,ESTABLISHED -j ACCEPT

-t nat -A POSTROUTING -o ppp0 -j MASQUERADE

From now on, all you have to do is allowing the connections you want on
the respective interface like this:

-A INPUT -i ppp0 -p tcp --dport 80 --syn -j ACCEPT

Same goes for eth1. Forwarding looks just the same:

-A FORWARD -i eth1 -p tcp --dport 119 --syn -j ACCEPT

if you are DNATing connetions to your router, you must SNAT them too:

-t nat -A PREROUTING -i eth1 -p tcp --dport 119 \
   -j DNAT --to $NNTP_IP
-t nat -A POSTROUTIMG -o eth1 -p tcp --sport 119 \
   -j SNAT --to $NAT_BOX_IP_ON_ETH1

Always assuming, that all policies not mentioned yet, are set to ACCEPT.
Additionally, I'm a friend of this (last rule):

-A INPUT[FORWARD] -p tcp -j REJECT --reject-with tcp-reset

HTH and have a nice time,

Joerg


