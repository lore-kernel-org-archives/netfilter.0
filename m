From: Carles Xavier Munyoz =?iso-8859-15?q?Bald=F3?= <carles@unlimitedmail.org>
Subject: Source routed IP packets.
Date: Wed, 12 May 2004 11:17:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405121117.14092.carles@unlimitedmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: fwbuilder-discussion@lists.sourceforge.net
Cc: netfilter@lists.netfilter.org

Hi,
Every time I run the Nessuss remote security scanner over my IPTables FireW=
all=20
I get the next warning:
[...]
Warning found on port general/tcp

      The remote host accepts loose source routed IP packets.
      The feature was designed for testing purpose.
      An attacker may use it to circumvent poorly designed IP filtering
      and exploit another flaw. However, it is not dangerous by itself.

      Solution : drop source routed packets on this host or on other ingress
      routers or firewalls.

Risk factor : Low
[...]

But the accept_source_route flag for all FireWall interfaces is disabled:
# cat /proc/sys/net/ipv4/conf/eth0/accept_source_route
# 0
# cat /proc/sys/net/ipv4/conf/eth1/accept_source_route
# 0
# cat /proc/sys/net/ipv4/conf/eth2/accept_source_route
# 0

Then, why I get this warning in the Nessuss report ?
How may I solve it ?

Greetings
=2D--
Carles Xavier Munyoz Bald=F3
carles@unlimitedmail.org
http://www.unlimitedmail.net/
=2D--


