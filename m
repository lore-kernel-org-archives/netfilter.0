From: Jeremy Jackson <jerj@coplanar.net>
Subject: broadcast packets DROPped, still received by dhcrelay
Date: Tue, 17 Feb 2004 16:22:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40328617.3070104@coplanar.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

(Please CC - I'm not subscribed)

I've searched the list archives, regarding broadcasts, DHCP, and raw 
sockets.  I still can't explain the following behaviour.

A Linux router running dhcrelay 3.x is configured to DROP incoming dhcp 
requests from an interface that are from 0.0.0.0/32 and to 
255.255.255.255.  The rule in the mange PREROUTING table matches, and a 
later rule in the mangle INPUT rule confirms that the dropped packet 
stops being processed. (1st conter increases, 2nd doesn't increase) 
However, the dhcrelay process still appears to receive the packet.

netstat -anp doesn't show any raw type sockets

udp     0     0 0.0.0.0:67       0.0.0.0:*        14127/dhcrelay3

  as can be seen on a similar machine running dhcpd:
udp     0     0 0.0.0.0:67       0.0.0.0:*        19850/dhcpd3
raw     0     0 0.0.0.0:1        0.0.0.0:*     7  19850/dhcpd3

how can the lone udp socket bypass netfilter like this?  Is there any 
way to filter this with iptables?

Thanks,

Jeremy Jackson


