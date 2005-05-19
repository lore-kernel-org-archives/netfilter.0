From: Jonathan Wheeler <griffous@griffous.net>
Subject: Combined Internal/External DNAT question
Date: Thu, 19 May 2005 22:53:32 +1200
Message-ID: <428C702C.6090502@griffous.net>
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
To: netfilter@lists.netfilter.org

The only other thing that comes to mind would be to use iphash (IP)sets of destination IP addresses on your original DNAT rules.  This would cause your iptables rule to match based on the destination of your external IP of your firewall OR your external IP of your DSL modem (/router) and DNAT the traffic to the real server on your 2nd internal subnet.  Here is an example rule for what you would need:

iptables -t nat -A PREROUTING -m set --set My_IP_Set dst -j DNAT --to-destination <relevant.internal.server>:<tcpservice>

To support this rule you would need to do the following (likely before you issued the above rule):

ipset -N My_IP_Set iphash
ipset -A My_IP_Set 10.0.0.1
ipset -A My_IP_Set <Public IP>

As stated before this should cause your one iptables rule to match packets that are destined to any IP in the ip set "My_IP_Set" and DNAT said packets to the <relevant.internal.server>:<tcpservice>.  I know that this is not the multiple passes through the iptables chains like you were asking for, but I think it will provide a solution comparable  to the result that you were after.  Rather than have a rule that will alter traffic such that it will be caught by another rule and then altered again why not have a rule that will catch either type of traffic.

Grant. . . .



Thanks for the reply Grant, 

Sorry for not getting back to you earlier. You're quite right, this should work nicely but I'm not so keen on running the non-default modules at the moment.
For simply getting my machine working for the testing that I need to be doing, a simply iptables -t nat -A OUTPUT is able to fix the problem for me, though
of course any other clients still have the problem.

Once I have all the rest of the network running I'll come back to using the set module.

Thanks again,
Jonathan.


