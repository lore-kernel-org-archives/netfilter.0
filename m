From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 15:07:09 -0500
Message-ID: <200506201507.09918.rob0@gmx.co.uk>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 20 June 2005 14:30, Sven-Haegar Koch wrote:
> On Mon, 20 Jun 2005, terry l. ridder wrote:
> You are filtering in the nat table.
> The nat table gets only the first packet from each connection (the
> one that would match -m state --state NEW). A retransmit from the
> blocked IP will not be a new connection, so it will pass through your
> rules.
>
> And on your comment to another mail that you are not using connection
> tracking:
> This is wrong. If you have the nat table, you must have ip_conntrack
> loaded - and if its loaded it tracks your connections, even if you
> dont use -m state at all. There is no iptables nat without connection
> tracking.

TY for that. I didn't know all that, although I did suspect that NAT=20
relied on ip_conntrack. "man iptables" doesn't say that directly (if=20
so, I missed it), but it does imply it.
 nat:
        This table is consulted when a packet that cre=ADates a new
        connection is encountered. ...

This also applies in another thread today, "Re: using NetFilter to
share the SAME SINGLE IP between a Linux router AND a computer=20
simultaneously".

Anyway, what DOES happen in the case that there is no ip_conntrack?=20
Would not every packet appear to the kernel as a new connection?

> If you must filter in PREROUTING, do it at least in PREROUTING of the
> filter table.

Alas, there is no such chain (built-in.) :)
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

