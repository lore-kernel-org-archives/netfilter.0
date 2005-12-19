From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Firewall and a FTP server
Date: Mon, 19 Dec 2005 09:31:51 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B61C@mailbox.vikus.com>
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
To: TAC Forums <tac.forums@gmail.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Askar Ali
> Sent: Monday, December 19, 2005 7:09 AM
> To: TAC Forums
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Firewall and a FTP server
>=20
> TAC Forums wrote:
>=20
> >Hi All,
> >
> >We have a FTP server, (Red Hat Linux 7) behind a firewall, the
> > =20
> >
> why are you still using historic version of rh ? :)
>=20
> >firewall allows only incomming and established connections on ports
> >20,21  from any where and evry where.
> >
> >The Problem is, when the customers use FTP clients, the=20
> manage to login=20
> >, but cannot upload/download files if they use PASSIVE FTP=20
> connections.
> >
> >Can smeone suggest, how the best way to get out of this situation,=20
> >should we enable all ports above 1023?
> >
> >Regards,
> >Boskey
> >
> >--
> >TAC Support Team
> >
> >
> > =20
> >
> hi Tac
>=20
> verify that modules
>=20
> ip_conntrack_ftp
> ip_nat_ftp
>=20
> are loaded, if not try to load them with "modprobe=20
> ip_conntrack_ftp" and put it in your firewall startup script=20
> so that modules at boot time.
>=20
>=20
>=20
>=20
> regards,
>=20
> askar

If you don't have those modules in the kernel you will need to open up
NEW connections for the passive ports on your FTP server or recompile
your kernel. I've done the port-opening thing when recompiling the
kernel on a live firewall was more downtime than the PTB were willing to
accept.

Derick Anderson=20

