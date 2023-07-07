From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Matching on protocols inside IPv6 IPSec AH (legacy vs nft)
Date: Fri, 7 Jul 2023 09:28:45 +0200
Message-ID: <ZKe+rYq5aeEThuRN@calendula>
References: <CAPEBPyMNe5dPTC9Dwp888M5RR-2ThC7ZtuaQPxNG+5VqbJinsQ@mail.gmail.com>
 <ZJTEiNy6v0QR+ovT@calendula>
 <CAPEBPyMWBzsROxN5Em7dGCpG2TXncC+Gu_1BD81vV2HysLo2Ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPEBPyMWBzsROxN5Em7dGCpG2TXncC+Gu_1BD81vV2HysLo2Ow@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Tomasiak <jtomasiak@arista.com>
Cc: netfilter@vger.kernel.org

On Mon, Jun 26, 2023 at 02:06:47PM +0200, Jacek Tomasiak wrote:
> > > My main concern is that in the nft version the AH rule matches one of the ICMP
> > > packets even though the ICMP rule is higher up on the list.
> > >
> > > I tried to debug this and it seems to be related to this change:
> > > https://github.com/torvalds/linux/commit/568af6de058cb2b0c5b98d98ffcf37cdc6bc38a7
> > > IIUC, this "stop ipv6_find_hdr on AH" is not a regression but intended behavior.
> > >
> > > Now the question: is there some way to define rules which will match
> > > the same way
> > > as it works in iptables-legacy? That is, look at the inner protocol
> > > and not stop on AH?
> >
> > IIRC behaviour between iptables-legacy and ip6tables-legacy with
> > regards to AH is inconsistent, because ip6tables-legacy -p matches on
> > the inner header encapsulated by AH, but iptables-legacy matches on AH
> > with -p.
> 
> OK, I understand that this was an inconsistency and it was fixed with
> above change
> in the kernel but does this mean that there is currently no way to
> check the inner
> protocol? Or maybe there is some other match or extension which could be used
> to get the "old iptables style" behaviour?

There is the nft_inner infrastructure that allows to match at the
inner protocol after AH.
