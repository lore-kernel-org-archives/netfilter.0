From: Jason Opperisano <opie@817west.com>
Subject: Re: msn and yahoo messenger voice chat
Date: Tue, 12 Apr 2005 08:39:40 -0400
Message-ID: <20050412123940.GA26073@bender.817west.com>
References: <1113309566.425bc17e6a46f@webmail.yanbulink.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113309566.425bc17e6a46f@webmail.yanbulink.net>
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

On Tue, Apr 12, 2005 at 03:39:26PM +0300, Wennie V. Lagmay wrote:
> 
> Thank you Jason, I just want to confirm is it to be writen
> 
> like this alone:
> iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> xxx.xxx.85.113-xxx.xxx.85.115

yes--SAME can completely replace your SNAT rule, if you so desire.

> or the original SNAT plus SAME like this :
> IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j SNAT --to-source
> xxx.xxx.85.113-xxx.xxx.85.115

that rule isn't completely correct, as it has no "-t nat" in it.

> iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> xxx.xxx.85.113-xxx.xxx.85.115

if you're asking if you should have a SNAT rule followed by a SAME rule
that are identical except for the target, then no--the SAME rule will
never be matched in that scenario.

if you want to combine SAME and SNAT--put the SAME rule first and have
it match only on the specific ports used by the application in question
that cannot handle src IP changes; and the SNAT rule second to catch the
rest of the general traffic.

HTH...

-j

--
"Chris: Where do you think you go when you die?
 Southern boy: I learned from church that if you're good you go to
 heaven but if you're bad, you go to a place where the dead believe
 they're still living and they pray for death but death won't come.
 Chris: UPN?"
        --Family Guy

