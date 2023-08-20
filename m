From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 20 Aug 2023 23:41:43 +0200
Message-ID: <ZOKIl6qWCdLCTPPT@calendula>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
> Hi all,
> 
> I have an old program (ipqbdb) which filters IPv4 packets using
> libnetfilter_queue.  I want to extend it to also filter IPv6, now that at
> last I can use some of those addresses.
> 
> The program obtains a handle by nfq_open(), and then (after unbind) binds by
> nfq_bind_pf(h, AF_INET).  Afterwards it creates the configured number of
> queues and filters the packets it finds there.
> 
> There is a big DEPRECATED in the documentation, and the generated doc for
> nfq_bind_pf() parameters says "This call is obsolete, Linux kernels from 3.8
> onwards ignore it" (which is obviously false).
> https://netfilter.org/projects/libnetfilter_queue/doxygen/
> 
> So, the first question: Can I keep using these functions?  What is the alternative?

The alternative is the libmnl-based API which is the way to go for new
applications.

> Second question: Is there a "mixed mode" parameter, besides PF_INET and
> PF_INET6, that allows to capture both types?  In that case, can a queue
> receive either packet?

Using the 'inet' family in nftables, it should be possible to send
both IPv4 and IPv6 packets to one single queue in userspace.
