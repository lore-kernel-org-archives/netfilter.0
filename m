From: "Michael Johansen" <michael@techmo.co.nz>
Subject: RE: vpn support for 2.4.18 and up
Date: Sat, 22 Jun 2002 19:54:50 +1200
Sender: netfilter-admin@lists.samba.org
Message-ID: <D90F507CEA84634EA750920250FF544208A959@aklnsp01.nsp.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: covici@ccs.covici.com
Cc: netfilter@lists.samba.org

Use this URL for the kernel patch for openssl support: =
http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-0.9.6b-mppe.pat=
ch.gz

to be a server, you will need pptpd, get that from =
http://www.poptop.org/ or from here: =
http://planetmirror.com/pub/mppe/pptpd-1.1.3.tar.gz
=20
also, you will need the source for ppp-2.4.1, and the 2 patches for it
http://planetmirror.com/pub/mppe/ppp-2.4.1-MSCHAPv2-fix.patch.gz
http://planetmirror.com/pub/mppe/ppp-2.4.1-openssl-0.9.6-mppe-patch.gz

You must apply the patches in the correct order else ppp wont compile =
properly

also, there is a howto at www.poptop.org specifically for Redhat Linux, =
but can be reasonably easily applied to debian, slackware, suse, and =
mandrake with a few path changes here and there

also there is a pptp client for linux - there may be a suse package =
called pptp-linux and there is definitely a debian package for it.

-----Original Message-----
From: John covici [mailto:covici@ccs.covici.com]
Sent: Friday, 21 June 2002 9:04 p.m.
To: Michael Johansen
Cc: netfilter@lists.samba.org
Subject: RE: vpn support for 2.4.18 and up=20


If I go to ftp.rubyriver.com and get his patch for 2.4.17 (rev2)
there is no mention of kernel version in the patch -- could you tell
me to what your remarks refer?

Do I need anything besides this patch to use pptp?

Thanks.

on Friday 06/21/2002 Michael Johansen(michael@techmo.co.nz) wrote
 > The openssl-2.4.16 kernel patch works fine for the late 2.4.x kernels =
with a very minor code change.=20
 > It works with 2.4.16, 2.4.17, 2.4.18 - even those kernels with =
various other patches applied
 > The trick is in this line:
 > =20
 > +#if LINUX_VERSION_CODE >=3D VERSION(2,1,4)
 > =20
 > which is here: linux-2.4.16-openssl-0.9.6b-mppe.patch: unmodified: =
line 992 of 3152 [31%]
 >=20
 > change that line to read:
 >=20
 >=20
 > +#if LINUX_VERSION_CODE >=3D VERSION(2,18,4)
 > =20
 > save the patch, then patch your kernel with cd /usr/src/linux && =
patch -p1 < ../linux-2.4.16-openssl-0.9.6b-mppe.patch
 > =20
 > then set up your ppp modules, compile and install the kernel and it =
should all work
 > =20
 > of course, you will need the ppp-2.4.1 source and the patches for m$ =
128bit encryption =20
 > =20
 > =20
 > Get the patch here:
 > =
http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-0.9.6b-mppe.pat=
ch.gz
 >=20
 > -----Original Message-----
 > From: Rowan Reid [mailto:rreid@studio3arc.com]
 > Sent: Friday, 21 June 2002 11:48 a.m.
 > To: netfilter@lists.samba.org
 > Subject: vpn support for 2.4.18 and up=20
 >=20
 >=20
 > =20
 > =20
 > I am trying to set up a firewall supporting VPn traffic. Initially my =
thoughts were to get the most up to date kernel 2.4.8 patch it and
 > set up my firewall. Then i realized in order to support vpn the vpn =
patch only goes up to 2.4.17 (would be nice to find 2.4.18) now I
 > have to find a 2.4.17 kernel, applie the appropriate iptables patch =
then the appropriate pptp filtering patch.
 > =20
 > my questions are
 > =20
 > 1.) Does anyone know of a pptp filtering patch for 2.4.18 kernels or =
there after.
 > 2.) know what is the latest/stable iptables patch that is compatable =
with 2.4.17 or 2.4.18 kernel
 > 3.) Is there an easier way to build a Firewall that supports pptp
 > =20
 > I'm running SuSE8.0 can someone suggest a better distru that will be =
a good firewall and works well with iptables and supports vpn
 > =20
 > =20
 > =20
 > =20
 > =20
 >    <ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html> =
ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html=20
 > =20
 > =20
 > Rowan Reid
 > Job Captain,=20
 > Systems Administrator
 > STUDIO 3 ARCHITECTS
 > 909  982  1717
 > =20
 >=20

--=20
         John Covici
         covici@ccs.covici.com

