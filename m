From: Andrew Dunstan <andrew@dunslane.net>
Subject: SNAT multiple address allocation, connection tracking
Date: Mon, 14 Jun 2004 17:57:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40CE1F42.4030705@dunslane.net>
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

I have this problem.

eth0 is internal network, eth1 is external network
eth1 has a large set of additional virtual addresses

all connections go from internal to external

Third party app does this in fairly quick succession: telnet session, 
close, ftp (non-passive), close, pop3 session, close.

The app needs each of these to get the same SNAT address (from the pool 
of virtual addresses) on the external interface, because at the other 
end some state is kept based on the IP address (crazy, I know, but true).

However, if another host uses the same address it in effect clobbers the 
previous state, so each host (within some shortish period) needs to get 
a different address from any other host.

My reading suggests that SNAT with a range does some sort of round robin 
or LRU on a per connection basis, rather than reusing an address that 
the same host recently used. Is this correct?

I can't nail the addresses up, because some will be DHCPd hosts from a 
larger pool than I have available.

Can someone please suggest a combination of modules and rules that will 
do what I need?

TIA

andrew



