From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Voice IP
Date: Tue, 28 Oct 2003 08:51:10 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C5B2@wardrive.citadelcomputer.com.au>
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
To: Manuel Tato <madness@adinet.com.uy>, netfilter@lists.netfilter.org

I have this working at home using these rules...


        if [ $H323 ]; then
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
389    -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
522    -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
1503   -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
1720   -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
1731   -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
8080   -j DNAT --to 192.168.1.1        # H323
                $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport =
1469   -j DNAT --to 192.168.1.1        # H323aud
        fi

What I did notice is that I couldn't get people to call me unless I was =
in a meeting call or something (soz, it's been months since I've used =
netmeeting ;) )...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: Manuel Tato [mailto:madness@adinet.com.uy]
> Sent: Tuesday, 28 October 2003 8:35 AM
> To: netfilter@lists.netfilter.org
> Subject: Voice IP
>=20
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> Hi, i'm configuring a firewall/router with a static ip ADSL=20
> and a voice
> IP gateway.
> The voiceip gw es in configured at 192.168.1.40.
> With this script i can make calls, but i cant recive any.
>=20
> - ---------------------------------------------------
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> modprobe ip_conntrack_h323
> modprobe ip_nat_h323
>=20
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
>=20
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT
> - --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport=20
> 1726:1789 -j
> ACCEPT
> iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT
> - --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport =20
> 1726:1789 -j
> ACCEPT
> - -----------------------------------------------------
>=20
> Any idea?
> i'm blocking ports?
> i need any other module??
> thanks in advance
> thanks a lot...
>=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>=20
> iD8DBQE/nY98W/G6GKzQKp4RAndEAJ4pYh04AZuTc/f8MQ8Ae6RB/GpRFgCgkaCg
> SwAh5HHLSdd0rj68FzTPdXY=3D
> =3DRcOK
> -----END PGP SIGNATURE-----
>=20
>=20
>=20
>=20

