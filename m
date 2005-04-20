From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: matchlimit
Date: Wed, 20 Apr 2005 17:39:53 -0500
Message-ID: <4266DA39.8090907@riverviewtech.net>
References: <4266383E.5000002@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4266383E.5000002@eccotours.dyndns.org>
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
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: iptables <netfilter@lists.netfilter.org>

> What would be the recommended the rule for matchlimit FROM a specfic
> ipaddess.

iptables -t filter -A INPUT -s $Source_IP_of_attack -d $Your_IP -m limit ! --limit 5/minute --limit-burst 5 -j DROP

I think you will want the "!" in there as you want to drop any packets that are over the limit.  You will need to reference the man page and play with this for a while.

One think to keep in mind is that this will only limit attacks coming from $Source_IP_of_attack and this may never happen again.  Thus I don't know how practice this rule is.  But this is my answer to your question.



Grant. . . .

