From: hclfm@pricol.co.in
Subject: Re: Forwarding Multicast Traffic
Date: Tue, 10 Feb 2004 17:02:15 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFD1450D14.AEC11934-ON65256E36.003F6030@pricol.co.in>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

<P>&nbsp;</P><P><FONT SIZE=3D4>Hi,</FONT><BR><BR><FONT SIZE=3D4>Make sure t=
hat you have enabled multicast support option and IP: Multicast routing in =
your kernel .</FONT><BR><BR><FONT SIZE=3D4>Download mrouted for linux and c=
onfigure the interfaces in /etc/mrouted.conf </FONT><BR><BR><FONT SIZE=3D4>=
ensure that you have route for multicast address. </FONT><BR><BR><FONT SIZE=
=3D4>start mrouted.</FONT><BR><BR><FONT SIZE=3D4>regards,</FONT><BR><BR><FO=
NT SIZE=3D4>U.SivaKumar.</FONT><BR><BR><FONT SIZE=3D4>HCL INFOSYSTEMS LIMIT=
ED.</FONT><BR><BR><BR><B>ms419@freezone.co.uk</B><BR>Sent by: netfilter-adm=
in@lists.netfilter.org<BR>02/08/2004 11:31 PM PST<BR><BR>To:<FONT SIZE=3D4>=
 </FONT>netfilter@lists.netfilter.org<BR>cc:<FONT SIZE=3D4> </FONT><BR>bcc:=
<FONT SIZE=3D4> </FONT><BR>Subject:<FONT SIZE=3D4> </FONT>Forwarding Multic=
ast Traffic<BR><BR><BR><FONT SIZE=3D4>Two machines communicate with one ano=
ther using multicast - mDNS - when</FONT><BR><FONT SIZE=3D4>they are on the=
 same network segment. When they are on separate network</FONT><BR><FONT SI=
ZE=3D4>segments, however - though they can connect to one another across a<=
/FONT><BR><FONT SIZE=3D4>router - they can't communicate using multicast. I=
 presume that this is</FONT><BR><FONT SIZE=3D4>because the router isn't for=
warding multicast traffic to other network</FONT><BR><FONT SIZE=3D4>segment=
s? The router is running Linux kernel version 2.4.23 and</FONT><BR><FONT SI=
ZE=3D4>iptables. How can I configure iptables to forward multicast traffic =
to</FONT><BR><FONT SIZE=3D4>other network segments?</FONT><BR><BR><FONT SIZ=
E=3D4>Thanks very much,</FONT><BR><BR><FONT SIZE=3D4>Jack</FONT><BR></P>=

