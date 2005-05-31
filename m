From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Kernel panic when routing large pings on an XScale (IXP425).
Date: Tue, 31 May 2005 07:51:29 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829073C5@pxtbenexd01.pxt.primeexalia.com>
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
To: Eduardo Spremolla <edspremolla@antel.com.uy>
Cc: netfilter@lists.netfilter.org, Cian Masterson <cianm@klasonline.com>

The patch over on the RH site will fix the problem though.  My problem
also started when I changed the subnetting to cover a broader range of
subnets that also route to other locations.


> -----Original Message-----
> From: Eduardo Spremolla [mailto:edspremolla@antel.com.uy]
> Sent: Tuesday, May 31, 2005 6:08 AM
> To: Gary W. Smith
> Cc: Cian Masterson; netfilter@lists.netfilter.org
> Subject: Re: Kernel panic when routing large pings on an XScale
(IXP425).
>=20
> I experience the very same error just yesterday:
> KERNEL PANIC - Not Syncing: net/ipv4/xfrm4_output.c:106 : spin_lock
> (net/xfrm/xfrm_state.C : ddd2b014) already locked by
> net/ipv4/xfrm4_output.c/106
>=20
> on a Fedora Core2 box running 2.6.10-1.771_FC2 kernel and
> ipsec-tools-0.5-2.fc2.
>=20
> the curiosity is that this box was running ok for more than a month
with
> this policies:
>=20
> spdadd 10.3.1.0/24 10.3.4.0/24 any -P in ipsec
>            esp/tunnel/CENTER_IP-MY_IP/require;
>=20
> spdadd 10.3.4.0/24 10.3.1.0/24 any -P out ipsec
>            esp/tunnel/MY_IP-CENTER_IP/require;
>=20
> and start to trouble when changed to :
>=20
>=20
> spdadd 10.0.0.0/8 10.3.4.0/24 any -P in ipsec
>            esp/tunnel/CENTER_IP-MY_IP/require;
>=20
> spdadd 10.3.4.0/24 10.0.0.0/8 any -P out ipsec
>            esp/tunnel/MY_IP-CENTER_IP/require;
>=20
>=20
> LALO
>=20
>=20
>=20
> On Mon, 2005-05-30 at 10:46 -0700, Gary W. Smith wrote:
> > I experienced a similar problem when I was doing some IPSEC stuff
with
> > IPTABLES under RHEL 4.  There was an issue with a TCP packet being
> locked by
> > the system and in a chain and under a certain case it would attempt
to
> lock
> > it again.  Not sure of the complete details though.
> >
> > Anyways, after talking with some people about my problem it had to
do
> with
> > locking of the chain before passing it around through other chains
for
> IPSEC
> > where it had to traverse the same table again.  It sounds similar to
my
> > problem.  Here is the link to the RedHat bug I submitted (and was
> closed)
> > some time ago.
> >
> > https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D154347
> >
> > It does require a kernel recompile as it's a kernel bug.
> >
> > Hope this helps.
> >
> > Gary Smith
> >

