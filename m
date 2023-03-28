From: Florian Westphal <fw@strlen.de>
Subject: Re: Creating a map programmatically using the C library libnftnl
Date: Tue, 28 Mar 2023 17:09:41 +0200
Message-ID: <20230328150941.GB25361@breakpoint.cc>
References: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

Kiernan George <kbg98@vt.edu> wrote:
> Hello,
> 
> I'm not sure how to respond to my post from earlier today, so I'm just
> creating a new one.
> 
> I do not need help figuring out how to use the nft command line tool.
> I need to figure out how to use the libnftnl C library to create a map
> of the following type and insert elements into it:
> 
> type ipv4_addr . inet_service : ipv4_addr
> 
> I see an example for creating a set in nft-set-test.c, but I'm not
> sure how to translate this into creating a map and adding elements to
> it. Is there documentation somewhere? Could you write an example for
> this use case?

Whats missing in examples/nft-map-add.c ?
