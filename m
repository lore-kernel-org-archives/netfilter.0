From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Sat, 1 Apr 2006 17:46:12 -0300
Message-ID: <cc4fcc140604011246u55577b8cqd0c7992f1208ab6@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
	<442D2C8F.1020505@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442D2C8F.1020505@SCampbell.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

Hi Steven,

> Unfortunately, you've needed to obscure the actual ip address (I understa=
nd) but I can't match the 'customerip' and 'webserverip' to the ${variables=
} above because I don't know the actual values for any of them.

Well, the customerip is from some unknown Internet user. So it's an
external IP, and its connection comes in via $INET_IFACE.

The webserverip is in my DMZ, so it matches $DMZ_RANGE or $DMZ_WEBSERVER.

> Try to walk through the rules in your forward chain using the ip addresse=
s you've captured and identify the rule you believe should allow these ack =
packets to go out.

Well, it's actually the ACK packets that should come in, and the rule
that must match them is the ESTABLISHED,RELATED rule. And it actually
does match for more than 3,000 connections a day. But, for 200 or so
of them, this odd behavior occurs.

Your next e-mail may have shed some light. I'll comment on it.

Regards.

