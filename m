From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnfcontrack weirdness
Date: Mon, 02 Aug 2010 20:45:02 +0200
Message-ID: <4C57122E.8010108@netfilter.org>
References: <59381F8FA203F4555FD43BB0@Ximines.local> <1280772623.1349.3.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1280772623.1349.3.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org

On 02/08/10 20:10, Andrew Beverley wrote:
> The documentation is sparse, but there are some good examples in the
> utils folder of the source code. Also, api.c is well commented for each
> of the functions.

We should convert that documentation in the source code of api.c to
doxygen format. It shouldn't take more than one hour to get it done.
Then, we can put it on the website as we did for libnetfilter_log and
libnetfilter_queue.

If someone feels in the mood to do it, you can have a look at the other
libraries to see how we've done it.
