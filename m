From: Florian Westphal <fw@strlen.de>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Fri, 7 Feb 2020 12:06:26 +0100
Message-ID: <20200207110626.GD6466@breakpoint.cc>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
 <20200207101740.GC6466@breakpoint.cc>
 <89800836.90200.1581073253643@office.mailbox.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <89800836.90200.1581073253643@office.mailbox.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darius <dram@mailbox.org>
Cc: Florian Westphal <fw@strlen.de>, =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Darius <dram@mailbox.org> wrote:
> Ok, I'll keep using 'meter' keywork. Sets are working just perfectly, all sets instructions works as well.
> 
> But do you know if it is only 4.14 kernel affected? Is there any bug report and patch available for this issue for kernel 4.14?

No idea.  I suspect its this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=acab713177377d9e0889c46bac7ff0cfb9a90c4d
