From: Sebastian Siewior <bigeasy@foo.fh-furtwangen.de>
Subject: Re: IP sent an invalid ICMP type to a broadcast and
 icmp_ignore_bogus_error_responses
Date: Tue, 10 May 2005 15:08:23 +0200
Message-ID: <20050510150823.2b1b2947@mikejones.ghb.fh-furtwangen.de>
References: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
	<427EFE8B.4030009@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary=Signature_Tue__10_May_2005_15_08_23_+0200_Ct.FwnmC3olOibgC;
	protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427EFE8B.4030009@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

--Signature_Tue__10_May_2005_15_08_23_+0200_Ct.FwnmC3olOibgC
Content-Type: multipart/mixed;
	boundary=Multipart_Tue__10_May_2005_15_08_23_+0200_U56HvYMHUP.McmGL

--Multipart_Tue__10_May_2005_15_08_23_+0200_U56HvYMHUP.McmGL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, 09 May 2005 01:09:15 -0500
"Taylor, Grant" <gtaylor@riverviewtech.net> wrote:

> Can we get an iptables-save output as well as an ifconfig -a?  I'm
> betting that something is preventing traffic from flowing to or from
> your lo interface.
>=20
I attached ifconfig and rules with substituted IPs.
>=20
>=20
> Grant. . . .
>=20
>=20

--=20
Sebastian Siewior

--Multipart_Tue__10_May_2005_15_08_23_+0200_U56HvYMHUP.McmGL
Content-Type: application/octet-stream; name=ifconfig_s
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ifconfig_s

eth0      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.15.26  Bcast:172.20.15.27  Mask:255.255.255.252
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9572724 errors:15660 dropped:15660 overruns:0 frame:0
          TX packets:7890307 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:2248211894 (2.0 GiB)  TX bytes:2262924714 (2.1 GiB)
          Base address:0xa400 Memory:fe9c0000-fe9e0000=20

eth1      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.71.1  Bcast:172.20.71.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8849876 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11995074 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:1544972900 (1.4 GiB)  TX bytes:2682128189 (2.4 GiB)
          Base address:0xa800 Memory:fe9e0000-fea00000=20

eth2      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.68.254  Bcast:172.20.68.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:145519 errors:0 dropped:0 overruns:0 frame:0
          TX packets:270211 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:12153761 (11.5 MiB)  TX bytes:363070192 (346.2 MiB)
          Base address:0x8800 Memory:fe780000-fe7a0000=20

eth3      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.78.254  Bcast:172.20.78.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:12230064 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10795059 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:1776946173 (1.6 GiB)  TX bytes:465976636 (444.3 MiB)
          Base address:0x9000 Memory:fe7a0000-fe7c0000=20

eth4      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.73.254  Bcast:172.20.73.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1238591 errors:0 dropped:0 overruns:0 frame:0
          TX packets:802702 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:1432060568 (1.3 GiB)  TX bytes:89206643 (85.0 MiB)
          Base address:0x9400 Memory:fe7c0000-fe7e0000=20

eth5      Link encap:Ethernet  HWaddr 00:
          inet addr:172.20.67.254  Bcast:172.20.67.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:897368 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1077866 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:92243804 (87.9 MiB)  TX bytes:1233771956 (1.1 GiB)
          Base address:0x9800 Memory:fe7e0000-fe800000=20

lo        Link encap:Local Loopback =20
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:30954 errors:0 dropped:0 overruns:0 frame:0
          TX packets:30954 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0=20
          RX bytes:5774706 (5.5 MiB)  TX bytes:5774706 (5.5 MiB)


--Multipart_Tue__10_May_2005_15_08_23_+0200_U56HvYMHUP.McmGL
Content-Type: application/octet-stream; name=rules_s
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=rules_s

# Generated by iptables-save v1.3.0 on Tue May 10 14:40:26 2005
*raw
:OUTPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
[0:0] -A PREROUTING -p tcp -m iprange --src-range 172.20.64.0-172.20.65.254=
 -m multiport --dports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -p tcp -m iprange --dst-range 172.20.64.0-172.20.65.254=
 -m multiport --sports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -m iprange --src-range 172.20.64.0-172.20.65.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -m iprange --dst-range 172.20.64.0-172.20.65.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -p tcp -m iprange --src-range 172.20.33.0-172.20.47.254=
 -m multiport --dports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -p tcp -m iprange --dst-range 172.20.33.0-172.20.47.254=
 -m multiport --sports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -m iprange --src-range 172.20.33.0-172.20.47.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -m iprange --dst-range 172.20.33.0-172.20.47.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -p tcp -m iprange --src-range 172.20.70.0-172.20.70.254=
 -m multiport --dports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -p tcp -m iprange --dst-range 172.20.70.0-172.20.70.254=
 -m multiport --sports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -m iprange --src-range 172.20.70.0-172.20.70.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -m iprange --dst-range 172.20.70.0-172.20.70.254 -j NOT=
