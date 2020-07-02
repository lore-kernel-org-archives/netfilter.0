From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables and connection tracking
Date: Thu, 2 Jul 2020 21:47:10 +0200
Message-ID: <20200702194710.GA14610@salvia>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc>
 <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc>
 <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc>
 <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
 <20200701224820.GA29407@breakpoint.cc>
 <CAChjPdRFPLkKcj3eDiFrpaL2VEoueJxWrx=kwixprHkNUqf-+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdRFPLkKcj3eDiFrpaL2VEoueJxWrx=kwixprHkNUqf-+Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?utf-8?Q?Gre=C5=A1ko?= <mgresko8@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

On Thu, Jul 02, 2020 at 09:33:41PM +0200, Marek Gre=C5=A1ko wrote:
> Great, thanks for explanation.
>=20
> Now I have two chains OUTPUT with priority filter. One in the table
> raw and second in the table filter (currently both of them with policy
> accept). Is that correct? What is the order of evaluation? The order
> it appears in config file? Should not one of the priorities be changed
> to (filter + 1) or the rules moved to the filter table?

Move them to the "filter" table, no need to define a new chain. Chains
are somewhat expensives: one of the good things about nftables is that
you can define the chains that you need.

Chains whose priority is filter (0) see packets with the conntrack
information. Anything from priority -200 onwards (INT_MAX) have access
to the conntrack information.

Priorities from INT_MIN to -199 see no conntrack information (what it
used to be the "raw" table semantics).

In nftables, tables have no specific semantics anymore, it's the chain
priority that specifies what semantics apply to your basechain.

Thanks.
