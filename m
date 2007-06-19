From: David Ford <david@blue-labs.org>
Subject: ipt_recent failure
Date: Mon, 18 Jun 2007 20:36:09 -0400
Message-ID: <467724F9.2030904@blue-labs.org>
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

http://pastebin.ca/575409

I can't for the life of me get -m recent to function.  I upgrade my 
kernel from 2.6.19 to 2.6.21-gentoo-r3 and recompiled iptables to match.

I am using this same (slightly more detailed of course) rule on several 
other machines and it works fine everywhere else.

I have ipt_recent.ko loaded just fine along with everything else.  All 
other rules are working just fine.

I have /proc/net/ipt_recent/ which is empty and it is listed in 
/proc/net/ip_tables_matches.

Can someone enlighten me with this please?  Details of code traces are 
in the pastebin and I will be happy to provide additional details if needed.

Thank you,
David


