From: Jason Opperisano <opie@817west.com>
Subject: Re: two negatived parameters
Date: Tue, 07 Sep 2004 12:36:20 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094574980.1890.40.camel@wolfpack.ljm.dom>
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

not to beat this thread to death...but if your original intention was to
ACCEPT any traffic not from host1 OR any traffic not to host2, try
explicitly dropping the specific traffic, rather than trying to
implicitly allow traffic as a negation:

  iptables -A FORWARD -s host1 -j DROP
  iptables -A FORWARD -d host2 -j DROP
  iptables -A FORWARD -j ACCEPT

or--if your intention was to jump to a custom chain where the source is
not host1 nor is the destination host2:

  iptables -A FORWARD -s ! host1 -j custom
    iptables -A custom -d host2 -j RETURN
    # neither the source is host1, 
    # nor the dest is host2 at this point in the chain
    iptables -A custom [ ... ]

hope this helps you get towards your goal...

-j

-- 
Jason Opperisano <opie@817west.com>


