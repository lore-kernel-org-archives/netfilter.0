From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 20 Aug 2023 23:39:55 +0200
Message-ID: <ZOKIK0P6voN9dBS3@calendula>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOAe3rziTGTkTyfi@slk15.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZOAe3rziTGTkTyfi@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Aug 19, 2023 at 11:46:06AM +1000, Duncan Roe wrote:
> On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
[...]
> There are 2 separate APIs in libnetfilter_queue, examplified by
> utils/nfqnl_test.c (your program) and examples/nf-queue.c (newer, has functions
> for packet mangling).
> 
> DEPRECATED was an unfortunate choice of label for the older API: the functions
> are not deprecated but the underlying library that they currently use is
> deprecated. In answer to your questions:
> 
> 1a Can I keep using these functions?: Certainly.

No. For new applications, the new libmnl-based API is the way to go.

Old API depends on libnfnetlink and it will go away sooner or later if
there is not a way to make it work behind the scenes with libmnl.

We are steadly removing all users of libnfnetlink in favour of libmnl.
