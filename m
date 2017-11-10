From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Fwd: How to enable Xen VM traffic using nft]
Date: Fri, 10 Nov 2017 08:09:31 +0100
Message-ID: <20171110070931.GB6027@salvia>
References: <1509137741.13003.0.camel@cefetmg.br>
 <1510179317.5175.1.camel@cefetmg.br>
 <CAOkSjBhTxijtCRh7PK=Pw_RYwPOnbY2ZeeQP7DhEoRoWYWEtRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBhTxijtCRh7PK=Pw_RYwPOnbY2ZeeQP7DhEoRoWYWEtRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Leonardo Bruno <leonardo@cefetmg.br>, netfilter <netfilter@vger.kernel.org>

On Thu, Nov 09, 2017 at 12:51:44PM +0100, Arturo Borrero Gonzalez wrote:
> On 8 November 2017 at 23:15, Leonardo Bruno <leonardo@cefetmg.br> wrote:
> > Hi guys.
> >
> > Any clue on this subject?
> >
> > Hope someone can help.
> >
> 
> Try using nftables in the bridge family.
> 
> I see we lack some information here so I added a new wiki page:
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families

There is no physdev support for nftables. Florian has been looking
into native conntrack replacement for bridge that should help us
obsolete the br_netfilter module.
