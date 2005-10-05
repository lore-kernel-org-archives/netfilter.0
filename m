From: Per Jessen <per@computer.org>
Subject: load distribution - sanity check
Date: Wed, 05 Oct 2005 09:41:36 +0200
Message-ID: <dhvvmh$9o4$1@saturn.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

I'm trying to setup a cluster of name servers, and want to distribute
the load across the cluster such that lookups of e.g. 'www.xxx.com'
will always go to the same node - to be able to benefit from caching. 

I figured I'd be able to inspect the DNS queries and reroute the queries
based on a hash-value of the name being looked up.  This sounds like a
job for iptables - am I on the right track?


cheers
/Per Jessen


