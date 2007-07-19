From: squid3@treenet.co.nz
Subject: REDIRECT and IPv6
Date: Thu, 19 Jul 2007 12:25:30 +1200 (NZST)
Message-ID: <1246.130.217.140.56.1184804730.squirrel@webmail.treenet.co.nz>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings,

Pardon if this is a dumb question. But I have searched the web, and the
source code for a solution to this one and have reached a brick wall.

I'm upgrading a user-space proxy (squid3) which has in the past done
transparent connections under IPv4-only using SO_ORIGINAL_DST.

The Firewall/router uses iptables and REDIRECT port 80 outbound to port
81. All is fine and dandy when squid listens on 0.0.0.0:81.

With the new code I have to use an IPv6 socket ( [::]:81 ) as the
receiver. With that getsockopt(..., SO_ORIGINAL_DST, ...) always returns
err "92 Protocol not supported." regardless of the IP-level parameters
passed in.

NOTE: All traffic for testing so far has been from IPv4 clients to what
they think is an IPv4 server, but with a dual-enabled middleman. The
'middleman' Software is iptables 1.3.6 on Debian 2.6.21-2-486 (unstable),
squid3 built with g++ 4.1.3.

Can anyone point me in the right direction for a solution that will work?
Ideally one that is protocol-independant, but anything is welcome even an
'upgrade to X'.

Amos Jeffries
Squid3 Development Team



