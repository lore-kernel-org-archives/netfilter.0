From: Moritz Gartenmeister <moritz.gartenmeister@access.unizh.ch>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Mon, 02 May 2005 16:19:34 +0200
Message-ID: <427636F6.3080008@access.unizh.ch>
References: <42762C02.8060300@danbbs.dk> <427634ED.1030204@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427634ED.1030204@danbbs.dk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: monz@danbbs.dk
Cc: netfilter <netfilter@lists.netfilter.org>

> Moritz, thanks for pointing that out.
> Your suggested 10 minutes seems a bit short, though..
> 
> If we keep, say, a browser connection open longer than those 10m, it's 
> supposed to either use keepalive, or an established session will simply 
> be setup for another 10m, right?

hm... depends on a few factors.
a normal browser session should be closed after GET has delivered all data, there is no need to keep 
the connection established.
e.g. online-banking should use keepalive not only for this purpose.
and it depends on your other firewall settings (syn flag etc).

i got 500 clients, nobody claimed any troubles so far.

> Won't that create some additional load for a busy server, i.e. something 
> else that this thought-of browser session?

hm... there may exist some application, which need this, but i never saw one.

> To the maintainer of ip_conntrack_proto_tcp.c (Paul Russell?):
> Wouldn't it be fair to change TCP_CONNTRACK_ESTABLISHED permanently?

the question is, what would be a good value?
everyone can change this value in a easy way.


