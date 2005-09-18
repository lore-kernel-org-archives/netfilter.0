From: "Greg Scott" <GregScott@InfraSupportEtc.com>
Subject: RE: NAT (IPTABLES) + Windows 2K Routing and Remote Access (VPN)
	+Wndows/xp client access (VPN)
Date: Sun, 18 Sep 2005 09:41:16 -0500
Message-ID: <365871C49598504A9481DDBEC3EB49551232B0@MAIL.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?= <sa.campos@datasulsp.com.br>, netfilter lists <netfilter@lists.netfilter.org>

You need the PPTP patch in patch-o-matic and you will need to build a =
custom kernel.  Unfortunately, the latest version has trouble building =
with the 2.6 kernel.  At least, that was the case about 2 weeks ago. =20

- Greg Scott
=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Sebasti=E3o =
Ant=F4nio Campos (GWA)
Sent: Saturday, September 17, 2005 7:47 PM
To: netfilter lists
Subject: NAT (IPTABLES) + Windows 2K Routing and Remote Access (VPN) =
+Wndows/xp client access (VPN)

Hi,

I have a local network and the gateway is a Redhat 9 with Firewall =
iptables v1.2.7a doing NAT to the LAN. I need to access a W2k RAS and it =
is behind a other Redhat 9 with Firewall iptables v1.2.7a. I use the =
Internet to connect this two sites.

On the local network I try to access the W2k Routing and Remote Access =
and it only work with the first connection or the first local IP. When =
other LAN's user try to access, they could not get the connection. On =
the Windows XP the appear the msg "verifyng username and password" is =
show and do not connect or ask for the password. This msg stay until =
timed out.

Is there any problem with Iptables or Nat??

Tks

Sebasti=E3o.






