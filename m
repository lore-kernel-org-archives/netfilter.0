From: Jim Carter <jimc@math.ucla.edu>
Subject: IPSec MTU or MSS problem solved with netfilter kludge
Date: Sat, 27 Sep 2003 15:49:21 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309271547050.5131@xena.cft.ca.us>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

(This is crossposted to users@mj2.freeswan.org and
netfilter@lists.netfilter.org. If comments from one list seem relevant
to the other, I will relay.)

xena (192.168.1.100) is a laptop with Super FreeS/WAN.
fafnir (192.168.1.1 <-> 4.60.x.x) is a Linksys residential gateway to DSL.
	It does NAT on all traffic.  Several department users have this
	product; all their home machines are 192.168.1.100.
harlech (128.97.4.250) is a bastion host with Super FreeS/WAN.
	It has only one interface; it is not the department's router.
simba (128.97.4.125) is an internal machine.  No connections whatsover may
	be originated to it from the global internet, due to firewall rules
	on the department's router.

This is Super FreeS/WAN 1.99_0.9.23-20 from SuSE Linux 8.2 with kernel
patches k_deflt-2.4.20-100.  The latter is significant because the
original kernel didn't get the needed patch for NAT traversal, but now
NAT-T works with the updated kernel.  The X.509 patch is also included
in SuSE-distributed FreeS/WAN.  In my setup, remote hosts (xena) use X.509
certificates for both authorization and keying on Harlech.

Harlech NATs all outgoing traffic from ipsec tunnels, so replies will
come back to it rather than returning to the source in clear text, or
being dropped in the case of 192.168.1.100.
    iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $myipaddr

It all works great if the packets are short.  But the following test fails:
    ssh simba "dd if=/dev/zero count=1 bs=1360" > /dev/null
(bs <= 1356 works.)  Similarly as described in the iptables manpage under
TCPMSS, terminal sessions work until you "cat" a lot of output, web pages
hang, etc.

A posting on netfilter indicated that the ICMP frag-needed packet to the
internal host (Simba in my case) included the un-NATted source address
(192.168.1.100), so Simba could not match it up with the connection (it
thinks from 128.97.4.250) that needs its MSS reduced.  I believe someone
said he was working on this bug.

Arbitrarily large blocksizes are possible when the test is xena <-> harlech
(local destination) rather than xena <-> simba (routed and NATted twice).
So in some cases the MSS can be choked successfully.

Following recommendations in the man page, reiterated on the netfilter
list, I tried this command:
    iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
    -j TCPMSS --clamp-mss-to-pmtu
I tried the rule in various chains with these results:
    filter FORWARD	Ineffective
    mangle FORWARD	Ineffective, bs=1356 works, 1360 doesn't.
    mangle PREROUTING	iptables: Invalid argument
    mangle POSTROUTING	Ineffective, bs=1356 works, 1360 doesn't.

Someone else mentioned that PMTU information is not always available.
Is it that the IPSec module doesn't provide it while others do?  Or is
it a bug or design crock in iptables?

Then I tried:
    iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
    -j TCPMSS --set-mss 1404
It worked; arbitrarily large blocksizes were possible, testing
xena <-> simba.  The MSS = 1404 was the maximum; 1408 reverted to the
failing behavior.  Of course if anyone fiddles with path MTUs, it's going
to break.  --clamp-mss-to-pmtu should be used whenever possible.

Does anyone have suggestions for making the MSS a little better behaved
with FreeS/WAN?  (Besides doing IPSec on the building router, which is a
big Cisco box shared among several departments :-)

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

