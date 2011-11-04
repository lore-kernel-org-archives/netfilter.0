From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Numeber of connections
Date: Fri, 4 Nov 2011 15:30:27 +0100
Message-ID: <20111104143027.GA10958@1984>
References: <CAMTjHrz-d9kXKS3ZbJQGJ-b-Y05eb+g8XYe1x0W94iqPuQhGxQ@mail.gmail.com>
 <alpine.LNX.2.01.1111032025220.25863@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1111032025220.25863@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: =?iso-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Nov 03, 2011 at 08:26:24PM +0100, Jan Engelhardt wrote:
> On Thursday 2011-11-03 17:41, Usu=E1rio do Sistema wrote:
>=20
> >Hello everyone, I'm using an RHE 5.5 machine for firewall and I woul=
d
> >like know how many connections are been handled for my firewall
> >iptables in an time of day as well as how many connections per secon=
d.
>=20
> `conntrack -L` will show you how many active CTs there. The number of=
=20
> ct/sec can be calculated by monitoring `conntrack -Ee NEW` over a tim=
e=20
> quantum chosen by you.

I think using ulogd2 with the flow accounting and making some custom
scripts to process the logs would make the trick.

The conntrack utility is designed to know what is going on right now
in the firewall. For accumulated stats, ulogd2 can make it better.

P.S: Jan, there's some people waiting for comments on your
xtables-addons stuff in netfilter-devel, in case that you didn't
notice.
