From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Maybe a Newbie question about SNAT/DNAT
Date: Fri, 13 May 2005 12:17:01 +0200
Message-ID: <42847E9D.4070107@mnemon.de>
References: <001701c5573b$bb21d210$0bc8a8c0@DES007>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001701c5573b$bb21d210$0bc8a8c0@DES007>
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

Hi Melim,

melim schrieb:
> 
> I have a valid IP in a interface eth2 and a internal net ip on eth0, I'm
> using some well documented rules to redirect port requisitions to another
> internal server.
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d 200.180.X.X -j
> DNAT --to-destination 192.168.200.251
> iptables -t nat -A POSTROUTING -p tcp --sport 80 -s 192.168.200.251 -j
> SNAT --to-source 200.180.X.X

...

> On the webserver I have a default gateway defined to another router, but
> even removing it, won't work.
> Only works when I defined the default GW to my router machine, but I don't
> want to do this.

So you DNAT HTTP requests to 192.168.200.251 and you SNAT the reponses
to 200.180.X.X. Ok so far. Some tcpdump would be nice, but I think you
can solve this with the following rule:

iptables -t nat -I POSTROUTING -p tcp -o eth0 --dport 80 \
         -j SNAT --to-source 192.168.200.254

This assumes that eth0 on your router is 192.168.200.254. I think this
happens:

Incoming request from e.g. 1.1.1.1. DNAT to 192.168.200.251. This packet
arrives at the web server:

dst: 192.168.200.251
src: 1.1.1.1 !!

As 1.1.1.1 is not known to the web server he sends it to his default
gateway, which is _not_ the router, so the packets vanish. tcpdump a bit
and probably you will see exactly this.

HTH and have a nice time,

Joerg


