From: Clist <clist@uah.es>
Subject: Re: petition: Connection tracking benchmarking results
Date: Tue, 2 Nov 2004 17:44:46 +0100
Message-ID: <200411021744.46414.clist@uah.es>
References: <200411021639.13336.clist@uah.es> <4187AC6E.8050507@smcc.de>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4187AC6E.8050507@smcc.de>
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
To: Thomas =?iso-8859-1?q?Lu=DFnig?= <lussnig@smcc.de>
Cc: netfilter@lists.netfilter.org

Hi Thomas,=20

On my internal firewall, I usually see about 10k to 15k connections so is i=
t rasonable to=20
start thinking  on managing about 30k to 45k connections?, it seems a horri=
ble number to me!!!

=20
El Martes, 2 de Noviembre de 2004 16:49, escribi=F3:
> Clist wrote:
>=20
> >Hi all,
> >
> >I need to study a solution based on iptables for a large number of netwo=
rked hosts.=20
> >It will be used as a central wategay for the networks we have at Univers=
ity of Alcal=E1.
> >
> >We need to perform a large numer of NAT (above 3000 host or so) for the =
internal networks and filtering for
> >several ranges of public addresses for web servers and things like that.=
=20
> >
> >Our main campus backbone is ATM based but we plan to deploy our solution=
 on gigabit links attached to=20
> >our routers because we think this setup will be more stable that managin=
g ATM and lane connections at the firewall.
> >
> >Currently we have a setup for filtering access for our public web server=
s and networking services based on dual Pentium III at 800Ghz 1Gb RAM and k=
ernel 2.4.2x
> >customized over RedHat 7.3 but we have no idea of behavior of iptables c=
onnection tracking on managing large number of network clients.=20
> >
> >Anyone know  benchmarking test results, or studies of netfilter performa=
nce carried by some people,=20
> >that we can see in order to decide how much hardware resouces we need, b=
est distributions for doing so=20
> >or high performance projects base on netfilter/iptables?
> > =20
> >
> Hi,
> there are two points.
> 1. The count of hosts ist not so important since an single host running=20
> an p2p client can open thousands of connections while an Server or=20
> pc-pool only open few connections
> for DNS mail and http.
> 2. The CPU Load and filtering directly depend how good you organize the=20
> ruleset. Since you can use Selv defined rules you can huffmann structure=
=20
> with weight of the packet count. wich is very cpu frindly.
>=20
> So it will be hard to compare wothout more information.
>=20
> Cu Thomas
>=20

=2D-=20
=2D------------------------------------------------
Clister UAH
=2D------------------------------------------------

