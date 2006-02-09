From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: iptables rule chain question
Date: Thu, 9 Feb 2006 15:13:49 +0100 (CET)
Message-ID: <61489.193.173.147.3.1139494429.squirrel@webmail.sterenborg.info>
References: <20060209131739.GA4441@server.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060209131739.GA4441@server.homelinux.net>
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

On Thu, February 9, 2006 14:17, Mark-Walter@t-online.de wrote:
> Hi,
>
> I've have this in my firewall rule script and I'am unsure about DROP:
>
> #
> # allowed chain
> #
>
> $IPTABLES -A allowed -p TCP --syn -j ACCEPT
> $IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> $IPTABLES -A allowed -p TCP -j DROP
>
> The first should allow tcp connections with syn,rst,ack and he should
> accept it.
>
> The second one describes already established connections with ACCEPT.
>
> But what happens in the third rule ?
>
> Does it mean iptables DROP every TCP connection in the case syn,rst,ack=
 is
> not set and the connection is not established.

Or related. Yes.

> Does iptables storing all connection's with connection tracking to know
> which connection is established,related ? (2. rule)

Yes. See : /proc/net/ip_conntrack

> Sorry, for these questions but I think it's fast answer for you.

I think this is a good read :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob



