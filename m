From: hclfm@pricol.co.in
Subject: RE: Did MASQUERADE not work ?
Date: Wed, 10 Mar 2004 14:43:27 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF39E09FC8.8C65F535-ON65256E53.0032AB6B@pricol.co.in>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Kevork' <rxlm@comintec.com.ar>, netfilter@lists.netfilter.org

<P><FONT FACE=3D"Courier">&gt; Iptables script is the same as when it worke=
d.<BR>&gt; MASQ line is:<BR>&gt; iptables -t nat -A POSTROUTING -s 192.168.=
250.0/24 -d<BR>&gt; $internet -j MASQUERADE<BR></FONT></P><P><FONT FACE=3D"=
Courier">Hi ,</FONT></P><P><FONT FACE=3D"Courier">You have missed the outgo=
ing interface &quot;-o&quot; option ( Internet Interface )</FONT></P><P><FO=
NT FACE=3D"Courier">iptables -t nat -A POSTROUTING -o eth1 -s 192.168.250.0=
/24 -d<BR> $internet -j MASQUERADE</FONT></P><P><FONT FACE=3D"Courier">must=
 work.<BR></FONT></P><P>regards,<BR><BR>U.SivaKumar,<BR>Networking &amp; E-=
Security,<BR>HCL INFOSYSTEMS LIMITED,<BR><BR>&quot;The Purpose of Computing=
 is Insight, Not Numbers&quot; <BR><BR><BR></P><P>&nbsp;<BR><FONT SIZE=3D2>=
<B>&quot;Rob Sterenborg&quot; &lt;rob@sterenborg.info&gt;</B></FONT><BR><FO=
NT SIZE=3D2>Sent by: netfilter-admin@lists.netfilter.org</FONT><BR><FONT SI=
ZE=3D2>03/10/2004 08:52 AM CET</FONT><BR><BR> <FONT SIZE=3D2>To:</FONT> <FO=
NT SIZE=3D2>&quot;'Kevork'&quot; &lt;rxlm@comintec.com.ar&gt;, &lt;netfilte=
r@lists.netfilter.org&gt;</FONT><BR> <FONT SIZE=3D2>cc:</FONT> <BR> <FONT S=
IZE=3D2>bcc:</FONT> <BR> <FONT SIZE=3D2>Subject:</FONT> <FONT SIZE=3D2>RE: =
Did MASQUERADE not work ?</FONT><BR> <BR><BR></P><P><FONT FACE=3D"Monospace=
,Courier">&gt; Iptables script is the same as when it worked.<BR>&gt; MASQ =
line is:<BR>&gt; iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d<BR>&=
gt; $internet -j MASQUERADE<BR></FONT><BR><FONT FACE=3D"Monospace,Courier">=
What is &quot;-d $internet&quot; ?<BR>If $internet is 0.0.0.0 (as it should=
 be) then you don't need to specify it<BR>as this is assumed.<BR></FONT><BR=
><FONT FACE=3D"Monospace,Courier">Did you try SNAT :<BR>iptables -t nat -A =
POSTROUTING -o &lt;if=5Finet&gt; \<BR> &nbsp;-s 192.168.250.0/24 -j SNAT --=
to-source &lt;ip=5Finet&gt;<BR></FONT><BR><FONT FACE=3D"Monospace,Courier">=
Do you have a FORWARD rule in place that allows MASQ/SNAT, or do you have<B=
R>FORWARD policy set to ACCEPT (which you should not do) ?<BR></FONT><BR><F=
ONT FACE=3D"Monospace,Courier">Do you have &quot;echo 1 &gt; /proc/sys/net/=
ipv4/ip=5Fforward&quot; ?<BR></FONT><BR><BR><FONT FACE=3D"Monospace,Courier=
">Gr,<BR>Rob<BR></FONT></P>=

