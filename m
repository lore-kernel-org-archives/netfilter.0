From: "ccddtt" <ccddtt@263.net>
Subject: Re: Apache:access_log - 408
Date: Wed, 28 Jan 2004 0:2:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127160153.0828C2F70A@smtp.263.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-2022-jp"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

hi,
you can see same question:

http://www.merit.edu/mail.archives/nanog/2001-09/msg01457.html

=09

=3D=3D=3D=3D=3D=3D=3D 2004-01-26 17:06:00 =C4=FA=D4=DA=C0=B4=D0=C5=D6=D0=D0=B4=B5=C0=A3=BA=3D=3D=3D=3D=3D=3D=3D

>hi,all
>
>please help me.
>my linux server installed redhat 9 + apache 1.3.29. passing=
 through some attack.
>in apache acc_log,like :
>221.233.227.230 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>221.233.227.230 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>221.233.227.230 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>61.145.188.110 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>210.38.179.145 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>221.233.227.230 - - [17/Jan/2004:17:26:32 +0800] "-" 408 -
>but no err_log.
>
>some packge like :
>Jan 18 19:35:53 linux-sv1 kernel: IN=3Deth0 OUT=3D=
 MAC=3D00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=3D220.173.8.56=
 DST=3D61.135.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D114 ID=3D42497 DF=
 PROTO=3DTCP SPT=3D60177 DPT=3D80 WINDOW=3D8280 RES=3D0x00 ACK URGP=3D0 
>Jan 18 19:35:53 linux-sv1 kernel: IN=3Deth0 OUT=3D=
 MAC=3D00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=3D220.173.8.56=
 DST=3D61.135.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D114 ID=3D42753 DF=
 PROTO=3DTCP SPT=3D60177 DPT=3D80 WINDOW=3D8280 RES=3D0x00 ACK URGP=3D0 
>Jan 18 19:35:53 linux-sv1 kernel: IN=3Deth0 OUT=3D=
 MAC=3D00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=3D61.173.25.88=
 DST=3D61.135.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D115 ID=3D53402 DF=
 PROTO=3DTCP SPT=3D63601 DPT=3D80 WINDOW=3D16560 RES=3D0x00 ACK URGP=3D0 
>Jan 18 19:35:53 linux-sv1 kernel: IN=3Deth0 OUT=3D=
 MAC=3D00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=3D220.173.8.56=
 DST=3D61.135.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D114 ID=3D43265 DF=
 PROTO=3DTCP SPT=3D60182 DPT=3D80 WINDOW=3D8280 RES=3D0x00 ACK URGP=3D0 
>
>how to set this iptables rules?
>
>what's this attack?
>thanks your any help!

=3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D
=09=09=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=D6=C2
=C0=F1=A3=A1
 
=09=09=09=09 
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1ccddtt
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1ccddtt@263.net
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12004-01-27



