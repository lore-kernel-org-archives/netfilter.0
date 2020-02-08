From: Florian Westphal <fw@strlen.de>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Sat, 8 Feb 2020 23:15:22 +0100
Message-ID: <20200208221522.GD2991@breakpoint.cc>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
 <20200207101740.GC6466@breakpoint.cc>
 <89800836.90200.1581073253643@office.mailbox.org>
 <20200207110626.GD6466@breakpoint.cc>
 <6be894ad-b817-6c14-365c-21d068eaa261@mailbox.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6be894ad-b817-6c14-365c-21d068eaa261@mailbox.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darius <dram@mailbox.org>
Cc: Florian Westphal <fw@strlen.de>, =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

darius <dram@mailbox.org> wrote:
> I have checked link provided by you. This patch is already implemented
> on 4.14 kernel that runs on OpenWRT, but that does not help with the
> error. I still have fault.
> Any other ideas where to check? Just would be nice to find where is problem.

No.  If you know some C, edit net/netfilter/nf_tables.c, search for
nft_select_set_ops() and check which set type is picked.

ops needs to be "nft_set_rhash_type", thats the only one where
ops->update is non-NULL.
