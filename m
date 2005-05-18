From: =?koi8-r?b?8KPU0iD3z8zLz9cg4czFy9PBzsTSz9fJ3g==?= <torre_cremata@mail.ru>
Subject: Re: allowing ssh in campus
Date: Wed, 18 May 2005 19:25:50 +0400
Message-ID: <200505181925.50988.torre_cremata@mail.ru>
References: <12848a3b050517174268bc6b79@mail.gmail.com>
	<12848a3b05051801482ce06a21@mail.gmail.com>
	<12848a3b05051801491c31d816@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12848a3b05051801491c31d816@mail.gmail.com>
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
Content-Type: text/plain; charset="koi8-r"
To: netfilter@lists.netfilter.org, vaida bogdan <vaida.bogdan@gmail.com>

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 18 =ED=C1=CA 2005 12:49 vaida bogdan=
 =CE=C1=D0=C9=D3=C1=CC(a):
> I have NAT.
> (
> > If I allow Student1 ssh on dorm1 gateway then what do I tell the
> > Campus gateway to allow ? (I can't allow full access from Dorm1's
> > gateway public ip.
> )

> On 5/18/05, =F0=A3=D4=D2 =F7=CF=CC=CB=CF=D7  =E1=CC=C5=CB=D3=C1=CE=C4=D2=
=CF=D7=C9=DE <torre_cremata@mail.ru> wrote:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 18 =ED=C1=CA 2005 04:42 vaida bo=
gdan =CE=C1=D0=C9=D3=C1=CC(a):
> > > My campus connections look like this:

> > > Dorm1 gateway ----\
> > > Dorm2 gateway ----|=3D> Campus gateway |-> OUTSIDE
> > > Dorm3 gateway ----/                                  \-> University

Well. IIUYC, your task is to allow of drop connections from users that are=
=20
behind NAT. Sorry. I don't think this is possible without access to  Dorm=20
gateways. All packets from gateway are looking as coming from single IP, an=
d=20
infromation about source of packet is lost. The best you can do is to look =
at=20
ttl field to find out if the packet is from dorm gateway or not. But users=
=20
can simply get around this...

=2D-=20
____________
Peter.

