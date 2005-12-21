From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: ICMP types to allow
Date: Wed, 21 Dec 2005 14:12:16 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B724@mailbox.vikus.com>
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
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: John A. Sullivan III [mailto:jsullivan@opensourcedevel.com]=20
> Sent: Wednesday, December 21, 2005 1:49 PM
> To: Derick Anderson
> Cc: netfilter@lists.netfilter.org
> Subject: RE: ICMP types to allow
>=20
> On Wed, 2005-12-21 at 13:36 -0500, Derick Anderson wrote:
> > After reading the ICMP state machine section of the=20
> Netfilter tutorial=20
> >=20
> [http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCON
> > NE CTIONS] it appears that ICMP traffic related to existing TCP and=20
> > UDP connections falls under the RELATED,ESTABLISHED rules.
> >=20
> > So someone correct me if I'm wrong, but this means that any=20
> valid ICMP=20
> > error message would get picked up by a '-A FORWARD -m state --state=20
> > RELATED,ESTABLISHED -j ACCEPT' at the start of the chain, and so (as
> > lst_hoe01 stated) allowing type 8 is all you really need to=20
> do, correct?
> > (and a little reading goes a long way... =3D)
> >=20
> > Thanks,
> >=20
> > Derick Anderson
> > =20
> >=20
> Somewhere I recall Microsoft documentation asking that all=20
> ICMP traffic be allowed for Active Directory.  I never=20
> bothered to find out what exactly was needed and why.  Does=20
> anyone know if a properly functioning Active Directory needs=20
> anything other than echo? - John
> --
> John A. Sullivan III
> Open Source Development Corporation
> +1 207-985-7880
> jsullivan@opensourcedevel.com
>=20
> If you would like to participate in the development of an=20
> open source enterprise class network security management=20
> system, please visit http://iscs.sourceforge.net
>=20


I think all AD requires is echo request (which is how it "determines"
whether domain controllers, DNS servers, gateways, etc. are up). Block
ICMP echo request at your firewall/gateway and netdiag will be very
unhappy. I don't believe they "require" any other types but you never
know with Microsoft.=20

A google for "active directory 2003 icmp required" (no quotes) provides
the official story (the first two hits are hugely long TechNet articles
so search for ICMP within them), which is basically that ICMP echo
request is used by several services to determine whether hosts are up
and for tracert to work, and that Path MTU makes everybody happy.

Hope that helps,

Derick