RACK=20
[0:0] -A PREROUTING -p tcp -m iprange --src-range 172.20.130.0-172.20.131.2=
54 -m multiport --dports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -p tcp -m iprange --dst-range 172.20.130.0-172.20.131.2=
54 -m multiport --sports 80,22 -j ACCEPT=20
[0:0] -A PREROUTING -m iprange --src-range 172.20.130.0-172.20.131.254 -j N=
OTRACK=20
[0:0] -A PREROUTING -m iprange --dst-range 172.20.130.0-172.20.131.254 -j N=
OTRACK=20
COMMIT
# Completed on Tue May 10 14:40:26 2005
# Generated by iptables-save v1.3.0 on Tue May 10 14:40:26 2005
*nat
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
[0:0] -A PREROUTING -s ! 172.20.78.0/255.255.255.0 -d ! 172.20.0.0/255.255.=
0.0 -p tcp -m tcp --dport 80 -m state --state NEW -j DNAT --to-destination =
172.20.78.42:80=20
COMMIT
# Completed on Tue May 10 14:40:26 2005
# Generated by iptables-save v1.3.0 on Tue May 10 14:40:26 2005
*mangle
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
COMMIT
# Completed on Tue May 10 14:40:26 2005
# Generated by iptables-save v1.3.0 on Tue May 10 14:40:26 2005
*filter
:FORWARD DROP [0:0]
:INPUT DROP [0:0]
:OUTPUT ACCEPT [0:0]
[0:0] -A FORWARD -i lo -j ACCEPT=20
[0:0] -A FORWARD -o lo -j ACCEPT=20
[0:0] -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT=20
[0:0] -A FORWARD -p icmp -m icmp --icmp-type 8 -m length --length 50:100 -m=
 limit --limit 10/sec -j ACCEPT=20
[0:0] -A FORWARD -p icmp -m icmp --icmp-type 8 -j DROP=20
[0:0] -A FORWARD -p icmp -m limit --limit 10/sec --limit-burst 3 -j ACCEPT=
=20
[0:0] -A FORWARD -s 172.20.71.2 -i eth1 -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.71.2 -o eth1 -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.150 -d 172.20.79.10 -p tcp -m tcp --dport 25 =
-j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.50 -d 172.20.79.10 -p tcp -m tcp --dport 25 -=
j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.55 -d 172.20.79.10 -p tcp -m tcp --dport 25 -=
j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.150 -d 172.20.78.10 -p tcp -m tcp --dport 25 =
-j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.50 -d 172.20.78.10 -p tcp -m tcp --dport 25 -=
j ACCEPT=20
[0:0] -A FORWARD -s 172.20.64.55 -d 172.20.78.10 -p tcp -m tcp --dport 25 -=
j ACCEPT=20
[0:0] -A FORWARD -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -m iprange --src-range 172.20.64.0-172.20.65.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --dst-range 172.20.64.0-172.20.65.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --src-range 172.20.33.0-172.20.47.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --dst-range 172.20.33.0-172.20.47.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --src-range 172.20.70.0-172.20.70.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --dst-range 172.20.70.0-172.20.70.254 -m state =
--state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --src-range 172.20.130.0-172.20.131.254 -m stat=
e --state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -m iprange --dst-range 172.20.130.0-172.20.131.254 -m stat=
e --state NEW,UNTRACKED -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.20 -i eth3 -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.20 -o eth3 -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.1 -p tcp -m multiport --dports 22,2401,80,808=
0,8443,443,1099 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.2 -p tcp -m multiport --dports 22,2401,80,808=
0,8443,443,1099 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.4 -p tcp -m multiport --dports 22,80,8080 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.5 -p tcp -m multiport --dports 21,22,80,3306,=
5800,5900 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.6 -p tcp -m multiport --dports 22 -m state --=
state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.7 -p tcp -m multiport --dports 22 -m state --=
state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.8 -p tcp -m multiport --dports 22,80,443,8080=
 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.9 -p tcp -m multiport --dports 22,80,3690 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.101 -p tcp -m multiport --dports 22,25,80,443=
 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.73.121 -p tcp -m multiport --dports 22,25,80,443=
 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.1 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.2 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.4 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.5 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.6 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.7 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.8 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.9 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.101 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.73.121 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.10 -p tcp -m multiport --dports 22,25,53,123,=
