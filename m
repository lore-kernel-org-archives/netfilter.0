From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Rout looping through local host.
Date: Tue, 21 Aug 2007 11:14:48 -0500
Message-ID: <46CB0F78.3060107@riverviewtech.net>
Reply-To: gtaylor+reply@riverviewtech.net
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

After many many hours of frustration and failures I'm almost to the 
point that I don't think this is even currently possible with Linux.

With out going in to too much detail, I am effectively wanting to do the 
following.

I want to be able to take traffic in from a local LAN on eth0 and route 
it out eth1 to a default gateway with a static IP.  I want said default 
gateway with the static IP to be assigned to eth2.  I then want to route 
and masquerade traffic that came in eth2 out eth3.

(Enter ASCII art)

--------------+
   Context 0   |
        +------+      +-----------+
    +---+ eth0 |------+ Local LAN |
    |   +------+      +-----------+
    |          |
    |   +------+
    +---+ eth1 +---+
        +------+   |
               |   |
==============|===|===
   Context 1   |   |
        +------+   |
    +---+ eth2 +---+
    |   +------+
    |          |
    |   +------+      +----------+
    +---+ eth3 +------+ Internet |
        +------+      +----------+
               |
--------------+

I want the ""router in context 0 to effectively (for the sake of 
discussion) do basic static NAT routing for the local LAN.  This router 
will have two static IP addresses, LAN facing and upstream router facing.

I want the ""router in context 1 to effectively (for the sake of 
discussion) do basic MASQUERADing for the equipment behind it.  This 
router will have one static IP facing the LAN and one dynamic IP facing 
its upstream provider.

I have followed Julian Anastasov's directions 
(http://www.ssi.bg/~ja/send-to-self.txt) and applied his Send-to-Self 
patch (http://www.ssi.bg/~ja/send-to-self-2.6.22-1.diff) to a stock 
2.6.22 kernel and I am able to ping the IP address assigned to eth2 from 
eth1 with out any problems.  However I don't think Julian's patch covers 
routing traffic through (not terminating at or originating locally) the 
cross over cable.

I have also done some experimenting on my own to see if this is even 
remotely possible to do by altering the routing tables in the kernel. 
The closest that I can come is to remove all references to eth2 from the 
kernel's 'local' routing table so that the kernel is not aware that the 
IP address in question is local to the system thus making it think that 
it needs to send the traffic out eth1 which is on the same subnet as the 
target IP assigned to eth2.

I can tell from packet counters that this does indeed send the traffic 
like it is suppose to do.  However when the packet arrives in eth2 the 
kernel does not know what to do with it as it does not see the IP in 
question as being bound to any thing any where and drops the packet.

To this end I have re-added the entries from the 'local' routing table 
to a new routing table 'local_new' and set up an 'ip rule' that 
indicates that any traffic coming in the eth2 interface should use this 
'local_new' routing table.  However I have no way to know if this is 
doing any good or not as I can not progress further.  I have also tried 
with out success to use the CONNMARKing in conjunction with (packet) 
MARKing to use an additional 'ip rule' to specify that any traffic that 
would be leaving the system should also use the 'local_new' routing 
table.  However all of this is to no avail.

If I stick more with Julian's 'Send-to-Self' document and just alter 
source IPs for different destinations (per the end of said document) I 
can get the traffic to flow through the system, but not as I want it to. 
  To the best of my knowledge traffic will come in eth0 and go directly 
out eth3 while somehow in the return path passing through eth2, but 
never touching eth1.

If I can not get this to work the way that I need / want it to I will 
have to fall back to UML routers to fulfill the role of the context 1 
""router.  So any help that any one could provide would be _*GREATLY*_ 
appreciated.



Thanks in advance for any and all help that any one can provide,

Grant. . . .


