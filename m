From: Mark-Walter@t-online.de
Subject: iptables rule chain question
Date: Thu, 9 Feb 2006 14:17:39 +0100
Message-ID: <20060209131739.GA4441@server.homelinux.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've have this in my firewall rule script and I'am unsure about DROP:

#
# allowed chain
#

$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

The first should allow tcp connections with syn,rst,ack and he should
accept it.

The second one describes already established connections with ACCEPT.

But what happens in the third rule ?

Does it mean iptables DROP every TCP connection in the case syn,rst,ack is not set and the connection is not established.

Does iptables storing all connection's with connection tracking to know
which connection is established,related ? (2. rule)

Sorry, for these questions but I think it's fast answer for you.


-- 
Best Regards,

Mark

