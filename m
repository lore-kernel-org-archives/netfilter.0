From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Subject: Re: tc question about ingress bandwidth splitting
Date: Mon, 23 Mar 2020 12:15:35 -0600
Message-ID: <C2DA68B1-304C-40F1-B98C-31EFCCCE16CB@redfish-solutions.com>
References: <1D33C8C0-0638-4566-A85F-80B19CD532BA@redfish-solutions.com>
 <8ce39670-f41d-4053-b424-bfbfe23c0329@swifty.hu>
 <20200323093647.GA4706@alphanet.ch>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200323093647.GA4706@alphanet.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: =?utf-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@swifty.hu>, netfilter@vger.kernel.org


> On Mar 23, 2020, at 3:36 AM, Marc SCHAEFER <schaefer@alphanet.ch> wrote:
> 
> On Mon, Mar 23, 2020 at 07:47:11AM +0100, Gáspár Lajos wrote:
>> Just a tip: AFAIK, you can only limit your sending bandwith... Everything
>> what you already received is already on your device... :)
> 
> Right, however in case you do not have control on the sending
> device, you can slow down or loose TCP ACKs to slow down
> the opposite direction TCP traffic.


Exactly.  That’s my desire.

The sender calibrates based on 4 observed end-to-end path properties:

1. min path MTU, i.e. the smallest of all per-hop path MTU’s (likely doesn’t come into play here);
2. end-to-end delay, i.e. the summation of all per-hop delays, which we can artificially increase (shape) on the final internal hop to affect sender pacing;
3. end-to-end bandwidth, again the minimum bandwidth for the slowest hop along the path, which we can also artificially increase on the final internal hop to affect sender pacing;
4. end-to-end loss, the product of the reliability of all per-hop lossiness (hopefully we won’t be increasing lossiness, with the last hop having a reliability of 1.0, assuming that delay provides enough back pressure that we don’t need to actually drop any packets);

So the intention is to use (2) and (3) to apply back-pressure to the sender to influence his congestion avoidance.

Hopefully that makes things a little more clear!

So, back to my main question… what do the tc/htb commands look like to configure a tree that’s spread out across multiple (well, two in this case) interfaces?  Is that even possible?

I guess I could do all of the shaping on the “wan” interface, including on ingress… and just use the destination subnet (post NATting, obviously) on ingress, and based on the source subnet or “indev” on egress.

Thanks,

-Philip

