From: Geert van der Ploeg <netfilter@geert.triple-it.nl>
Subject: iptables-restore: commit not at end of table
Date: Wed, 09 Mar 2005 12:43:02 +0100
Message-ID: <422EE146.1070808@geert.triple-it.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

After updating a firewall from iptables 1.2.7a to a later version, my
ruleset doesn't work anymore.
It fails on COMMIT-lines that are not at the end of a table definition.
I used commits for cutting my (sometimes quite large) rulesets into
smaller parts and make sure I always keep a working configuration, even
if some rules fail.

For example:
 - define management-access definitions (allow SSH from
management-stations, etc)
 - COMMIT
 - define other rules that get changed a lot and thus have a larger
chance of containing errors.


Having looked at the source-code, I discovered that it is caused by some
extra checks on 'in_table' (in iptables-restore.c), which got inserted
between 1.2.7a and 1.2.8. The changelog doesn't say why.


My questions:

1. Does anybody know what was the reason for the extra checks?

2. Is the effect of not-working-commits-in-middle-of-table-definition
intended or not? If so, what was the intention?

2. Did anybody use those commits like I did? And if so, how do you
accomplish the same without this feature?

3. Is this the right list to ask these questions or should they be asked
on the developer-list?


Thanks!

Geert van der Ploeg

