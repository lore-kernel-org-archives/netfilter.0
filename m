From: Jason Opperisano <opie@817west.com>
Subject: Re: two negatived parameters
Date: Mon, 06 Sep 2004 16:16:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094501760.1745.26.camel@wolfpack.ljm.dom>
References: <7421.1094459312@www2.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7421.1094459312@www2.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-06 at 04:28, Akolinare@gmx.net wrote:
> Hi,
> 
> I have a little question with two negatived parameters in one rule.
> 
> I create a rule, which should only match if source and destination are not
> the given. I think that it is easy and try the following rule:
> 
> iptables -A FORWARD -s ! host1 -d ! host2 -j ACCEPT
> 
> But with this rule pakets from host1 to host3 (or from host2 to host3) were
> not affected. It seems like the logical combination is OR and not AND unlike
> the not negatived rule.
> I think that the rule is logical right. Is it a little bug or have I
> misunderstood something?
> 
> I used the version 1.2.11 with kernel 2.4.26.
> 
>   Markus

a rule matches only when all the parameters are true.  a packet from
host1 does not match your example rule (it explicitly says "-s !
host1"), and this is how it should work.  consider the non-negative
example:

  -A FORWARD -s host1 -d host2 -j ACCEPT

would you propose that a packet from host1 to host3 should match that
rule?  i don't think so...

in your example rule, as soon as the source is host1 or the destination
is host2--the rule no longer matches.

-j

-- 
Jason Opperisano <opie@817west.com>


