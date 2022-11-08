From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Tue, 8 Nov 2022 10:13:33 +0100
Message-ID: <Y2odvQkzNbBz6lAu@salvia>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc>
 <tkbuqu$1187$1@ciao.gmane.io>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <tkbuqu$1187$1@ciao.gmane.io>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Pilcher <arequipeno@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Nov 07, 2022 at 03:54:37PM -0600, Ian Pilcher wrote:
> On 11/3/22 18:12, Florian Westphal wrote:
> > Ian Pilcher <arequipeno@gmail.com> wrote:
> > > Assume that I want to match a particular host (pppp:pppp:pppp:ppc8::1)
> > > in a rule.  With ip6tables, I can match this address with this
> > > expression:
> > > 
> > >    0:0:0:c8::1/::ff:ffff:ffff:ffff:ffff
> > 
> > ip6tables-translate suggests:
> > 
> > nft add rule ip6 filter INPUT 'ip6 saddr & ::ff:ffff:ffff:ffff:ffff == ::c8:0:0:0:1'
> > 
> 
> Interesting.  I see that too.
> 
> I missed it, because ip6tables-translate-restore suggests:
> 
>  nft add rule ip6 filter INPUT ip6 saddr
> ::c8:0:0:0:1/::ff:ffff:ffff:ffff:ffff counter accept
> 
> Which gives a syntax error.

iptables version? 1.8.8 here provides a correct translation.