80,443,4443 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.12 -p tcp -m multiport --dports 22,80,443 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.13 -p tcp -m multiport --dports 22,80,443 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.42 -p tcp -m multiport --dports 22,80,8080 -m=
 state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.44 -p tcp -m multiport --dports 22,80,8080 -m=
 state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.80 -p tcp -m multiport --dports 22,80,443 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.99 -p tcp -m multiport --dports 22 -m state -=
-state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.10 -p udp -m multiport --dports 53,123 -m sta=
te --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.42 -p udp -m multiport --dports 8080 -m state=
 --state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.78.44 -p udp -m multiport --dports 8080 -m state=
 --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.10 -p tcp -m multiport --dports 22,25,53,123,=
80,443,4443 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.12 -p tcp -m multiport --dports 80 -m state -=
-state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.42 -p tcp -m multiport --dports 22,80,443 -m =
state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.44 -p tcp -m multiport --dports 22,80,8080,53=
 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.80 -p tcp -m multiport --dports 22,80,443,53 =
-m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.10 -p udp -m multiport --dports 53,123 -m sta=
te --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.42 -p udp -m multiport --dports 53 -m state -=
-state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.44 -p udp -m multiport --dports 8080,53 -m st=
ate --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.78.80 -p udp -m multiport --dports 53 -m state -=
-state NEW -j ACCEPT=20
[0:0] -A FORWARD -d 172.20.67.0/255.255.255.0 -p tcp -m multiport --dports =
22 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.67.0/255.255.255.0 -p tcp -m multiport --dports =
22,80,110,143,443,993,995,1194,5190,5222,5223,6667,873,3690 -m state --stat=
e NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.67.0/255.255.255.0 -p udp -m multiport --dports =
53,1194,500 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.67.0/255.255.255.0 -p esp -m state --state NEW -=
j ACCEPT=20
[0:0] -A FORWARD -s 172.20.67.0/255.255.255.0 -p ah -m state --state NEW -j=
 ACCEPT=20
[0:0] -A FORWARD -d 172.20.68.0/255.255.255.0 -p tcp -m multiport --dports =
22 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.68.0/255.255.255.0 -p tcp -m multiport --dports =
22,80,110,143,443,993,995,1194,5190,5222,5223,6667,873,3690 -m state --stat=
e NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.68.0/255.255.255.0 -p udp -m multiport --dports =
53,1194,500 -m state --state NEW -j ACCEPT=20
[0:0] -A FORWARD -s 172.20.68.0/255.255.255.0 -p esp -m state --state NEW -=
j ACCEPT=20
[0:0] -A FORWARD -s 172.20.68.0/255.255.255.0 -p ah -m state --state NEW -j=
 ACCEPT=20
[0:0] -A FORWARD -j REJECT --reject-with icmp-port-unreachable=20
[0:0] -A INPUT -i lo -j ACCEPT=20
[0:0] -A INPUT -s 172.20.227.21 -j ACCEPT=20
[0:0] -A INPUT -s 172.20.225.140 -j ACCEPT=20
[0:0] -A INPUT -s 172.20.73.8 -j ACCEPT=20
[0:0] -A INPUT -s 172.20.64.60 -p tcp -m state --state NEW -m tcp --dport 2=
2 -j ACCEPT=20
[0:0] -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT=20
[0:0] -A INPUT -p icmp -m icmp --icmp-type 8 -m length --length 50:100 -m l=
imit --limit 10/sec -j ACCEPT=20
[0:0] -A INPUT -p icmp -m icmp --icmp-type 8 -j DROP=20
[0:0] -A INPUT -p icmp -m limit --limit 10/sec --limit-burst 3 -j ACCEPT=20
[0:0] -A INPUT -s 172.20.71.2 -i eth1 -j ACCEPT=20
[0:0] -A INPUT -p tcp -j TARPIT=20
COMMIT
# Completed on Tue May 10 14:40:26 2005

--Multipart_Tue__10_May_2005_15_08_23_+0200_U56HvYMHUP.McmGL--

--Signature_Tue__10_May_2005_15_08_23_+0200_Ct.FwnmC3olOibgC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCgLJHmNVcHP4/RwYRAraVAJ9A69dcxsCaMLhYiwtd8Nsi55Ru7QCdFOvH
hufhgScHickvNZRjrAaW8Cs=
=ax0z
-----END PGP SIGNATURE-----

--Signature_Tue__10_May_2005_15_08_23_+0200_Ct.FwnmC3olOibgC--

