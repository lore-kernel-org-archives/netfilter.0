From: "Carl Farrington" <carl@compsup.net>
Subject: RE: vpn and pptp
Date: Sat, 21 Feb 2004 00:32:33 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC0165AA@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Yes and it works very well. You need to get patch-o-matic from
http://www.netfilter.org . Read the instructions, as they tell you how
to apply the patches. After reading, do "./runme extra" in the p-o-m
directory and skip through all the patches until you find the one called
"pptp_contrack" or "ip_contrack_pptp" (I'm not totally sure of the
name).

Apply this patch, recompile your kernel, and also download and compile
the iptables program itself ("userspace tools") and away you go. They
are created as modules called ip_contrack_pptp and ip_contrack_proto_gre
and ip_nat_pptp and ip_nat_pptp.

Doesn't seem to work on kernel 2.6 yet though.

> -----Original Message-----
> From: Dino Dragovic [mailto:dragovic@gfos.hr]
> Sent: 20 February 2004 16:18
> To: netfilter@lists.netfilter.org
> Subject: vpn and pptp
>=20
> Hi,
>=20
> I have linux Debian (2.4.24 kernel) firewall with nat and iptables.On
my
> private network there is MS w2000 pptp server. I can connect to it
using
> pptp
> from Internet (PPTP) but from only one client at the time.Is it
> possible and how to connect through firewall several clients
> simultaneously to vpn server? Iptables verison is 1.2.6a-5
> When I try to connect while there is already one connection I get
> "Verifying username and password" until connection times out.
>=20
> tx
>=20
>=20


