From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 17:43:39 +0200
Message-ID: <20200928154339.GA2605@salvia>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
 <20200923083042.GB10267@salvia>
 <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
 <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
 <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 01:10:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> On 28/09/2020 14:24, Pablo Neira Ayuso wrote:
> > On Mon, Sep 28, 2020 at 12:08:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> > > In the below example it does not print any logs and since that stanza is
> > > right prior drop I reckon that since the log printing does not happen the
> > > frame dropping does neither.
> > > 
> > > table inet filter {
> > [...]
> > >          chain wan_pr {
> > >                  ct state { new } update @glv4 { ip saddr limit rate over
> > > 15/day burst 3 packets } log prefix "glv4 DROP: " flags all drop
> > >          }
> > > }
> > ct state new is restricting to match only on the first packet of the
> > connection.
> 
> Right, it should be then rather something with ct count, like:
> 
> ct state new update @glv4 { ip saddr ct count over 15 } log flags all prefix
> "glv4 DROP: " drop
> 
> but that produces:
> 
> Error: Could not process rule: Not supported

What would you like to achieve in first place?

This thread is starting to diverge from the original question.
