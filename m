From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 14:50:07 +0200
Message-ID: <20201014125007.GA21520@salvia>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
 <20201014100402.GA19556@salvia>
 <alpine.DEB.2.23.453.2010141221380.6472@localhost>
 <alpine.DEB.2.21.2010141148070.28273@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010141148070.28273@piplus.local.jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Oct 14, 2020 at 12:02:08PM +0100, G.W. Haywood wrote:
> Hi there,
> 
> On Wed, 14 Oct 2020, Jozsef Kadlecsik wrote:
> > On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
> > 
> > > On Wed, Oct 14, 2020 at 04:16:40AM +0000, Ramsay, Lincoln wrote:
> > > > Hi,
> > > > 
> > > > I've just confirmed that I can't make a rule that matches ct status != dnat.
> > > 
> > > ct status == dnat and ct state != dnat checks for _exact_ matching.
> > > 
> > > Then:
> > > 
> > >         ct status dnat
> > > 
> > > based on the datatype, provides a shortcut for
> > > 
> > >         ct status and dnat == dnat
> > 
> > Sorry, but it looks like really strange. ...
> 
> +1

I think Jozsef got confused about _dnat_ specifically, not about the
way the expression is represented itself - he refers to _nat_, but
maybe he can clarify this.

As I explained, we can probably improve documentation on how the
bitwise datatype works for:

        ct status value

where ct status is a key whose base datatype is bitwise (flags).

You can check for the key datatype here:

# nft describe ct status
ct expression, datatype ct_status (conntrack status) (basetype bitmask, integer), 32 bits

pre-defined symbolic constants (in hexadecimal):
        expected                        0x00000001
        seen-reply                      0x00000002
        assured                         0x00000004
        confirmed                       0x00000008
        snat                            0x00000010
        dnat                            0x00000020
        dying                           0x00000200

You can also check for the instructions that nft generates:

# nft --debug=netlink add x y ct status dnat
ip
  [ ct load status => reg 1 ]
  [ bitwise reg 1 = (reg=1 & 0x00000020 ) ^ 0x00000000 ]
  [ cmp neq reg 1 0x00000000 ]

> On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
> 
> > For inverted matching, please use:
> > 
> >        ct status and dnat != dnat
> > 
> 
> If you will forgive me some pseudocode, I'd interpret that as
> 
> !(ct.status & dnat)
>
> and deduce
> 
> (1) that 'ct status' is some sort of atom and

We call it 'key', this is basically telling the core to fetch such
'key' and place it in a register, ie. place 'ct status' 32-bits field
in the conntrack entry into a register for matching.

> (2) _either_ that '!=' has a lower precedence than 'and' _or_ that we
> must always assume left-to-right evaluation of the expression.

The binary operation always takes precedence to the comparison.

> Would any of that be right?
> 
> After years of little more than occasionally looking at netfilter
> expressions, and despite having read the Wiki, the main things which
> still confuse me are what must be spelt out in full and what can be
> abbreviated, what will be associated with what, and where to put any
> (notional) parentheses when reading it.

Parens are optional, just in similar languages, some people like to
use them explicitly so they do not have to remember about operation
precedence, eg.

# nft -i
nft> add x y (ct status and dnat) == dnat

> I don't know how I would ever have come up with Pablo's version of the
> expression.  I find the syntax quite bewildering. Is there a way to
> write expressions for netfilter like my pseudocode, even if it's more
> verbose?  Even if the alternative were *much* more verbose, as long as
> it looked something like the other things that I've been writing for
> nearly fifty years I'd find it much easier to understand.

Maybe. I've been trying to convince my system administrator friends to
write programs in C, which is my language of preference, but they
still prefer command line tools and rule-based languages :-)

Please, if you have any proposal to express this in a more compact way
that makes sense into the expression language, we'll be glad to take
into consideration.

Thanks.
