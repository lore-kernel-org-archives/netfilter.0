From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: icmp-type question
Date: Wed, 27 Jun 2007 14:16:44 -0500
Message-ID: <4682B79C.3040304@riverviewtech.net>
References: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>	<35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
	<468299E4.3020906@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <468299E4.3020906@mailinator.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/27/2007 12:09 PM, Mike Wright wrote:
> My thought is that if no timestamp requests are accepted no timestamp 
> replies would be generated.  In case that's an invalid assumption you 
> could also filter the output chain.

*nod*

> Depending on what else you are doing you may need matching rules in your 
> forward chains, too.

This is why a (sub)chain to do the filtering is nice.  Jump to the same 
(sub)chain from both filter:INPUT and filter:FORWARD and return out of 
it with any traffic that passes back to the rule after the one that 
jumped in to it.  Just have your (sub)chain DROP the packet if it does 
match and allow all non-matching traffic to fall off the end and RETURN. 
  Seeing as how it is a (sub)chain, I don't think you can set a policy 
of RETURN and you would have to create a rule to RETURN, but this is a 
non-issue.



Grant. . . .

