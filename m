From: Russell Handorf <rhandorf@closednetworks.com>
Subject: Question regarding packet src/dst rewriting
Date: Fri, 20 Aug 2004 12:32:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4126279F.7040109@closednetworks.com>
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

Hello all,

I have a linux router over here with 4 ethernet nics running on 2.6.4 
kernel. The respective IP's are as follows:
eth0 : peering point to ISP
eth1: public routable IP block (/23)
eth2 : 172.16.0.1
eth3 : 192.168.0.1

The weird behavior I am having is that whenever a packet from the 
Internet comes in interface eth0, and gets forwarded to a server on 
eth1, the server which resides on the eth1 side of the network sees the 
source IP as coming from the router and not the real host on the 
Internet. Vice versa applies as well (a node behind eth1 sends a packet 
out to, say, google.com. Google.com sees the data as coming from the 
router, and not the node which is behind eth1).

I dont understand why the packet headers are being re-written. I also 
dont understand if this is a specific problem with iptables, or the 
linux kernel itself.

eth2 and eth3 are masquerading, but eth1 is not.

Any help would be greatly appreciated.

Thanks again,

Russ


