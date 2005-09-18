From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Subject: NAT (IPTABLES) + Windows 2K Routing and Remote Access (VPN) +
	Wndows/xp client access (VPN)
Date: Sat, 17 Sep 2005 21:47:01 -0300
Message-ID: <001401c5bbeb$c43ba8c0$8b00000a@pivt>
Reply-To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter lists <netfilter@lists.netfilter.org>

Hi,

I have a local network and the gateway is a Redhat 9 with Firewall iptables=
=20
v1.2.7a doing NAT to the LAN. I need to access a W2k RAS and it is behind a=
=20
other Redhat 9 with Firewall iptables v1.2.7a. I use the Internet to connec=
t=20
this two sites.

On the local network I try to access the W2k Routing and Remote Access and =

it only work with the first connection or the first local IP. When other=20
LAN's user try to access, they could not get the connection. On the Windows=
=20
XP the appear the msg "verifyng username and password" is show and do not=20
connect or ask for the password. This msg stay until timed out.

Is there any problem with Iptables or Nat??

Tks

Sebasti=E3o.





