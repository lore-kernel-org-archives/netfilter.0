From: iptables@isabeldeespana.org
Subject: Re: problem with iptables with forward drop policy.
Date: Wed, 24 Sep 2003 17:27:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030924162729.25242.qmail@servidor1.isabeldeespana.org>
References: <7C9884991ADAE0479C14F10C858BCDF5122E48@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E48@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

1) Yes, I think that all nets are on the same network segment since all the=
m=20
are connected on the same hub, switch.
2) I=B4m trying to ping based on IP=B4s.
3)INTIF is eth0 which is on the 192.168.1.0 network. This interface has two=
=20
logical interfaces, eth0:1 on the 192.168.2.0 and eth0:2 which is on the=20
192.168.3.0. EXTIF is eth1 which has a only Public IP.=20

4)I attach you logs below. In this case 192.168.1.16 is a window machine,=20
192.168.3.4 too and p250, the firewall-router-gateway linux machine.=20


I repeat that if I change the policy of forward to ACCEPT (default is DROP)=
,=20
so I can make ping from every machine to all machines.=20

Thanks.=20

Sep 23 20:25:03 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D60753 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5376
Sep 23 20:25:03 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9169 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5376
Sep 23 20:25:03 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D60753 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5376
Sep 23 20:25:03 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9169 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5376
Sep 23 20:25:07 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D61521 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5632
Sep 23 20:25:07 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9425 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5632
Sep 23 20:25:07 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D61521 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5632
Sep 23 20:25:07 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9425 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5632
Sep 23 20:25:12 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D61777 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5888
Sep 23 20:25:12 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9681 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5888
Sep 23 20:25:12 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D61777 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D5888
Sep 23 20:25:12 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9681 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D5888
Sep 23 20:25:16 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D62033 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D6144
Sep 23 20:25:16 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9937 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D6144
Sep 23 20:25:16 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.1.16=20
DST=3D192.168.3.4
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D31 ID=3D62033 PROTO=3DICMP TYPE=3D8 C=
ODE=3D0 ID=3D256
SEQ=3D6144
Sep 23 20:25:16 p250 kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.3.4=20
DST=3D192.168.1.16
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9937 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D256
SEQ=3D6144=20

=20

Daniel Chemko wrote:=20

> 1. Are these subnets on the same network segment or different network
> interfaces?=20
>=20
> 2. Are you trying to ping based on hostnames or IP's?=20
>=20
> 3. INTIF/EXTIF corresponds to what network IP subnets?=20
>=20
> 4. What gets dumped to the Logs? In all likelihood it will show you
> exactly what the problem is.=20
>=20
> The ICMP pings should work the same between Linux and Windows so I don't
> see the 'visibility' the firewall allows as the issue. I can only assume
> that your Windows machines are not configured the same way as your Linux
> machine (192.168.3.15). Could this be a subnet masking problem?=20
>=20
> Try tracert from 192.168.1.19 to the machines tried and see if they both
> take the paths that they should be.=20
>=20
>=20
=20

