From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 27 Aug 2023 22:49:49 +0200
Message-ID: <ZOu27b8BAqB5Q1aj@calendula>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
 <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula>
 <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
 <ZOsKgctjEQWSARet@slk15.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZOsKgctjEQWSARet@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Aug 27, 2023 at 06:34:09PM +1000, Duncan Roe wrote:
> On Tue, Aug 22, 2023 at 08:09:53PM +0200, Alessandro Vesely wrote:
> > On Mon 21/Aug/2023 21:10:35 +0200 Pablo Neira Ayuso wrote:
> > > On Mon, Aug 21, 2023 at 07:18:46PM +0200, Alessandro Vesely wrote:
> > > > On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
> > > > > On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
> > > > > > [...]
> > It seems a buffer can contain several packets.  Is that related with the
> > queue maxlen?
> >
> man 7 netlink will tell you that netlink messages may be batched. This is
> straightforward to observe in a libnetfilter_log program under gdb.
> 
> However libnetfilter_queue programs never get batched netlink messages. So the
> callback isn't strictly necessary but it would mean extra code to special-case
> libnetfilter_queue (among all the other netfilter libraries) so it's been left
> there.

The "several packets" in this case refers to Linux GRO/GSO.
