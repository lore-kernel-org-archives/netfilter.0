From: =?iso-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: Linux/Windows pure SSL "VPN" Solution
Date: Wed, 2 Jun 2004 20:28:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FF4D@ZAR1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C448CF.77A4B690"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C448CF.77A4B690
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi

You can try ssh port forwarding(windows clients/linux), or ppp over =
ssh(only
works in linux/linux env).=20
It's simple and easy to do for encript especific aplications.
The mayor problem happends when your aplications use dinamic ports(in =
ssh
port forwarding).


David

-----Mensaje original-----
De: Small, Jim [mailto:jim.small@eds.com]
Enviado el: mi=E9rcoles, 02 de junio de 2004 20:10
Para: netfilter@lists.netfilter.org
Asunto: Linux/Windows pure SSL "VPN" Solution


I have a situation (common) where I need access to my corporate =
network, but
the vendor will only allow traffic over ports 80 and 443.  The vendor =
would
like me to do an SSL VPN as they do not want to open other ports =
(read--no
IPSec).  I would like to do a Linux proof of concept solution using =
iptables
and some sort of Open Source SSL VPN (Linux server sitting on the =
Internet
or in one of our DMZs).

This looks promising:  http://www.hsc.fr/ressources/outils/ssltunnel/
It's just what I'm looking for but it doesn't support Windows clients.

I've looked at OpenVPN, CIPE, and vTun, but none of them appear to work =
only
over port 443.  OpenVPN works over 443, but also requires UDP/5000 =
which is
not possible.

Does anyone know of a pure (TCP/443 only) SSL Open Source solution?

Thanks,
   <> Jim

PS  I realize this is not a pure iptables question, so I'm prepared for
flames...  ;-)


------_=_NextPart_001_01C448CF.77A4B690
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
<TITLE>RE: Linux/Windows pure SSL &quot;VPN&quot; Solution</TITLE>
</HEAD>
<BODY>
<BR>

<P><FONT SIZE=3D2>Hi</FONT>
</P>

<P><FONT SIZE=3D2>You can try ssh port forwarding(windows =
clients/linux), or ppp over ssh(only works in linux/linux env). </FONT>
<BR><FONT SIZE=3D2>It's simple and easy to do for encript especific =
aplications.</FONT>
<BR><FONT SIZE=3D2>The mayor problem happends when your aplications use =
dinamic ports(in ssh port forwarding).</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>David</FONT>
</P>

<P><FONT SIZE=3D2>-----Mensaje original-----</FONT>
<BR><FONT SIZE=3D2>De: Small, Jim [<A =
HREF=3D"mailto:jim.small@eds.com">mailto:jim.small@eds.com</A>]</FONT>
<BR><FONT SIZE=3D2>Enviado el: mi=E9rcoles, 02 de junio de 2004 =
20:10</FONT>
<BR><FONT SIZE=3D2>Para: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Asunto: Linux/Windows pure SSL &quot;VPN&quot; =
Solution</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>I have a situation (common) where I need access to my =
corporate network, but</FONT>
<BR><FONT SIZE=3D2>the vendor will only allow traffic over ports 80 and =
443.&nbsp; The vendor would</FONT>
<BR><FONT SIZE=3D2>like me to do an SSL VPN as they do not want to open =
other ports (read--no</FONT>
<BR><FONT SIZE=3D2>IPSec).&nbsp; I would like to do a Linux proof of =
concept solution using iptables</FONT>
<BR><FONT SIZE=3D2>and some sort of Open Source SSL VPN (Linux server =
sitting on the Internet</FONT>
<BR><FONT SIZE=3D2>or in one of our DMZs).</FONT>
</P>

<P><FONT SIZE=3D2>This looks promising:&nbsp; <A =
HREF=3D"http://www.hsc.fr/ressources/outils/ssltunnel/" =
TARGET=3D"_blank">http://www.hsc.fr/ressources/outils/ssltunnel/</A></FO=
NT>
<BR><FONT SIZE=3D2>It's just what I'm looking for but it doesn't =
support Windows clients.</FONT>
</P>

<P><FONT SIZE=3D2>I've looked at OpenVPN, CIPE, and vTun, but none of =
them appear to work only</FONT>
<BR><FONT SIZE=3D2>over port 443.&nbsp; OpenVPN works over 443, but =
also requires UDP/5000 which is</FONT>
<BR><FONT SIZE=3D2>not possible.</FONT>
</P>

<P><FONT SIZE=3D2>Does anyone know of a pure (TCP/443 only) SSL Open =
Source solution?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks,</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; &lt;&gt; Jim</FONT>
</P>

<P><FONT SIZE=3D2>PS&nbsp; I realize this is not a pure iptables =
question, so I'm prepared for</FONT>
<BR><FONT SIZE=3D2>flames...&nbsp; ;-)</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C448CF.77A4B690--

