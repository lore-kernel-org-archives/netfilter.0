From: informatica@excelente.com.pt
Subject: ACCEPT behaviour (from a newbie...)
Date: Fri, 17 Feb 2006 16:59:03 +0000
Message-ID: <MDAEMON470047200602171659.AA5903088@excelente.com.pt>
Reply-To: informatica@excelente.com.pt
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi to all,

Being a Windows user, I am just starting to grasp the universe of firewalling with netfilter. As I understood so far, when a packet meets a rule, the target instruction is executed. If it happens to be ACCEPT, as in this example, then no more rules are inspected and the packet is let through.

Assuming this is correct, then on the following example (taken from an IPCop config file) an ipsec packet would never reach custom chain IPSECRED (lines 9 and 10) because line 3 is automatically ACCEPTing all ipsec packets entering the INPUT chain.

Is this correct, or need I do some more home work?


01.        # accept all traffic from ipsec interfaces
02.        /sbin/ipccept all traffic from ipsec interfaces
03.        /sbin/iptables -A INPUT   -i ipsec+ -j ACCEPT
04.        /sbin/iptables -A FORWARD -i ipsec+ -j ACCEPT

05.        # allow DHCP on BLUE to be turned on/off
06.        /sbin/iptables -N DHCPBLUEINPUT
07.        /sbin/iptables -A INPUT -j DHCPBLUEINPUT

08.        # IPSec chains
09.        /sbin/iptables -N IPSECRED
10.        /sbin/iptables -A INPUT -j IPSECRED
11.        /sbin/iptables -N IPSECBLUE
12.        /sbin/iptables -A INPUT -j IPSECBLUE


tks
cf


