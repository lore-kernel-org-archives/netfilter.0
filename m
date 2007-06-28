From: "Ross Cameron" <ross.cameron@linuxpro.co.za>
Subject: Re: icmp-type question
Date: Thu, 28 Jun 2007 09:48:16 +0200
Message-ID: <35f70db10706280048o72c1bc8u5b20a5cceddf3fd8@mail.gmail.com>
References: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>
	<35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
	<468299E4.3020906@mailinator.com> <4682B79C.3040304@riverviewtech.net>
Reply-To: ross.cameron@linuxpro.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=ZvXXgiz+efghCQ+rm9O2/dDBNxi4eUQ1EPATlK7x/p53R6cAuoUp1+wyJocyO2an0nRykNg+9yMcZn8cVqrfbP1qhsWwNqdXcgTiwGJ3H5z+AvE8ool0tip1oMiqtezgeR6+F5scO0BG84hxP9U3OgyFzdIto1TCy66waaK6FcY=
In-Reply-To: <4682B79C.3040304@riverviewtech.net>
Content-Disposition: inline
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 27/06/07, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 6/27/2007 12:09 PM, Mike Wright wrote:
> > Depending on what else you are doing you may need matching rules in your
> > forward chains, too.
>
> This is why a (sub)chain to do the filtering is nice.  Jump to the same
> (sub)chain from both filter:INPUT and filter:FORWARD and return out of
> it with any traffic that passes back to the rule after the one that
> jumped in to it.  Just have your (sub)chain DROP the packet if it does
> match and allow all non-matching traffic to fall off the end and RETURN.
>   Seeing as how it is a (sub)chain, I don't think you can set a policy
> of RETURN and you would have to create a rule to RETURN, but this is a
> non-issue.

How do you create sub-chains?
I've heard the term before but never found an example that uses it.

Many thanks for all the advice guys.

