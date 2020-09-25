From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] possible to utilise sets across different tables?
Date: Fri, 25 Sep 2020 14:11:13 +0200
Message-ID: <20200925121113.GA25890@salvia>
References: <9454a56c-0efb-2f47-e1b4-7fb24991a0d9@gmx.net>
 <f1e6e7f6-d9e2-cc93-1a64-acc5599b25a9@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1e6e7f6-d9e2-cc93-1a64-acc5599b25a9@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Sep 25, 2020 at 09:52:00AM +0000, ѽ҉ᶬḳ℠ wrote:
> On 23/09/2020 13:43, ѽ҉ᶬḳ℠ wrote:
> > Would it be possible to generate a set in 'table inet' based on 'saddr 
> > ct state invalid drop' and then utilise the same set in a 'table netdev
> > rule', for offending saddr getting blocked early?
> > 
> 
> Tried some variations but none worked out and thus it seems deployment of
> sets across families is not supported. Though I reckon it would be a
> beneficial feature:
> 
> * mitigate repetition of same sets that are applicable for different
> families
> * gather set data in one family, e.g offenders' saddr from inet, and deploy
> such set in a rule in a different family, e.g. in netdev for blocking such
> offenders early on

This is feasible. I have an incomplete patchset to enable this, I'll
try to scratch some time to finish this.
