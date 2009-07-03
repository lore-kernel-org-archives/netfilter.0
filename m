From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip problem
Date: Fri, 03 Jul 2009 11:44:51 +0200
Message-ID: <4A4DD313.4000107@trash.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net> <20090701205616.GE9285@Redstar.dorchain.net> <20090702081741.GH9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090702081741.GH9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Joerg Dorchain wrote:
> On Wed, Jul 01, 2009 at 10:56:16PM +0200, Joerg Dorchain wrote:
>> Aehm, 85.93.219.122 is the address from the SDP payload for the
>> RTP stream as attached. 85.93.219.114 is is address of where the SIP REGISTER
>> is sent to.
>>
>> I will try again with only sip_direct_media=0.
> 
> I works, but somewhat ugly.
> # conntrack -E expect
> 180 proto=17 src=0.0.0.0 dst=85.93.219.122 sport=0 dport=11080
> 180 proto=17 src=0.0.0.0 dst=85.93.219.122 sport=0 dport=11081
> 180 proto=17 src=0.0.0.0 dst=212.88.133.153 sport=0 dport=7076
> 180 proto=17 src=0.0.0.0 dst=212.88.133.153 sport=0 dport=7077
> 
> All the places where the ip is 0.0.0.0 or the port is 0 could be
> filled more specifically. The necessary information is available
> in the same SIP/SDP flow as the used information. Besides the two
> RTP stream are unidirectional, so I'd like to have something like
> this:
> 180 proto=17 src=212.88.133.153 dst=85.93.219.122 sport=7076 dport=11080
> 180 proto=17 src=85.93.219.122 dst=212.88.133.153 sport=11081 dport=7077

It depends on the setup. The remote address is not available at
the time the expectation is created when using early media. As
soon as the SDP payload is sent, one way audio might arrive,
even from multiple source addresses in parallel. So this can't
be made more specific for the generic case. When not using early
media, we could wait for the SDP payload of the remote side, but
I don't think many clients are not doing this.
