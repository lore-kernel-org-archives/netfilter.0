From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: newbie problem? Compilation error:ll_proto.c:36: `ETH_P_ECHO' undeclared
Date: Fri, 14 Jun 2002 01:13:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615DB4@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2132F.FE905140"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Magnus Von Rosen <magnus.von.rosen@axis.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2132F.FE905140
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Has anyone already answered this ?
Actually you are trying to compile iproute2, which is not netfilter/
iptables related.

However, your compile error can be fixed by commenting out line
36 of lib/ll_proto.c, like this:

/* __PF(ECHO,echo) */

Regards,
Filip


-----Original Message-----
From:	Magnus Von Rosen [mailto:magnus.von.rosen@axis.com]
Sent:	Wed 15/05/2002 11:18
To:	'netfilter@lists.samba.org'
Cc:=09
Subject:	newbie problem? Compilation error:ll_proto.c:36: `ETH_P_ECHO' =
undeclared
Howdy,

Im working on a thesis and I'm learning Linux as I go along.
I tried to compile the 1.2.6a IPtables at my RedHat-machine with kernel =
2.4.18.
I get the following message when running "make".

gcc -D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g -I../include-glibc =
-include ../include-glibc/glibc-bugs.h -I/usr/src/linux/include =
-I../include -DRESOLVE_HOSTNAMES   -c -o ll_proto.o ll_proto.c
ll_proto.c:36: `ETH_P_ECHO' undeclared here (not in a function)
ll_proto.c:36: initializer element is not constant
ll_proto.c:36: (near initialization for `llproto_names[1].id')
make[1]: *** [ll_proto.o] Error 1
make[1]: Leaving directory `/home/magnusvr/tmp/iproute2/lib'
make: *** [all] Error 2


Any help is appreciated. Thanks,

Magnus von Rosen, Sweden.
magnusvr@axis.com





------_=_NextPart_001_01C2132F.FE905140
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>RE: newbie problem? Compilation error:ll_proto.c:36: `ETH_P_ECHO' =
undeclared</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
Has anyone already answered this ?<BR>
Actually you are trying to compile iproute2, which is not netfilter/<BR>
iptables related.<BR>
<BR>
However, your compile error can be fixed by commenting out line<BR>
36 of lib/ll_proto.c, like this:<BR>
<BR>
/* __PF(ECHO,echo) */<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
-----Original Message-----<BR>
From:&nbsp;&nbsp; Magnus Von Rosen [<A =
HREF=3D"mailto:magnus.von.rosen@axis.com">mailto:magnus.von.rosen@axis.co=
m</A>]<BR>
Sent:&nbsp;&nbsp; Wed 15/05/2002 11:18<BR>
To:&nbsp;&nbsp;&nbsp;&nbsp; 'netfilter@lists.samba.org'<BR>
Cc:&nbsp;&nbsp;&nbsp;&nbsp;<BR>
Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newbie problem? =
Compilation error:ll_proto.c:36: `ETH_P_ECHO' undeclared<BR>
Howdy,<BR>
<BR>
Im working on a thesis and I'm learning Linux as I go along.<BR>
I tried to compile the 1.2.6a IPtables at my RedHat-machine with kernel =
2.4.18.<BR>
I get the following message when running &quot;make&quot;.<BR>
<BR>
gcc -D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g -I../include-glibc =
-include ../include-glibc/glibc-bugs.h -I/usr/src/linux/include =
-I../include -DRESOLVE_HOSTNAMES&nbsp;&nbsp; -c -o ll_proto.o =
ll_proto.c<BR>
ll_proto.c:36: `ETH_P_ECHO' undeclared here (not in a function)<BR>
ll_proto.c:36: initializer element is not constant<BR>
ll_proto.c:36: (near initialization for `llproto_names[1].id')<BR>
make[1]: *** [ll_proto.o] Error 1<BR>
make[1]: Leaving directory `/home/magnusvr/tmp/iproute2/lib'<BR>
make: *** [all] Error 2<BR>
<BR>
<BR>
Any help is appreciated. Thanks,<BR>
<BR>
Magnus von Rosen, Sweden.<BR>
magnusvr@axis.com<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2132F.FE905140--

