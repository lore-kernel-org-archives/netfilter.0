From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: snat Invalid argument??? (urgent)
Date: Fri, 21 Feb 2003 10:58:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017B8C@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D987.6AC67AC0"
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
To: 'Luis Miguel Cruz Miranda' <luismi@b2bi.es>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2D987.6AC67AC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Did you use this as is ...with a broken line. I tried your syntax in =
one
line and got no errors.

Try using it in one line....

-----Original Message-----
From: Luis Miguel Cruz Miranda [mailto:luismi@b2bi.es]=20
Sent: 21 02 2003 10:41 AM
To: netfilter@lists.netfilter.org
Subject: snat Invalid argument??? (urgent)


I execute this line:

# iptables -t nat -A POSTROUTING -s 10.1.0.253 -o eth0 -j SNAT =
--to-source=20
194.149.216.62
iptables: Invalid argument

but it returns Invalid argument????
What is wrong here?


Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - =
LLANERA
Fax:+34 985 980 794                     |       ASTURIAS =
(ESPA=D1A/SPAIN)



------_=_NextPart_001_01C2D987.6AC67AC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: snat Invalid argument??? (urgent)</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Did you use this as is ...with a broken line. I tried =
your syntax in one line and got no errors.</FONT>
</P>

<P><FONT SIZE=3D2>Try using it in one line....</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Luis Miguel Cruz Miranda [<A =
HREF=3D"mailto:luismi@b2bi.es">mailto:luismi@b2bi.es</A>] </FONT>
<BR><FONT SIZE=3D2>Sent: 21 02 2003 10:41 AM</FONT>
<BR><FONT SIZE=3D2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: snat Invalid argument??? (urgent)</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>I execute this line:</FONT>
</P>

<P><FONT SIZE=3D2># iptables -t nat -A POSTROUTING -s 10.1.0.253 -o =
eth0 -j SNAT --to-source </FONT>
<BR><FONT SIZE=3D2>194.149.216.62</FONT>
<BR><FONT SIZE=3D2>iptables: Invalid argument</FONT>
</P>

<P><FONT SIZE=3D2>but it returns Invalid argument????</FONT>
<BR><FONT SIZE=3D2>What is wrong here?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Luis Miguel Cruz =
Miranda.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; B2B =
INTEGRAL, S.A.</FONT>
<BR><FONT SIZE=3D2>CCNA - Systems =
Administrator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pol. Ind. de Asipo</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
C/A - Parcela 86-C</FONT>
<BR><FONT SIZE=3D2>Tel: +34 902 506 =
605&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33.428 - CAYES - LLANERA</FONT>
<BR><FONT SIZE=3D2>Fax:+34 985 980 =
794&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASTURIAS (ESPA=D1A/SPAIN)</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C2D987.6AC67AC0--

