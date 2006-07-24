From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Struggling with NAT: is PREROUTING working at all?
Date: Mon, 24 Jul 2006 14:41:25 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127DB@knowledge.wizdom.nu>
References: <44BE40D6.90108@gentoo.org> <44C1100C.2080006@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Cc: netfilter@lists.netfilter.org

Not a bug I think. You need to specify what to log. I don't think this =
rule will hit, as no parameters are specified.
=20
Try something like this:
iptables -t nat -A PREROUTING -s 0.0.0.0/0 -j LOG
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Martijn =
Lievaart
Sent: Fri 21-Jul-06 19:34
To: Daniel Drake
Cc: netfilter@lists.netfilter.org
Subject: Re: Struggling with NAT: is PREROUTING working at all?



Daniel Drake wrote:

> I took a step back and re-read the iptables man page. It says that the
> nat table is consulted whenever a new connection is about to be
> established, and PREROUTING is used when packets come in, so I'd
> expect this rule to give me a lot of output:
>
>     iptables -t nat -A PREROUTING -j LOG
>
> But, I get nothing, even when successfully establishing a new
> connection from the outside to the linux system. Logging is definitely
> working since I can get logs from other rules.
>
> No other rules are in place before this one, my script simply clears
> all tables/chains, sets all policies to ACCEPT, then runs the above
> command.
>
> Am I missing something, or PREROUTING not triggering when it should =
be?


You may have hit a bug here. That should have worked. I never tried
LOGging from prerouting, but the NAT functionality definately works.

M4




