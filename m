From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd inverted NAT address, endianness issue?
Date: Mon, 3 May 2021 22:56:49 +0200
Message-ID: <20210503205649.GA13044@salvia>
References: <CAOAu+xL2ao_r-FK=XYFR3PORvE-E7zLOx0giRGjbB1E5cpUhrw@mail.gmail.com>
 <20210420091853.GA23774@salvia>
 <CAOAu+x+mHmTPi0Q9dND7WOaCNTBP0_VvJqTv=8eZOcthv-Lwhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOAu+x+mHmTPi0Q9dND7WOaCNTBP0_VvJqTv=8eZOcthv-Lwhg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tao Gong <gongtao0607@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Wed, Apr 21, 2021 at 09:28:42AM -0700, Tao Gong wrote:
> Hi Pablo,
> 
> Thanks. Just had it tested (x64 -> mips and x64 -> x64). Failover is
> working now. Awesome!

For the record, patch is applied:

http://git.netfilter.org/conntrack-tools/commit/?id=b55717d46ae3b7c3769192a66e565bc7c2d833a1
