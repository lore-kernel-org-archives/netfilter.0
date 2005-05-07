From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables efficiency, order of execution
Date: Fri, 06 May 2005 22:53:25 -0500
Message-ID: <427C3BB5.8050601@riverviewtech.net>
References: <427B8CC5.6070003@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427B8CC5.6070003@danbbs.dk>
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
To: netfilter <netfilter@lists.netfilter.org>

Mogens Valentin wrote:
> Sometimes questions pop up on various network lists about execution
> order of rules.
> Such questions are usually dealt with per example, but I sometimes
> ponder about general guidelines, or try to logically derive my own.

Gnerally I like to put the rule(s) that will match the highest percentage of the time towards the top followed by the next highest percent matched rules on down the list to the least likely to match at the botom.  The idea behind this is to have the most common packets match rules at the top (start) of the list so they have to traverse as few rules as possible.

If you are going to have a LARGE block of IPs that you are going to match on, namely each IP in a class (C)


256 / 4
 64 / 4
 16 / 4
  4 / 4

