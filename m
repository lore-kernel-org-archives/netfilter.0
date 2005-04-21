From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: IPSet Log and drop.
Date: Thu, 21 Apr 2005 13:24:14 -0400
Message-ID: <4267E1BE.9010303@kitchenandassociates.com>
Reply-To: rcarlson@kitchenandassociates.com
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

Sorry if this is a dupe, the first one didn't seem 
to go through...

I'm currently using ipset to block some large
blocks of addresses.  It seems to be working well,
but a couple of rogue emails have gotten through.
  This is not my concern right now, rather I would
like to see what _is_ being caught and try to
establish a pattern/ratio.

I've found that with vanilla IPTables, to log and
block one sets up two rules, first the LOG
statement, then immediately following, the DROP
statement.  However since I am using a nethash in
IPSet, I wonder if this approach would work, or
whether scanning the hash twice to invoke each
operation would be counter to the reason for using
the IPset nethash.

I have created a nethash with my "undesirable"
address blocks, and then ran:
iptables -A testhash -m set --set testhash src -j DROP

Would it be counter-productive to have:
iptables -A testhash -m set --set testhash src -j LOG
iptables -A testhash -m set --set testhash src -j
DROP?


Thanks,

Rob



