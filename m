From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: iptables spof address problem
Date: Thu, 29 Sep 2005 15:00:24 -0400
Message-ID: <FAC4E024BF776842876169173CE2F0132821@mailbox.vikus.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Piotr Holubniak <piotr.holubniak@neostrada.pl>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: Piotr Holubniak [mailto:piotr.holubniak@neostrada.pl]=20
> Sent: Thursday, September 29, 2005 2:15 PM
> To: Derick Anderson
> Cc: netfilter@lists.netfilter.org
> Subject: Re: iptables spof address problem
>=20
> Derick Anderson napisa=B3(a):
>=20
> >=20
> >
> > =20
> >
> >>-----Original Message-----
> >>From: netfilter-bounces@lists.netfilter.org
> >>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Piotr=20
> >>Holubniak
> >>Sent: Thursday, September 29, 2005 1:22 AM
> >>To: netfilter@lists.netfilter.org
> >>Subject: Re: iptables spof address problem
> >>   =20
> >>
> >
> >[snip]
> >=20
> > =20
> >
> >>This is not a question of routing Layer 2. All computers are in one=20
> >>local network in the same subnet, so there is no need to=20
> route pakets.
> >>This seems to me that even if data arrives to NIC of Linux computer=20
> >>with netfilter, from computer with MAC address, this MAC address is=20
> >>unseen to netfilter, because before it is passed to=20
> netfilter, TCP/IP=20
> >>stack tries to resolve MAC sending ARP lookup. Sa finally netfilter=20
> >>gets wrong MAC.
> >>Not sender but ARP lookup.
> >>
> >>Tell me if I am wrong.
> >>
> >>Regards
> >>
> >>PiotrH
> >>   =20
> >>
> >
> > =20
> >
> Netfilter is designed to improve security of network or=20
> computer system.
>=20
> I well designed network, such mechanism like "security port"=20
> in switch, doesn't allow you to spoof MAC address. Simply=20
> because it limits number of MAC addresses which can leave=20
> port to only one, and this one is registered and cannot be=20
> changed without supervisors pertmition.
>=20
> In described by me scenario, attacker doesn't need to spoof=20
> MAC address to be unvisible, it is enaught to spoof IP. So=20
> funcjonality of "security port" is very limited. I belive=20
> that netfilter should allways display real MAC address. I=20
> don't know how to changet it.
>=20
> Regards
>=20
> PiotrH
>=20

From the hping man page:

-a --spoof hostname
    Use this option in order to set a fake IP source address, this =
option ensures that target will not gain your real address. However =
replies will be sent to spoofed address, so you will can't see them. In =
order to see how it's possible to perform spoofed/idle scanning see the =
HPING2-HOWTO.

I reiterate: a properly spoofed packet is completely identical to a =
genuine one. It is not Netfilter's or the kernel stack's fault, it is a =
simple fact of life that bits are bits. With an intelligent switch this =
kind of attack can be stopped provided the switch is set to use a 1-to-1 =
ratio of ports to MACs and to drop invalid packets. However, it is not =
possible prevent this attack when nothing separates the two boxes but =
twisted pair.

Derick Anderson

