From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: UnNATing return packets
Date: Sat, 24 May 2003 11:25:17 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A01923E@wardrive.citadelcomputer.com.au>
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
To: Tim Saunders <Tim.Saunders@aquilauk.co.uk>, netfilter@lists.netfilter.org

OK, well I haven't done source routing the way you'v done it as I've had =
the routers connected to the linux box via their own network cards.. ie =
ROUTER-A -> eth1   ROUTER-B -> eth2 etc.. but the theory should still be =
the same.

"When the routing decision is made the return packets have a source =
address of: 192.168.0.1 so they get routed via router A"
Are yoy saying this is what's happening or what you want to happen?? If =
this is what's happening and it should be going through Router B then =
isn't the problem iproute2 specific??

-----Original Message-----
From: Tim Saunders [mailto:Tim.Saunders@aquilauk.co.uk]
Sent: Friday, May 23, 2003 7:43 PM
To: George Vieira; netfilter@lists.netfilter.org
Subject: RE: UnNATing return packets


Your description describes exactly what is happening far better than
mine did. I am trying to do source routing so that all packets from
203.x.x.x go out on the same line as they came in on. Which is not via
the default route for outgoing packets. To give an example eth0 is
connected to routers A and B. The default route is to go out via router
A. Packets destined for 203.x.x.x will come in via router B so the
return packets need to go out via router B. When the routing decision is
made the return packets have a source address of: 192.168.0.1 so they
get routed via router A, then in post routing they get unNATed to a
203.x.x.x address. Thus DNAT of incoming connections cannot be used with
source routing.

Tim

> -----Original Message-----
> From: George Vieira [mailto:georgev@citadelcomputer.com.au]=20
> Sent: 23 May 2003 10:19
> To: Tim Saunders; netfilter@lists.netfilter.org
> Subject: RE: UnNATing return packets
>=20
>=20
> Sorry, I can't understand your english explanation.
> =20
> When the packets come in off the internet it hit the EXTernal=20
> DEVice which the PREROUTING table converts the EXTernal=20
> DESTination address to the INTernal DEVices DESTination=20
> servers IP address..
> =20
> EXTDEV=3Deth0
> DESTIP=3D203.x.x.x.x
> INTIP=3D192.168.0.1
> =20
> iptables -A PREROUTING -t nat -i $EXTDEV -d $DESTIP -p tcp=20
> --dport 80 -j DNAT --to $INTIP
> =20
> it changes it at the PREROUTING because the routing table=20
> won't know where 203.x.x.x is, but if it's changed before=20
> routing then routing will know that 192.168.0.1 is inside on=20
> eth1 and pass through the FORWARD chain and out via eth1.
> =20
> Having said that, going out is the same thing except it's POSTROUTING.
> =20
> So 192.168.0.1 responds to the packet and goes into eth1=20
> which then passes through FORWARD and into POSTROUTING which=20
> then says "hey 192.168.0.1 can't go out onto the net like=20
> that" and translates it to the IP which matches the=20
> ip_conntrack table that the original packets wanted to reach=20
> ie. $DESTIP
> =20
> this makes perfect sense..
> =20
> If you can detail what your problem is a bit like about it'll=20
> help me more to help you.. ;) I hope the above didn't bore=20
> you either.. ;))
>=20
> 	-----Original Message-----=20
> 	From: Tim Saunders [mailto:Tim.Saunders@aquilauk.co.uk]=20
> 	Sent: Fri 23-May-03 5:49 PM=20
> 	To: netfilter@lists.netfilter.org=20
> 	Cc:=20
> 	Subject: RE: UnNATing return packets
> =09
> =09
> 	=20
>=20
>=20

