From: Florian Westphal <fw@strlen.de>
Subject: Re: IPVS: conn_tab_bits param for ip_vs > 20 leads to default being
 set
Date: Thu, 9 Feb 2023 10:53:54 +0100
Message-ID: <20230209095354.GA20851@breakpoint.cc>
References: <CACXxYfxtsHLpvowG3g=7vkg4U2PmqTMnojtYYjXZGrnwFkF+Ag@mail.gmail.com>
 <CACXxYfxAAuBSpgZgq03AAT-1tzF-0zKGL4SsbU2k2qW7E7w7Hw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACXxYfxAAuBSpgZgq03AAT-1tzF-0zKGL4SsbU2k2qW7E7w7Hw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Abhijeet Rastogi <abhijeet.1989@gmail.com>
Cc: netfilter@vger.kernel.org

Abhijeet Rastogi <abhijeet.1989@gmail.com> wrote:
> Hi everyone,
> 
> I'll really appreciate some help, I felt this is the best forum to
> discuss this topic. If not, please suggest.
> 
> I understand that the Kconfig file also has 8-20 range, but why isn't
> that range set higher, let's say 31?

You could send a patch to increase the limit in both kconfig and the
check.

The 20 bit (1m entries) ceiling exists since the original merge of ipvs
in 2003, so likely this was just considered "big enough" back then.

