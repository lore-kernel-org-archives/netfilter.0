From: "John H. Spicer" <jhs@edg.com>
Subject: Problem using fwmark -- how to mark packets from local host?
Date: Wed, 03 Mar 2004 17:09:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404657A2.7080301@edg.com>
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

I'm trying to use fwmark to mark packets so that they can be routed to a 
particular interface.

I'm doing this:

iptables -t mangle -A PREROUTING -d ! $inet -j MARK --set-mark 0x0a -p tcp --dpo
rt 25
ip route add default via $IPADDR2 table TSMTP
ip rule add pref 1 fwmark 0x0a table TSMTP

I'm also using NAT and masquarading.

The rules above work for packets received from other systems that are going 
through NAT, but it doesn't work for packets from the local system.  Those 
packets are still going out through the normal default route of the system.

Is there a way to mark packets originating on the local system?

Thanks,

John Spicer

