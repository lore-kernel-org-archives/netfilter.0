From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Dropping Malicious Packets in -t mangle
Date: 31 Jul 2003 02:02:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059631347.4280.27.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

We are building a fairly sophisticated, GPL'd, network security system
that combines Policy Enforcement Points - gateways running iptables,
FreeS/WAN, etc - with a GUI Security Policy Manager that automatically
compiles and distributes iptables rules, FreeS/WAN VPN connection
definitions and configurations for a few other security tools based upon
business process oriented policies. (http://iscs.sourceforge.net)

We, of course, want to screen out malicious packets on the PEPs and have
proposed something that we have not seen in any examples.  That leads us
to believe that we have done something foolish rather than something of
extraordinary creativity! So, we thought we'd ask the list.

Our idea was to filter malicious packets - spoofs, ping floods,
suspicious tcp flags - in the mangle table.  We were concerned that we
wanted to intercept these packets before they hit the connection
tracking table for DNAT'd devices in case someone initiated a valid
session and then tried to turn it foul.  We also noticed that the mangle
table was the first all packets hit.

So we jumped various, possibly malicious, packets from -t mangle
PREROUTING to -t mangle ProtectionMangle where they are examined for
possible malice.  Are we being foolish or is this the best place to weed
out possible problems? Thanks - John Sullivan
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


