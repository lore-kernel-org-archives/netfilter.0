From: "Ferry van Steen" <ferry.van.steen@InfoPart.nl>
Subject: RE: Forwarding intranet ip's
Date: Mon, 21 Oct 2002 08:23:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D502122A1694B04EAE0F53D53CC2F764B2F9@exch2k-01.infopart.nl>
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
To: Gary Hodder <vk2kcf@miacomputers.com>
Cc: netfilter@lists.netfilter.org

Where are you trying to route to, what are the IP's/Netmasks from the
network cards and what lines do you have in the FORWARD chain? I saw you
already did echo 1 > /proc/sys/net/ipv4/ip_forward


> -----Oorspronkelijk bericht-----
> Van: Gary Hodder [mailto:vk2kcf@miacomputers.com]=20
> Verzonden: zondag 20 oktober 2002 3:22
> Aan: netfilter
> Onderwerp: Forwarding intranet ip's
>=20
>=20
> Hi all,
>=20
> I am wanting to route 192.168.x.x ip's, the Linux kernel will=20
> not do this and hasn't for a while. Is there a iptables rule=20
> to do this or a hack that will turn it back on in the kernel?=20
> I want to do all the ip accounting at the border router and=20
> masq from there.
>=20
> Thanks
> Gary.
>=20
>=20
>=20
>=20
>=20
>=20
>=20

