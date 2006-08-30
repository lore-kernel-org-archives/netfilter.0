From: Daniel Musketa <Daniel@musketa.de>
Subject: [MASQUERADING] iptables keeps sending from old IP after ppp0's IP
	has changed
Date: Wed, 30 Aug 2006 14:07:55 +0200
Message-ID: <200608301407.55481.Daniel@musketa.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello list,

I'm using iptables v1.2.11 on Debian Sarge kernel 2.6.8-3-k7.

This router does masquerading for my NAT clients. One of them is an Asterisk 
server communicating over UDP port 5060 (SIP) with external SIP provider. 

Every night the router's ppp0 goes down and after about a minute up again with 
a new IP. But iptables keeps on sending the NATted UDP packets _from_ the old 
IP address. `iptables -F` and reloading the rules doesn't help. The only 
workaround is to stop asterisk on the NAT client for about 2 minutes. 

I found out that there are still entrys in /proc/net/ip_conntrack containing 
yestrerday's external IP address.

Why isn't this table deleted when ppp0 goes down?

How can I force iptables to use ppp0's real IP address as sender IP in 
outgoing packets?


Thanks
Daniel

