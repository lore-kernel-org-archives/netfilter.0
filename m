From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Thu, 3 Feb 2011 18:24:29 +0100
Message-ID: <20110203172429.GA8709@buero.cygnusnet.de>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de> <4D4AAD40.1060204@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D4AAD40.1060204@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Thu, Feb 03, 2011 at 02:27:28PM +0100, Pablo Neira Ayuso wrote:
> On 03/02/11 13:00, Helmut Grohne wrote:
> > On Tue, Jan 25, 2011 at 01:54:27PM +0100, Helmut Grohne wrote:
> >> libnetfilter-log src/libnetfilter_log.c:
> >> | /**
> >> |  * nflog_unbind_pf - unbind nflog handler from a protocol family
> >> |  * \param h Netfilter log handle obtained via call to nflog_open()
> >> |  * \param pf protocol family to unbind family from
> >> |  *
> >> |  * Unbinds the given nflog handle from processing packets belonging
> >> |  * to the given protocol family.
> >> |  */
> > 
> > This comment is indeed very misleading.
> 
> Let's fix it then :-)
...
> Please, would you send me a patch so others can benefit for this
> conclusion in the official documentation? I'd appreciate it.

I just touched the surface of what is going on here. It would certainly
be better if someone with more oversight would try to fill in this gap.

> There is other things that you can do to avoid ENOBUFS, it is documented
> in libnetfilter_queue but it also applies to libnetfilter_log:
> 
> http://www.netfilter.org/projects/libnetfilter_queue/doxygen/
> 
> See performance, the last two items do not apply to libnetfilter_log.
> Another patch for this would be great.

Thanks for the information. Again I'd need more understanding of the
matter before I can create a patch. (For instance I fail to see why
suppressing ENOBUFS would not help the performane.) The performance
issues on my project seem to have solved themselves in the mean time.

Helmut
