From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Why "No buffer space available"?
Date: Thu, 31 Dec 2009 12:31:09 +0100
Message-ID: <4B3C8B7D.8010202@netfilter.org>
References: <cc73a9220912281846h6a337b76ud7d9d1f61371f21e@mail.gmail.com>	 <cc73a9220912281849qf25a81evdb6082197d037917@mail.gmail.com>	 <4B3B4330.4050304@netfilter.org> <c29e3bea0912301743k7f7bda48o17ce78d4521a7585@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c29e3bea0912301743k7f7bda48o17ce78d4521a7585@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Medialy <medialy@gmail.com>
Cc: netfilter@vger.kernel.org

Medialy wrote:
> Problem solved. Thanks.
> BTW, sometimes the program stops at function nfct_close() and never return!

I don't have an explanation for that, but it should not happen.

> On Wed, Dec 30, 2009 at 8:10 PM, Pablo Neira Ayuso <pablo@netfilter.org 
> <mailto:pablo@netfilter.org>> wrote:
> 
>     Medialy wrote:
> 
>         Hi,
>         I have written a program to log the nat behavior. the program works
>         well when traffic is low. But when the traffic reaches 1Gb, program
>         always error.
>         According to the previous discussions about this problem, I even set
>         the recv buffer size to 50MB and the error still exists.
> 
> 
>     Increasing the buffer size would not solve the problem, that will
>     only delay the ENOBUFS error. There are several reasons why you may
>     hit ENOBUFS:
> 
>     a) your program is too slow to handle the Netlink messages that you
>     receive from the kernel at a given rate. This is easier to trigger
>     if the handling that you perform on every message takes too long.
>     b) the queue size is too small, but this does not seem to be your case.
> 
>     ENOBUFS basically means that the kernel has to drop Netlink messages
>     because your user-space program cannot back-off.
> 
>  
> Medialy:
> Reason: system was overloaded due to the storage capability.  The 
> program (2 threads) was set to use last CPU.  When the traffic was 
> heavy,  most of the computing power of last CPU was occupied by the 
> thread which wrote Netlink messages to the stroage.

Good analysis. It is a good idea to put the thread that digest the 
Netlink message in a spare CPU. That reduces the chances to hit ENOBUFS.

I forgot to say but reducing the nice() value also help to avoid ENOBUFS.
