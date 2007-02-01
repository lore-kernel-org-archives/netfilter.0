From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Wrong ips
Date: Thu, 01 Feb 2007 17:25:58 +0100
Message-ID: <45C21496.7000306@plouf.fr.eu.org>
References: <200702010851.14795.alp@rosten.elektra.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702010851.14795.alp@rosten.elektra.ru>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Alexander Pyhalov a =E9crit :
> I'm trying to add some rules, but they don't work, when contain port nu=
mbers:=20
>=20
> When I'm adding the following rule
>=20
> #  Access to HTTP server
> iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> #  Access to SSH is allowed to all
> iptables -A INPUT -p tcp -m --dport 22 -j ACCEPT
> #  Access to Tomcat
> iptables -A INPUT  -s <ip1>ACCEPT
> iptables -A INPUT  -s <ip2>  -j ACCEPT
> # Access to SMB is allowed to all
> iptables -A INPUT -p tcp -m --dport 139   -j ACCEPT=20
> iptables -A INPUT -p tcp -m --dport 445   -j ACCEPT=20
> iptables -P INPUT REJECT=20

There are typoes. Can you copy the output of iptables-save ?

> I can't ssh to server.=20

"Server" =3D the host on which the above rules are created ?

> iptables -A INPUT -p tcp -m tcp -s <my ip>   -j LOG
>=20
> and got something strange in log:
> eb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c:=
00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D255.255.0.13 LEN=3D15942 =
TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D47.98.0.13 LEN=3D15942 T=
OS=3D0x14 P
> REC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D0.0.8.0 DST=3D0.0.0.13 LEN=3D0 TOS=3D0x00 =
PREC=3D0x00 T
> TL=3D0 ID=3D0 PROTO=3D0
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D0.0.0.13 LEN=3D15942 TOS=
=3D0x14 PRE
> C=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.49.48.58 DST=3D255.255.0.13 LEN=3D15942=
 TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:13 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D255.255.0.13 LEN=3D15942=
 TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:13 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D0.0.0.0 DST=3D0.0.0.13 LEN=3D19526 TOS=3D0=
x04 PREC=3D0x
> 40 TTL=3D0 ID=3D257 FRAG:256 PROTO=3D0
>=20
> But these ip addresses are not my ip addresses.

Invalid IP address (DST=3D0.0.0.13), huge packet length (LEN=3D15942),=20
unknown protocol number (PROTO=3D32)... It looks like the LOG output is=20
completely messed up. Can you compare this to a network packet capture=20
using tcpdump/ethereal/wireshark/other ?

