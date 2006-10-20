From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Managed proxy between private network
Date: Fri, 20 Oct 2006 17:20:58 +0200 (CEST)
Message-ID: <25426.1780799881$1161357758@news.gmane.org>
References: <de47c0230610190303v37e0b55aia98d80d1bfac9db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <de47c0230610190303v37e0b55aia98d80d1bfac9db@mail.gmail.com>
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
To: Gabor Szokoli <szocske@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Gabor Szokoli">
> Hi There,
>
> I am new and have some questions:
>
> We have a linux box (complete control) connected to multiple private
> networks with possibly overlapping IP addressing. Its role is to
> dynamically create and tear down individual port forwardings between
> them.
> Our basic idea was to create conntrack entries from the controlling
> application.
> Having imagined conntrack to be like Cisco Express Forwarding, I was
> supprised to find out the conntrack lists do not contain the incoming
> and outgoing interfaces, only IP addresses which are then routed via

Normally you don't care what interface the IP is on. Think loadbalancing,
redundant path setups, etc. That is a feature!

> the normal path. Sadly, IP address based routing makes no sense
> between the independent private networks which are reusing the same
> IPaddresses.

Ciscos can do stuf that netfilter cannot and vice versa. Contrack and
overlapping IP adresses are mutually incompatible. Netfilter assumes a
somewhat sane network.

What you can do is use a linux box per interface and connect all those to
a backbone. You can then map all overlapping subnets to some free subnet
and get it all to work fairly easily. You can possibly even do this in
different UMLs, so you need only one physical box.

HTH,
M4


