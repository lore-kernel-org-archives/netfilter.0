From: Ben Greear <greearb@candelatech.com>
Subject: Masquerade based on skb->mark ?
Date: Tue, 24 Apr 2007 20:06:52 -0700
Message-ID: <462EC5CC.4080300@candelatech.com>
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

I'm now trying to masquerade packets that have been marked
a certain way.  I'm using these commands:

# I'm not sure this is doing the right thing, but it is not giving errors.
iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001

# This appears to work as planned.
iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001

I added a u32 'mark' field to the conn-track tuple, and I now get
different conn-tracking objects for the same source/dest but with
different 'mark'.  However, the ct->status bit does not have the
IPS_SRC_NAT flag set.

I think I need to figure out what code creates the initial conn-track
and make sure it is setting the status bits correctly based on the
skb->mark, but I am not sure where this code exists.

Any ideas on where to start looking?  I've been trying to follow
the code path in the netfilter/nat logic, but it's proving
slow going!

Thanks,
Ben

PS.  If anyone does this sort of work for hire, please contact me off-list.

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


