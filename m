From: "Bill Karwisch" <william.karwisch@hlbcpa.com>
Subject: connection tracking problem with IPSec.
Date: Thu, 18 Mar 2004 14:49:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FC0A6700187F66409E3FFD1815E5D5CB35EA@hlbserv5.hlbcpa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm new here, so please forgive me if this has already been answered. I
looked at the FAQs and searched on Google with no luck. I tried to =
reduce
this problem to its simplest form. I hope I succeeded.

SETUP:

Simple test environment: A hub and two computers, "A" and "B", both of =
which
run kernel 2.6.4 with native IPSec.

"B" has iptables 1.2.9 using shorewall in a very simple configuration =
with
two interfaces. No NAT/MASQ yet. The second interface is not relevant to =
the
problem.

THE FOLLOWING WORKS OK:

ssh from "A" to "B"

iptables stopped - ssh from "A" to "B" over manually keyed IPSec.

THE FOLLOWING FAILS:

iptables started - ssh from "A" to "B" over manually keyed IPSec.

OBSERVATIONS:
Initial handshake packet is sent using IP protocol 51.

/var/proc/ip_conntrack shows an "unreplied" connection using protocol =
51.

iptables has a rule that, without IPSec, allows the SYN/ACK response =
(state
RELATED,ESTABLISHED). This rule does not match when using IPSec. The =
next
rule matches (state NEW tcp flags: !SYN, RST, ACK/SYN) and after a =
couple of
other steps the packet is dropped.

/var/log/syslog shows the dropped packet is tcp port 22 with SYN/ACK --
presumably the second packet in the handshake.

It appears that the RELATED,ESTABLISHED rule does not match because it =
is
expecting a protocol 51 packet instead of the tcp packet.

Did I miss something about how this should work or miss something in the
configuration? Obviously I can hack the ruleset to force a workaround, =
but
it appears on the surface that there is a problem with connection =
tracking
in this setup.

Bill Karwisch



