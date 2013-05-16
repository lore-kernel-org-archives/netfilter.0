From: arr <arunaa.n23@wipro.com>
Subject: To block multicast traffic to one of the two VLAN interfaces
Date: Thu, 16 May 2013 04:50:44 +0000 (UTC)
Message-ID: <loom.20130516T064448-541@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am using WRT54GL V1.1 wireless router.

I need to multicast two different data items between two PC's using two VLAN
ID's (eth0.2 and eth0.3).


PC-1                         PC-2
eth0.2                       eth0.2
eth0.3                       eth0.3

Each PC has two VLAN IDs.

The problem is if I send a data from  PC-1(eth0.2) to multicast MAC address,
which PC-2(eth0.2),only should receive.

But PC-2(eth0.3)also receives it.

I need to block the mulicast traffic to the VLANID (here eth0.3) or
interface which does not need it.
Is it possible to enable the router to block the traffic?


Please help me to find a solution.

Thank you.


