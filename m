From: =?ISO-8859-1?Q?Hern=E1n?= Alvarez <hralvarez@workout.com.ar>
Subject: Re: iptables-pptp
Date: 26 Mar 2004 11:58:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080298700.2290.32.camel@syrah>
References: <1080296089.2287.20.camel@syrah>
	 <200403261434.03285.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403261434.03285.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

1- It's a pptp
2- Yes, a firewall in a RH7.3 with the same rules that were running in a
firewall with RH 7.2
=20
When read doc, howto, etc what i found was something like add this
modules

ip_conntrack_proto_gre
ip_conntrack_pptp
ip_nat_proto_gre
ip_nat_pptp

thanks again!!

El vie, 26 de 03 de 2004 a las 15:34, Antony Stone escribi=F3:
> On Friday 26 March 2004 10:14 am, Hern=E1n Alvarez wrote:
>=20
> > Hi!!
> > Here's my first mail to the list.
>=20
> Welcome.
>=20
> > I can't connect a VPN through my LAN (with a linux Redhat 7.3 or above
> > gateway) to a VPN server
>=20
> 1. Tell us what sort of VPN this is: IPsec? PPTP? Kame? other?
>=20
> > Until my REDHAT was 7.2 there was no problem but when try to do with 7.3
> > my error is 650
> >
> > LAN-----------------PROXY RH73-------------VPN SERVER
>=20
> 2. I assume you mean "Packet Filtering Netfilter Firewall" where you have=
=20
> "Proxy" there?   What rules are you running?
>=20
> 3. Are you doing any logging (of eg: dropped packets) on the firewall whi=
ch=20
> may suggest what's not working?   How are you testing the setup and what =

> diagnostic information do you get?
>=20
> Regards,
>=20
> Antony.


