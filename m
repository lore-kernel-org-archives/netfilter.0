From: =?ISO-8859-15?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: multiport
Date: Fri, 17 Jun 2005 10:16:50 +0200
Message-ID: <42B286F2.3050302@mnemon.de>
References: <1118930391.16084.2.camel@debianbox>	<20050616141652.GA27648@bender.817west.com>	<200506160957.17356.rob0@gmx.co.uk>
	<1118935612.16084.16.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118935612.16084.16.camel@debianbox>
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

Sadus . schrieb:
> Maybe a misconception from my part here, please correct me:
> 
> When you want to block an IP from connecting to the internet, should i
> use: 
> iptables -A INPUT -i $INTERNAL -s 192.168.1.2 -j DROP
> or 
> iptables -A FORWARD -i $INTERNAL -s 192.168.1.2 -j DROP or both?
> 
> since the firewall is set to the gateway, then any client will try to
> connect to the IP of the gateway to then establish a connection with the
> site needed, if i already block that IP to connect to my NIC via the
> INPUT chain, then there is no need for me to DROP in FORWARD, or is it
> the other way around? 

It depends on your configuration. If you use a proxy on your gateway /
firewall like squid, then the INPUT chain will be hit, because your
clients connect to your proxy. BTW, in this configuration you don't need
to set ip_forward to 1.

If, on the other hand, there is no proxy, then your clients connect
directly to the respective site on the internet and thus the forward
chain will be hit. Because your clients use RFC 1918 addresses, which
will be dropped on the first router on the internet, you need a
MASQUERADE / SNAT rule in nat / POSTROUTING in this case. Otherwise
nothing will work. And you must set ip_forward to 1.

Generally I agree with with all the people saying, that the best
approach is to have a DROP policy in INPUT / FORWARD and then only allow
the traffic you want. It's simple and clean in my opinion.

HTH and have a nice time,

Joerg


