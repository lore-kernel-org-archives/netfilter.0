From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables 0.9.2 | flow table] dynamic (soft) NETDEV
Date: Fri, 27 Mar 2020 20:06:05 +0100
Message-ID: <20200327190605.o5e6dugeklur2kbx@salvia>
References: <574afe87-ced9-8c5b-9dd4-4619e85f9774@gmx.net>
 <af7c651a-1f45-205b-d503-365452955443@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af7c651a-1f45-205b-d503-365452955443@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Mar 26, 2020 at 12:09:20PM +0000, ѽ҉ᶬḳ℠ wrote:
> On 21/03/2020 09:53, ѽ҉ᶬḳ℠ wrote:
> > With some (soft) NETDEV being available only after NFT been invoked at
> > boot time, e.g. bridge or pppoe, NFT would fail to load at boot time
> > if such NETDEV being stipulated, e.g.
> > 
> > flowtable f { hook ingress priority 0; devices = { pppoe-wan, lan0,
> > lan1, lan2, lan3, lan4, br-lan }; }
> > 
> > Is there a syntax that would allow to add/alter such dynamic dev to an
> > initial stanza, e.g.
> > 
> > flowtable f { hook ingress priority 0; devices = { lan0, lan1, lan2,
> > lan3, lan4 }; }
> > 
> > and then adding pppoe-* and/or br-* to it? Or is there any other good
> > practice, e.g. are dynamic sets are working with flowtable device =?
> 
> Other NETDEV that may not be available at the NFT start during boot
> time, or that are dynamically enabled/disabled, are WLan and VPN (tap,
> tun, wg). Whilst this can be worked around with hotplug scripts it does
> not help with altering the > devices = {  } < portion in a dynamic fashion.
> 
> The replace command does not seem suitable as it requires the query for
> the rule handle.

I agree than better support for dynamic devices is good to have in
place.
