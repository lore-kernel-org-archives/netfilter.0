From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: using heartbeat for high availability of NETFILTER Firewall
Date: Wed, 5 Feb 2003 20:51:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD77811@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CD50.0972FF37"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chip Upsal <chip@cyberwolf.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2CD50.0972FF37
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Chip Upsal [mailto:chip@cyberwolf.com] wrote:
>I am trying to use heartbeat to give us fallover on our =
netfilter/iptables
>firewall..
>
>However, I am not having any luck getting things to work consistently. =
Am I
>barking up the wrong tree...is it possible to use heartbeat to achieve =
these
>goals? Should I be looking at something else?
>

Chip,

Could you elaborate a little on what is going wrong ? Are you =
experiencing
problems with the heartbeat software, like resources/IP addresses not
failing over or appearing on both nodes ?

It's certainly possible to set up a poor man's failover firewall
with netfilter and heartbeat.=20
There's no state replication of the connection tracking information,
although, depending on the way your firewall rules are set up,
"transparent" failover should be possible. Problem areas I can think of,
due to lack of conntrack info replication between the nodes, are
RELATED connections of conntrack helpers, and NAT/MASQUEARDE issues
when a node fails over. But those issues have a fairly low impact
in most setups.

Regards,
Filip

------_=_NextPart_001_01C2CD50.0972FF37
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: using heartbeat for high availability of NETFILTER =
Firewall</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Chip Upsal [<A =
HREF=3D"mailto:chip@cyberwolf.com">mailto:chip@cyberwolf.com</A>] =
wrote:<BR>
&gt;I am trying to use heartbeat to give us fallover on our =
netfilter/iptables<BR>
&gt;firewall..<BR>
&gt;<BR>
&gt;However, I am not having any luck getting things to work =
consistently. Am I<BR>
&gt;barking up the wrong tree...is it possible to use heartbeat to =
achieve these<BR>
&gt;goals? Should I be looking at something else?<BR>
&gt;<BR>
<BR>
Chip,<BR>
<BR>
Could you elaborate a little on what is going wrong ? Are you =
experiencing<BR>
problems with the heartbeat software, like resources/IP addresses =
not<BR>
failing over or appearing on both nodes ?<BR>
<BR>
It's certainly possible to set up a poor man's failover firewall<BR>
with netfilter and heartbeat.<BR>
There's no state replication of the connection tracking information,<BR>
although, depending on the way your firewall rules are set up,<BR>
&quot;transparent&quot; failover should be possible. Problem areas I can =
think of,<BR>
due to lack of conntrack info replication between the nodes, are<BR>
RELATED connections of conntrack helpers, and NAT/MASQUEARDE issues<BR>
when a node fails over. But those issues have a fairly low impact<BR>
in most setups.<BR>
<BR>
Regards,<BR>
Filip</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2CD50.0972FF37--

