From: "Michael Klinteberg" <michael@klintan.cjb.net>
Subject: Re: Proxy Chaining
Date: Wed, 24 Sep 2003 14:38:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008201c38298$c0e4dd10$c800a8c0@klintan.local>
References: <200309191536.h8JFaV48002076@webmail2.magma.ca>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Javier Govea" <jgovea@magma.ca>
To: <netfilter@lists.netfilter.org>
Sent: Friday, September 19, 2003 5:36 PM
Subject: Proxy Chaining


> Hi to all,
>
> I want to setup a chain of proxies and I was wondering if this could be
done with
> iptables. Any advice is very welcome. Here is more in detail what I
want:
>
> Host A needs to forward all traffic (http, ftp, icmp, ...) to Host B,
which in turns
> forwards all traffic to Host C, which in turns forawards everything to
its default
> gateway. The hosts do not belong to a LAN only A and B are in the same
LAN.
>
> Is it possible to setup this kind of proxy chaining with iptables?? if
so, any
> suggestions on how to do it?? if iptables is not the right tool to solve
this problem,
> any suggestions on what can i use???
>
> thanx to all in advance..
> Xavier

I have no idea if this works and if it doesn't please someone on this list
tell me why.

On Host A
iptables -t nat -A PREROUTING -j DNAT --to ip.to.host.B

On Host B
iptables -t nat -A PREROUTING -j DNAT --to ip.to.host.C

On Host C
iptables -t nat -A PREROUTING -j DNAT --to default.gateway.ip




