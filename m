From: Eric Leblond <eric@inl.fr>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Wed, 23 Jul 2008 13:19:58 +0200
Message-ID: <20080723111957.GB2250@khasse.inl.fr>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com> <20080723094512.GA2250@khasse.inl.fr> <488701CD.1040509@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <488701CD.1040509@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

Hello,

On Wednesday, 2008 July 23 at 12:02:53 +0200, Pablo Neira Ayuso wrote:
> Eric Leblond wrote:
> > Hello,
> > 
> > On Tuesday, 2008 July 22 at 17:02:14 -0700, Curtis Wyatt wrote:
> >> I am using ip_queue.  I understand that is depreciated.
> >>
> >> I want to intercept a packet, alter it (change payload and source ip
> >> address and destination ip address) and then do an NF_ACCEPT on it, to
> >> have it continue on its way to another machine.  However it never
> >> shows up at that other machine.  Is there anyway to do this without
> >> doing an NF_DROP and then sending a new packet through?
> > problem. The only thing for now is too look at snort-inline or NuFW code
> > to see how to use the library.
> 
> I remember that you have mentioned some libnetfilter_queue's
> documentation during the RMLL? I'm willing to include it if that helps
> users. Where is it?

I think this is the doc you are talking about:
http://lists.netfilter.org/pipermail/netfilter-devel/2006-February/023286.html

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
