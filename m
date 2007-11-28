From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Reg Stateful firewall
Date: Wed, 28 Nov 2007 10:21:48 -0600
Message-ID: <474D959C.3090702@riverviewtech.net>
References: <333233.67984.qm@web1009.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <333233.67984.qm@web1009.biz.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 09:49, Shyam Prasad wrote:
> But would it not be efficient if the firewall automatically allows 
> such packets which were validated in INPUT.  that would save me lot 
> of rules that might otherwise be necessary.

This might be easier, but I don't know about more efficient.  A single 
"... -m state --state ESTABLISHED,RELATED ..." rule in the OUTPUT chain 
should take care of things.

Or if you want to be a bit different about it, you could probably put 
your rule(s) in a new chain and jump to said chain from both INPUT and 
OUTPUT.  This way, you only have to have your rules one time.

> some linux based firewalls(not netfilter) do this automatically since 
> they already know the state.

Curious, what firewalls do this?



Grant. . . .
