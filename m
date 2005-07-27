From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: not solve yet!!!
Date: Wed, 27 Jul 2005 09:53:29 +0200
Message-ID: <42E73D79.80202@mnemon.de>
References: <20050725060738.31653.qmail@web42405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050725060738.31653.qmail@web42405.mail.yahoo.com>
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

john decot schrieb:
> Hello all,
>  i am facing a problem in iptables as follows:
>   i have  single nic which ip is eth0= x.x.x.x(public_ip)
>     alias is  eth0:1=y.y.y.y( private_ip)
> the proxy works when ip of server and port 3128 at lan connection is 
> configured at client side(windows os).
> But doesn't work without that whenever i flow traffic to proxy server, 
> again i have used ip tables as:
>  
> iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j REDIRECT --to-port 3128
>  
> with above it doesn't work then i tried following
> iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j DNAT  
> $public_ip or $private_ip:3128
>  
> again the same result.

First configure your proxy to act transparently as Sergio pointed out.
Make sure the proxy is listening on the correct IP(s).

Did you check if your REDIRECT rule is hit (iptables -t nat -nvxL) ? If
the counters increase with each connection attempt, the rule is ok and
the reason is probably the proxy configuration.

If your rule is not hit, try if omitting "-i eth0" changes something.
Possibly there are some more low hanging fruits. Does the clients
default gateway point to your proxy server ? Are there any other rules,
that make connections impossible ? Does the proxy server-name resolve to
your clients ? Did you tcpdump the traffic to see, if packets make it to
the proxy and if so, what is in the conntrack table ? What is your
complete ruleset (either the output of iptables-save or iptables -t
$TABLE_NAME -nvxL) ?

Just some thoughts ;)

HTH and have a nice time,

Joerg


