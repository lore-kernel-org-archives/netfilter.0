From: "Tim" <tbblitz@optusnet.com.au>
Subject: H323
Date: Thu, 21 Nov 2002 10:19:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2918a$9ab0af20$0b00a8c0@timboss>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0014_01C29147.8BB47440"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0014_01C29147.8BB47440
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, just wondering if anyone has the same problem.

Fresh copy of 2.4.19 and iptables 1.2.7a with patch-o-matic and used the =
z-newnat and h323 that comes with it.. fixed the newnat patch which =
couldn't load. add 2 lines to a ip_conntrack.h file and it worked fine. =
We send audio fine but can't receive it.. possibly the same problem with =
video too...

Tim


------=_NextPart_000_0014_01C29147.8BB47440
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT color=3D#000000 size=3D2>
<P><FONT face=3DArial>Hi, just wondering if anyone has the same=20
problem.</FONT></P>
<P><FONT face=3DArial>Fresh copy of 2.4.19 and iptables 1.2.7a with =
patch-o-matic=20
and used the z-newnat and h323 that comes with it.. </FONT><FONT=20
face=3DArial>fixed the newnat patch which couldn't load. add 2 lines to =
a=20
ip_conntrack.h file and it worked fine. W</FONT><FONT face=3DArial>e =
send audio=20
fine but can't receive it.. possibly the same problem with video=20
too...</FONT></P>
<P><FONT face=3DArial>Tim</FONT></P></FONT></DIV></BODY></HTML>

------=_NextPart_000_0014_01C29147.8BB47440--


