From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: DNAT and UDP?? passes through my rules.
Date: Wed, 21 May 2003 16:34:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C71@wardrive.citadelcomputer.com.au>
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
To: "Netfilter Mailling List (E-mail)" <netfilter-announce@lists.samba.org>

Hi all,
=20
I have these rules in place: (VPNDEV =3D ppp+)
=20
        $IPTABLES -A PREROUTING -t nat -i $VPNDEV -s 10.10.1.0/24 -p udp =
--sport 137 --dport 137 -j DNAT --to 10.10.0.30
        $IPTABLES -A PREROUTING -t nat -i $VPNDEV -s 10.10.1.0/24        =
                       -j LOG --log-prefix "VPNPREPAK "
        $IPTABLES -A INPUT             -i $VPNDEV -s 10.10.1.0/24        =
                       -j LOG --log-prefix "VPNINPPAK "
=20
Listing them shows:

      32     2550 j_DNAT       udp  --  ppp+   *       10.10.1.0/24      =
   0.0.0.0/0          udp spt:137 dpt:137 to:10.10.0.30
     257    20375 j_LOG        all  --  ppp+   *       10.10.1.0/24      =
   0.0.0.0/0          LOG flags 0 level 4 prefix `VPNPREPAK '

yet I receive these logs and can't find out why it's passing through the =
DNAT rule??? Doesn't UDP work with DNAT or something???
The DNAT works but for some reason it seems to go to the INPUT chain =
still where it's should be going through the FORWARD chain since it's =
been NATted...
=20
May 21 16:27:40 firewall kernel: VPNINPPAK IN=3Dppp5 OUT=3D MAC=3D =
SRC=3D10.10.1.137 DST=3D10.10.1.254 LEN=3D78 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D54277 PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D58
May 21 16:27:40 firewall kernel: VPNINPPAK IN=3Dppp17 OUT=3D MAC=3D =
SRC=3D10.10.1.150 DST=3D10.10.1.254 LEN=3D96 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D20280 PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D76
May 21 16:27:41 firewall kernel: VPNINPPAK IN=3Dppp5 OUT=3D MAC=3D =
SRC=3D10.10.1.137 DST=3D10.10.1.254 LEN=3D78 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D54279 PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D58

=20

Thanks,

=20
____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd Systems Manager georgev AT =
citadelcomputer DOT com DOT au=20
Citadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644 HelpDesk: +61 2 9955 2698  =
<http://www.citadelcomputer.com.au/> http://www.citadelcomputer.com.au
=20
=20
=20

