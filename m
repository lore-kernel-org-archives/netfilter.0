From: "Daniel Castelhano" <CastelhanoD@emigrant.com>
Subject: weird mac address format
Date: Wed, 13 Jun 2007 14:11:58 -0400
Message-ID: <466FFB2D.6422.0055.0@emigrant.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,=0D=0A=20=0D=0ADoes anyone know why iptables would log a mac address in =
this fashion:=0D=0A=20=0D=0AJun 12 22:00:42 servername kernel: FW filter IN=
PUT Chain:IN=3Dext OUT=3D MAC=3D02:00:00:00:00:09:00:06:2a:73:f0:70:08:00:4=
5:00:00:28:94:7b:40:00:35:06:db:02:9c:37:85:=0D=0A58:44:a3:70:1f:01:bb:da:e=
1:87:0f:30:c4:00:00:00:00:50:04:c2:10:83:0d:00:00:00:00:00:00:00:00:87:61:7=
5:e8:92:64:cd:6e:f6:ce:91:bc:ed:ee:37:6e:b3:db:64:8b:18:59=0D=0A SRC=3D<som=
e source ip> DST=3D<some destination ip> LEN=3D40 TOS=3D0x00 PREC=3D0x00 TT=
L=3D53 ID=3D38011 DF PROTO=3DTCP SPT=3D443 DPT=3D56033 WINDOW=3D49680 RES=3D=
0x00 RST URGP=3D0=0D=0A=0D=0AIts been determined the mac=3D portion is a co=
mbined string for:=0D=0A2:00:00:00:00:09:00:06:2a:73:f0:70: --> SMAC and DM=
AC address combined=0D=0A08:00:  --> type IP=0D=0A45:00:00:2c: --> IP v4 he=
ader, TOS and Length fields=0D=0Aa2:d7:00:00: --> ID, flags and frag offset=0D=
=0Af2:06:50:c1: --> TTL, protocol (TCP) and checksum=20=0D=0Ad0:4e:50:22:44=
:a3:70:1f: --> SrcIP and DstIP=0D=0A00:50:e3:99: --> SrcPort (HTTP) and Des=
tPort=0D=0A=20=0D=0AWe are running iptables 1.2.9. Only packets from the fi=
lter input chain get logged in this fashion and we don't know why. Such a l=
ong mac address makes it hard to analyze the logs and figure out what's goi=
ng on.=20=0D=0A=20=0D=0AWhy does the mac get logged this way=3F And is ther=
e anyway to prevent it from logging in this manner=3F=0D=0A=0D=0AThanks,=0D=
=0ADan=0D=0A=0D=0A_____________=0D=0ALEGAL NOTICE=0D=0AUnless expressly sta=
ted otherwise, this message is confidential=0D=0Aand may be privileged. It =
is intended for the addressee(s) only.=0D=0AAccess to this E-mail by anyone=
 else is unauthorized.=0D=0AIf you are not an addressee, any disclosure or =
copying of the=0D=0Acontents of this E-mail or any action taken (or not tak=
en) in=0D=0Areliance on it is unauthorized and may be unlawful. If you are =
not an=0D=0Aaddressee, please inform the sender immediately, then delete th=
is=0D=0Amessage and empty from your trash.=0D=0A

