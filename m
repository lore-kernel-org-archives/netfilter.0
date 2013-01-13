From: Eric Leblond <eric@regit.org>
Subject: Re: libnetfilter_queue issues
Date: Sun, 13 Jan 2013 23:46:56 +0100
Message-ID: <1358117216.4629.2.camel@tiger2>
References: <50F15A68.3060806@o2.pl>
	 <CAOZ=-EUzjDe8YtZYZA_BjZt_cmP=ivcjUa6R5EecCmNZEEh0Rg@mail.gmail.com>
	 <1358017441.18655.1.camel@tiger2> <20130113112940.GA15424@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130113112940.GA15424@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: credzba@gmail.com, dorian33@o2.pl, netfilter@vger.kernel.org

Hello,

On Sun, 2013-01-13 at 12:29 +0100, Pablo Neira Ayuso wrote:
> On Sat, Jan 12, 2013 at 08:04:01PM +0100, Eric Leblond wrote:
> > Hello,
> > 
> > On Sat, 2013-01-12 at 07:23 -0600, Felix wrote:
> > > excellent question !
> > > I too am interested in this.
> > > 
> > > Another similar, related question is do packets that are not filtered
> > > wait on a verdict for a filtered packet?
> > > Again, if not, it means we can change packet order?
> > > If so,it means we can degrade system performance unrelated to our
> > > filtered packets.
> > 
> > I've just wrote an article describing libnetfilter_queue and NFQUEUE. It
> > has been written to answer your questions:
> > https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/
> 
> It would be good to integrate part of this information to the doxygen
> library documentation:
> 
> http://www.netfilter.org/projects/libnetfilter_queue/
> 
> Or simply add reference to Eric's page in the main page of the doxygen.

To follow a small patchset trying to improve libnetfilter_queue doxygen
documentation.

BR,
-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

