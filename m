From: Askar <askarali@gmail.com>
Subject: how to remove rules
Date: Tue, 23 Nov 2004 14:29:35 +0500
Message-ID: <a0f69e5041123012925d5cfaf@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi 
I have trying to remove the extra rules from my routing tables,
however with no luck
Also I want to know these duplicate entries have an effect on packets
going routed?
I have this overwhelming rules lists from my predessor who added the
"ip rule add fwmark" entries in firewall script, and on each run of
firewall script its creates an extra entry in routing table.
Now I want to get rid of  an extras "from all fwmark 0x2 lookup
squid.out" leaving only one that what's I needs.


here is the output of "ip rule ls"

0:      from all lookup local
32742:  from all fwmark 0x2 lookup squid.out
32743:  from all fwmark 0x2 lookup squid.out
32744:  from all fwmark 0x2 lookup squid.out
32745:  from all fwmark 0x2 lookup squid.out
32746:  from all fwmark 0x2 lookup squid.out
32747:  from all fwmark 0x2 lookup squid.out
32748:  from all fwmark 0x2 lookup squid.out
32749:  from all fwmark 0x2 lookup squid.out
32750:  from all fwmark 0x2 lookup squid.out
32751:  from all fwmark 0x2 lookup squid.out
32752:  from all fwmark 0x2 lookup squid.out
32753:  from all fwmark 0x2 lookup squid.out
32754:  from all fwmark 0x2 lookup squid.out
32755:  from all fwmark 0x2 lookup squid.out
32756:  from all fwmark 0x2 lookup squid.out
32757:  from all fwmark 0x2 lookup squid.out
32758:  from all fwmark 0x2 lookup squid.out
32759:  from all fwmark 0x2 lookup squid.out
32760:  from all fwmark 0x2 lookup squid.out
32761:  from all fwmark 0x2 lookup squid.out
32762:  from all fwmark 0x2 lookup squid.out
32763:  from all fwmark 0x2 lookup squid.out
32764:  from all fwmark 0x2 lookup squid.out
32765:  from all fwmark 0x2 lookup squid.out
32766:  from all lookup main
32767:  from all lookup 253

regards

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

