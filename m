From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] flowtable - number of devices
 limited (7)?
Date: Thu, 19 Mar 2020 12:33:26 +0100
Message-ID: <20200319113326.vfmsaqjtoxrus2d3@salvia>
References: <dd0815e7-2cae-afa9-0c54-240687c75c06@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dd0815e7-2cae-afa9-0c54-240687c75c06@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Mar 18, 2020 at 12:37:28PM +0000, ѽ҉ᶬḳ℠ wrote:
> When exceeding the number of devices > 7 NFT prints:
> 
> Illegal instruction
> 
> This does not print the error:
> 
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan3, lan4, br-mgt, br-guest }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan3, br-mgt, br-guest, br-mgt }; }
> 
> But this prints the error:
> 
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan, br-mgt }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest, br-lan }; }
> flowtable ft             { hook ingress priority 0; devices = {
> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt, br-guest }; }

Linux kernel >= 5.5 removes this cap, from there on the maximum number
of devices is 256.
