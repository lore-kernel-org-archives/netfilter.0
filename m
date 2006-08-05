From: Chris Miller <asterisk@scratchspace.com>
Subject: Can't access select websites
Date: Sat, 05 Aug 2006 01:59:42 -0700
Message-ID: <44D45DFE.4030307@scratchspace.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


I've got a WRT54GL with three interfaces. The router connects via PPPoE 
(ppp0) and has a public routed /29 to one interface (br0), and a private 
/24 with NAT on another interface (vlan2). The rules are not 
particularly fancy and access from/to the internal networks is fine. I 
can access any website from either LAN just fine, except I can't access 
microsoft.com and fscrater.com. Both these sites have one thing in 
common, they filter ping. Tcpdump from a *nix box on the public LAN 
shows that the initial http connection is being acknowledged by the 
remote web server, but subsequent incoming packets seem to be dropped. 
I've enabled logging in my FW script and remote syslog on the router, 
but logging seems to go into the bit bucket. I suspect that may be due 
to the way iptables is compiled for the WRT. 
 
I have an identical setup in another location that does not experience 
this problem, the difference is the /29 is routed via a /30 on the WAN 
side, PPPoE is not used. AT&T appears to be preserving IP space by using 
PPPoE and an internal 192.x.x.x address on the DSLAM. So PPPoE seems to 
be related to the problem. 
 
I've verified that NAT is not happening on the public interface, so it's 
not a NAT issue. Without the ability to see what's happening via 
logging, I'm lost. Has anyone seen this behavior before? Any suggestions 
on where logging might be going?

Chris

