From: "Jesus M. Salvo Jr." <jesus.salvo@optusnet.com.au>
Subject: pptp_conntrack_nat and kernel 2.6.15
Date: Tue, 3 Jan 2006 22:53:08 +1100
Message-ID: <200601032253.08997.jesus.salvo@optusnet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


Sorry for the introduction to my problem, but I felt it relevant in what I =
am=20
trying to do.

I have setup a gateway  with IP and VPN / PPTP masquerading using a 2.6 ker=
nel=20
( FC3 ). I am also using the following as a base:

=09
http://www.e-infomax.com/ipmasq/howto/c-html/firewall-examples.html#RC.FIRE=
WALL-2.4.X

However, only one client at a time from within the LAN can connect to a
remote PPTP server.=20

Based on Section 2.7 of this URL:

=A0 =A0 =A0 =A0 http://www.tldp.org/HOWTO/VPN-Masquerade-HOWTO-2.html

=2E.. one should ensure that "PPTP Call ID masquerade" is enabled on the
kernel to allow multiple clients to connect to a remote PPTP server.=20

However, according to this:

=A0 =A0 =A0 =A0 http://www.tldp.org/HOWTO/VPN-Masquerade-HOWTO-3.html

The kernel option CONFIG_IP_MASQUERADE_PPTP_MULTICLIENT is only for 2.0
kernels, and with 2.2 kernels, it seemed to have been replaced with
CONFIG_IP_MASQUERADE_PPTP:

CONFIG_IP_MASQUERADE_PPTP
=A0 =A0 - Enables PPTP data channel masquerading, if you are
=A0 =A0 =A0 masquerading a PPTP client or server. This is now
=A0 =A0 =A0 available as a module.
=A0 =A0 =A0 Note that you no longer need to specify Call-ID masquerade.

Now for 2.6 kernels, it seems that one has to use the pptp_conntrack_nat=20
path-o-matic. However, based on  this posting to this mailing list:

	http://lists.netfilter.org/pipermail/netfilter/2005-October/063045.html

=2E... that the pptp_conntrack_nat patch has been accepted to the mainline=
=20
kernel. So I downloaded the 2.6 kernel and also checked the changelog. Look=
s=20
like I need to enable IP_NF_PPTP and IP_NF_NAT_PPTP.


So am I right to assume that:

1) The patch-o-matic for pptp_conntrack_nat is no longer needed if one uses=
=20
2.6.15 kernels ?

2) A linux gateway with 2.6.15 kernel and IP and VPN masquerading and with =
the=20
above modules loaded  will finally allow mutliple clients within the LAN to=
=20
connect to a remote PPTP server ??

Thanks.

John


