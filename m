From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: two negatived parameters
Date: Tue, 07 Sep 2004 10:43:30 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413DD722.2010307@pbl.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Akolinare@gmx.net wrote:
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

If src is host1 and dst is host3 you get:

not true and not false = false and true = false

So the rule does not match, and packets from host1 to host3 will not be 
affected by it.  Also, note that "not host1 and not host2" is logically 
the same thing as "not (host1 or host2)".  Which was probably the reason 
why it looked like an or to you.  Double negations in human languages do 
not always translate well into negations in computer languages.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

