From: hclfm@pricol.co.in
Subject: Re: OS Fingerprint
Date: Tue, 18 Nov 2003 16:44:16 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF80A26EEC.AC78EA84-ON65256DE2.003DBA86@pricol.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
MIME-Version: 1.0
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<P>Use IP personality tool for that. </P><P>http://ippersonality.sourceforg=
e.net</P><P>regards,<BR><BR>U.SivaKumar,<BR>Associate Consultant,<BR>Networ=
king &amp; E-Security,<BR>HCL Infosystems Limited.<BR><BR>&quot;To handle y=
ourself, use your head. To handle others, use your heart.&quot; <BR><BR></P=
><P>&nbsp;<BR><FONT SIZE=3D2><B>Antony Stone &lt;Antony@Soft-Solutions.co.u=
k&gt;</B></FONT><BR><FONT SIZE=3D2>Sent by: netfilter-admin@lists.netfilter=
.org</FONT><BR><FONT SIZE=3D2>11/18/2003 10:57 AM GMT</FONT><BR><BR> <FONT =
SIZE=3D2>To:</FONT> <FONT SIZE=3D2>netfilter@lists.netfilter.org</FONT><BR>=
 <FONT SIZE=3D2>cc:</FONT> <BR> <FONT SIZE=3D2>bcc:</FONT> <BR> <FONT SIZE=
=3D2>Subject:</FONT> <FONT SIZE=3D2>Re: OS Fingerprint</FONT><BR> <BR><BR><=
/P><P><FONT FACE=3D"Monospace,Courier">On Tuesday 18 November 2003 10:05 am=
, Rodre Ghorashi-Zadeh wrote:<BR></FONT><BR><FONT FACE=3D"Monospace,Courier=
">&gt; Hello,<BR>&gt;<BR>&gt; Does anybody on this list have a rule that I =
can use to change the OS<BR>&gt; fingerprint of all packets leaving my DMZ?=
 Thanks in advance.<BR></FONT><BR><FONT FACE=3D"Monospace,Courier">This is =
not a simple thing to do, it involves mucking around with the way the<BR>TC=
P/IP stack works inside the kernel, and as far as I know it can't be done<B=
R>by a router disguising another machine; it needs to be done on the machin=
e<BR>itself which you are trying to disguise.<BR></FONT><BR><FONT FACE=3D"M=
onospace,Courier">Try <A HREF=3Dhttp://voodoo.somoslopeor.com/papers/nmap.h=
tml#LSOLUTIONS>http://voodoo.somoslopeor.com/papers/nmap.html#LSOLUTIONS</A=
> for some<BR>possible ways to achieve it.<BR></FONT><BR><FONT FACE=3D"Mono=
space,Courier">Antony.<BR></FONT><BR><FONT FACE=3D"Monospace,Courier">--<BR=
></FONT><BR><FONT FACE=3D"Monospace,Courier">Documentation is like sex:<BR>=
when it's good, it's very very good;<BR>when it's bad, it's still better th=
an nothing.<BR></FONT><BR><FONT FACE=3D"Monospace,Courier"> &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; Please reply to the list;<BR> &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; please don't CC me.</FONT></P>=

