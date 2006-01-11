From: Curtis Hawthorne <mrperson@mrperson.org>
Subject: Bandwidth tracking per user
Date: Wed, 11 Jan 2006 13:56:42 -0600
Message-ID: <43C562FA.8010705@mrperson.org>
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

Hi all,

I'm trying to put together a solution for tracking the bandwidth usage
of each local user on a shared server.  At first, I thought I could just
create a rule for each user with the --uid-owner match on all traffic
and look at the counter for that rule.  But, I found out it will only
work on LOCAL_OUT or POST_ROUTING.  So, the solution I came up with was
to use the --uid-owner to set a mark on the connection on an outgoing
packet and then use that mark to track the incoming traffic.  Here's an
example of what I was doing to track root's incoming and outgoing traffic:

iptables -t filter -A OUTPUT -m owner --uid-owner 0 -j CONNMARK --set-mark 0

iptables -A INPUT -m connmark --mark 0

This seems like a strange way to do things to me.  Is there a better way
to track total bandwidth usage for local users, or will this way work?

Thanks!

Curtis H.


