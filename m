From: John Hawley <jhawley@bgea.org>
Subject: Re: TCPMSS workaround on OUTPUT?
Date: 30 Sep 2002 09:38:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033396735.23494.14.camel@magnum>
References: <1033056377.562.49.camel@maximus> 
	<3D937473.4000504@bewegungsmelder.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-OQEkFlGcY3oVSNXLLzvY"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D937473.4000504@bewegungsmelder.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Cc: Netfilter List <netfilter@lists.netfilter.org>


--=-OQEkFlGcY3oVSNXLLzvY
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-09-26 at 15:56, Thomas Lussnig wrote:


    first your entry is working, but i think that the filter could=20
    "--tcp-flags SYN,RST,ACK SYN"
    Because "ACK,SYN" as part 2 of the handshake there the MSS should=20
    already be known.

well, I was just copying ver batim out of the kernel build docs ...

    And i think that you should tell the direction (-o ppp+ maybe)
   =20
    Local packages should know the correct size since the interface (DSL=20
    maybe) have the correct mtu.

ok, so is there a kernel bug?  I dont seem to have this problem on
kernels previous to 2.4.18.  That is, that the fw machine itself can't
browse these web sites.  The two situations I've seen so far are:  (1)
fw (kernel 2.4.18) --> Cisco router with fractional T1 and (2) fw
(kernel 2.4.19) --> Lucent Pipeline on ISDN.

   =20
    Examplke
     > ip ad li ppp0
    19: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 1492 qdisc cbq qlen 3
        link/ppp
        inet 217.233.244.33 peer 217.5.98.168/32 scope global ppp0
   =20
    Try this
    ip ro ch 10.0.1.0/24 dev eth1 advmss 1490
    on my networked this make all things working nice WITHOUT the=20
    clamp-mss-to-pmtu iptables entry.


didn't help

   =20
    Cu Thomas Lu=DFnig
   =20
   =20

--=20
John Hawley
BGEA/ITS <=3D> Network Admin
612.335.1334
jhawley@bgea.org

--=-OQEkFlGcY3oVSNXLLzvY
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.2">
</HEAD>
<BODY>
On Thu, 2002-09-26 at 15:56, Thomas Lussnig wrote:
<BR>
<FONT SIZE="3"></FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>first your entry is working, but i think that the filter could </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>&quot;--tcp-flags SYN,RST,ACK SYN&quot;</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Because &quot;ACK,SYN&quot; as part 2 of the handshake there the MSS should </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>already be known.</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">well, I was just copying ver batim out of the kernel build docs ...</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>And i think that you should tell the direction (-o ppp+ maybe)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Local packages should know the correct size since the interface (DSL </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>maybe) have the correct mtu.</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">ok, so is there a kernel bug?&nbsp; I dont seem to have this problem on kernels previous to 2.4.18.&nbsp; That is, that the fw machine itself can't browse these web sites.&nbsp; The two situations I've seen so far are:&nbsp; (1) fw (kernel 2.4.18) --&gt; Cisco router with fractional T1 and (2) fw (kernel 2.4.19) --&gt; Lucent Pipeline on ISDN.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Examplke</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I> &gt; ip ad li ppp0</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19: ppp0: &lt;POINTOPOINT,MULTICAST,NOARP,UP&gt; mtu 1492 qdisc cbq qlen 3</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>    link/ppp</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>    inet 217.233.244.33 peer 217.5.98.168/32 scope global ppp0</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Try this</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>ip ro ch 10.0.1.0/24 dev eth1 advmss 1490</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>on my networked this make all things working nice WITHOUT the </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>clamp-mss-to-pmtu iptables entry.</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">didn't help</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Cu Thomas Lu&#223;nig</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
John Hawley
BGEA/ITS &lt;=&gt; Network Admin
612.335.1334
jhawley@bgea.org</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-OQEkFlGcY3oVSNXLLzvY--


