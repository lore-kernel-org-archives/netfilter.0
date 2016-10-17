From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd2 / segfault in ulogd_raw2packet_BASE.c with kernel 4.8.1
Date: Mon, 17 Oct 2016 21:34:06 +0200
Message-ID: <20161017193406.GB24375@salvia>
References: <de2d542d-c543-d254-beae-990a988effcf@undermydesk.org>
 <1476055564.5747.1.camel@regit.org>
 <d5fd9a36-7aaf-9a49-c359-4636c5535e53@undermydesk.org>
 <a3d68560-143a-7907-0440-6d6ce9698bdb@undermydesk.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a3d68560-143a-7907-0440-6d6ce9698bdb@undermydesk.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: frank <frank@undermydesk.org>
Cc: netfilter@vger.kernel.org

On Tue, Oct 11, 2016 at 09:16:22AM +0200, frank wrote:
> Hi Eric,
> dear list,
> 
> just a short update on this issue...
> 
> There's someone over at LKML with the same issue and there
> seems to be fix for this on the way.
> Your earlier assumption about the kernel changes were true:
> 
> http://www.gossamer-threads.com/lists/linux/kernel/2538445?do=post_view_threaded

I have just applied the fix for 4.8, will take a little while to
propagate this to -stable.

Meanwhile, oneliner patch to fix it is here:

http://patchwork.ozlabs.org/patch/680773/
