From: Gareth Hastings <Gareth.Hastings@netcall.com>
Subject: Port forward to public IP's behind firewall
Date: Thu, 4 Sep 2003 16:30:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9AD675D1C5325D4F87D79F3EB7E539F3ABE5@postmanpat.netcall.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C372F9.7B222A39"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C372F9.7B222A39
Content-Type: text/plain

I am using proxy arp and ip aliasing with iptables as a firewall for a few
class C networks. It works with no problems. All our machines behind the
firewall have public addresses. Now I would like to add a port forward rule
that sends all incoming mail to another IP address. I am not sure what I'd
need to do. I didn't think SNAT or DNAT were needed here as no NAT is
happening. Anyone have any ideas? Do I need to mangle the destination
address?

Thanks

Gareth

------_=_NextPart_001_01C372F9.7B222A39
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>Port forward to public IP's behind firewall</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>I am using proxy arp and ip aliasing with iptables as =
a firewall for a few class C networks. It works with no problems. All =
our machines behind the firewall have public addresses. Now I would =
like to add a port forward rule that sends all incoming mail to another =
IP address. I am not sure what I'd need to do. I didn't think SNAT or =
DNAT were needed here as no NAT is happening. Anyone have any ideas? Do =
I need to mangle the destination address?</FONT></P>

<P><FONT SIZE=3D2>Thanks</FONT>
</P>

<P><FONT SIZE=3D2>Gareth</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C372F9.7B222A39--

