From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Combined Internal/External DNAT question
Date: Mon, 16 May 2005 13:35:34 -0500
Message-ID: <4288E7F6.3030700@riverviewtech.net>
References: <42889941.5060507@griffous.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42889941.5060507@griffous.net>
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

> My problem still remains however Grant. I would have to create another DNAT rule to match each existing *real* public DNAT rule that currently exists to DNAT traffic from the Internet.  Do you have any further ideas for me? Given that a packet can have both the src and dst IP address rewritten in it's one trip through iptables, it seems to me that it should be possible for two rewrites to happen at once. My thinking it perhaps breaking the nat table into several chains?  Any other suggestions, you've been most helpful so far.


The only other thing that comes to mind would be to use iphash (IP)sets of destination IP addresses on your original DNAT rules.  This would cause your iptables rule to match based on the destination of your external IP of your firewall OR your external IP of your DSL modem (/router) and DNAT the traffic to the real server on your 2nd internal subnet.  Here is an example rule for what you would need:

iptables -t nat -A PREROUTING -m set --set My_IP_Set dst -j DNAT --to-destination <relevant.internal.server>:<tcpservice>

To support this rule you would need to do the following (likely before you issued the above rule):

ipset -N My_IP_Set iphash
ipset -A My_IP_Set 10.0.0.1
ipset -A My_IP_Set <Public IP>

As stated before this should cause your one iptables rule to match packets that are destined to any IP in the ip set "My_IP_Set" and DNAT said packets to the <relevant.internal.server>:<tcpservice>.  I know that this is not the multiple passes through the iptables chains like you were asking for, but I think it will provide a solution comparable  to the result that you were after.  Rather than have a rule that will alter traffic such that it will be caught by another rule and then altered again why not have a rule that will catch either type of traffic.



Grant. . . .

