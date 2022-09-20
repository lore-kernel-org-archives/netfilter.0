From: Florian Westphal <fw@strlen.de>
Subject: Re: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 18:24:01 +0200
Message-ID: <20220920162401.GE30575@breakpoint.cc>
References: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
 <20220920151952.GD30575@breakpoint.cc>
 <37c01892-11ea-4347-7eae-871d46fecf41@riosoft.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <37c01892-11ea-4347-7eae-871d46fecf41@riosoft.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Bruno de Paula Larini <bruno.larini@riosoft.com.br> wrote:
> Em 20/09/2022 12:19, Florian Westphal escreveu:
> > Thats all? No backtrace?
> 
> Sorry, I wasn't sure on what would be helpful.
> This was on syslog. If it isn't enough, please instruct me on how to output
> what you need.
> 
> I also forgot to include that this is a Xen guest (xen 4.7.4, kernel 4.4.0).
> Guest drivers:
> xe-guest-utilities-xenstore-7.4.0-1.x86_64
> xe-guest-utilities-7.4.0-1.x86_64
> Sep 20 11:05:05 fw1-test kernel: ? _raw_spin_lock_bh+0x30/0x40
> Sep 20 11:05:05 fw1-test kernel: ? nf_ct_seqadj_set+0x61/0xe0 [nf_conntrack]

Thanks, this is enough info.  I'll work on a fix.
