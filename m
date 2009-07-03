From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip problem
Date: Fri, 03 Jul 2009 11:45:51 +0200
Message-ID: <4A4DD34F.4050906@trash.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net> <20090701205616.GE9285@Redstar.dorchain.net> <20090702081741.GH9285@Redstar.dorchain.net> <20090702090440.GI9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090702090440.GI9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Joerg Dorchain wrote:
> On Thu, Jul 02, 2009 at 10:17:41AM +0200, Joerg Dorchain wrote:
>> I works, but somewhat ugly.
>> # conntrack -E expect
>> 180 proto=17 src=0.0.0.0 dst=85.93.219.122 sport=0 dport=11080
>> 180 proto=17 src=0.0.0.0 dst=85.93.219.122 sport=0 dport=11081
>> 180 proto=17 src=0.0.0.0 dst=212.88.133.153 sport=0 dport=7076
>> 180 proto=17 src=0.0.0.0 dst=212.88.133.153 sport=0 dport=7077
>>
>> All the places where the ip is 0.0.0.0 or the port is 0 could be
>> filled more specifically. The necessary information is available
>> in the same SIP/SDP flow as the used information. Besides the two
>> RTP stream are unidirectional, so I'd like to have something like
>> this:
>> 180 proto=17 src=212.88.133.153 dst=85.93.219.122 sport=7076 dport=11080
>> 180 proto=17 src=85.93.219.122 dst=212.88.133.153 sport=11081 dport=7077
> 
> Sorry for replying to often to myself, I have another addendum:
> In case of asterisk reinvites in order to have to RTP stream
> moved away from the machine, there are still connections expected
> despite that these invites are explicitly meant to stop rtp
> streams to the local machine.

Could you send a dump? Last time I tried asterisk reinvites, it didn't
work at all because asterisk made some (don't recall the details)
invalid assumptions.
