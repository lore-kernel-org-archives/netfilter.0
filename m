From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Bridge+Bandwidth Control
Date: 11 Apr 2003 11:13:56 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050039841.937.39.camel@india>
References: <000d01c2ffbd$947bac30$010aa8c0@crz2>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Baxa6PlgjEzFWJl9DPc4"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2ffbd$947bac30$010aa8c0@crz2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?ISO-8859-1?Q?Hern=E1n?= Mailluquet <hernan@mdp.edu.ar>
Cc: netfilter@lists.netfilter.org


--=-Baxa6PlgjEzFWJl9DPc4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-04-11 at 05:32, Hern=E1n Mailluquet wrote:

    Hi!
   =20
    I was trying to implement traffic control on a linux
    bridge. Basically, I'll need to allocate designated bandwidth
    to various services while the rest get throttled.
   =20
    Eg. on a 10MBit bandwidth.
    http/ftp will get 128K
    while the rest (smtp/POP3) will get 64K.
    Whatever traffic passing through the bridge
    in one direction must not exceed 192K.
   =20
    To my dismay, I realised that firewall marking classifier
    will not work under bridging mode.
   =20
    So right now I'm kind of stuck because of that.
   =20
    Can someone tell me whether if I can implement something like
    the above?
   =20
    Thanks.
   =20
    Hi

Why don't you try implimenting traffic controller (iproute)?
--=20
Regards
Dharmendra.T




--=-Baxa6PlgjEzFWJl9DPc4
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-04-11 at 05:32, Hern&#225;n Mailluquet wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Hi!</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I was trying to implement traffic control on a linux</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>bridge. Basically, I'll need to allocate designated bandwidth</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>to various services while the rest get throttled.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Eg. on a 10MBit bandwidth.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>http/ftp will get 128K</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>while the rest (smtp/POP3) will get 64K.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Whatever traffic passing through the bridge</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>in one direction must not exceed 192K.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>To my dismay, I realised that firewall marking classifier</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>will not work under bridging mode.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>So right now I'm kind of stuck because of that.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Can someone tell me whether if I can implement something like</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>the above?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Thanks.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">Hi</FONT></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Why don't you try implimenting traffic controller (iproute)?</FONT>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-Baxa6PlgjEzFWJl9DPc4--


