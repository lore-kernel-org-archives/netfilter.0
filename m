From: Francois LE BOURDELLES <flebourdelles@free.fr>
Subject: Re: How to nat a full subnet ?
Date: 12 May 2003 23:33:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052775196.26734.11.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
References: <1052642696.17942.14.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
	 <1052650980.699.4.camel@laurent.luyckx.net>
	 <005701c3188c$8dc87ac0$1cc8c80a@dolphin>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-McNYxWNdgYRSx8rbdyWS"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005701c3188c$8dc87ac0$1cc8c80a@dolphin>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jet <yenjet.chan@eglobal.com.my>
Cc: "Laurent Luyckx (netfilter.org)" <lololuy@tiscali.be>, netfilter@lists.netfilter.org


--=-McNYxWNdgYRSx8rbdyWS
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

No, I've tested it today with success (even if I had to patchomaticto
add this NETMAP from the base proposal to my 2.4.20 source tree and
rebuild the iptable accordingly.

(see the README and INSTALL files from the patch-o-matic and iptable
from the netfilter.org last release)

regards.

Le lun 12/05/2003 =E0 15:44, Jet a =E9crit :

> Do I've to create any ARP entry for the external IP address range for this
> to work?
>=20
> - Jet
>=20
> Laurent Luyckx <lololuy@tiscali.be> wrote:
> > Have look a the NETMAP patch from p-o-m.
> > It creates a static 1:1 mapping of the network address.
> >
> > (http://www.netfilter.org/documentation/pomlist/pom-combined.html#NETMA=
P)
> >
> > Cheers.
> >

--=20
Francois LE BOURDELLES <flebourdelles@free.fr>

--=-McNYxWNdgYRSx8rbdyWS
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.1.8">
</HEAD>
<BODY>
No, I've tested it today with success (even if I had to patchomaticto add this NETMAP from the base proposal to my 2.4.20 source tree and rebuild the iptable accordingly.<BR>
<BR>
(see the README and INSTALL files from the patch-o-matic and iptable from the netfilter.org last release)<BR>
<BR>
regards.<BR>
<BR>
Le lun 12/05/2003 &#224; 15:44, Jet a &#233;crit :
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373" SIZE="3"><I>Do I've to create any ARP entry for the external IP address range for this
to work?

- Jet

Laurent Luyckx &lt;lololuy@tiscali.be&gt; wrote:
&gt; Have look a the NETMAP patch from p-o-m.
&gt; It creates a static 1:1 mapping of the network address.
&gt;
&gt; (</FONT><A HREF="http://www.netfilter.org/documentation/pomlist/pom-combined.html#NETMAP"><FONT SIZE="3">http://www.netfilter.org/documentation/pomlist/pom-combined.html#NETMAP</FONT></A><FONT COLOR="#737373" SIZE="3">)
&gt;
&gt; Cheers.
&gt;</I></FONT></PRE>
</BLOCKQUOTE>
<PRE><TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
-- <BR>
Francois LE BOURDELLES &lt;<A HREF="mailto:flebourdelles@free.fr">flebourdelles@free.fr</A>&gt;
</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-McNYxWNdgYRSx8rbdyWS--


