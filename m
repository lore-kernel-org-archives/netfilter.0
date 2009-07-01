From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip problem
Date: Wed, 01 Jul 2009 17:05:49 +0200
Message-ID: <4A4B7B4D.5090900@trash.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090701144321.GB9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Joerg Dorchain wrote:
> On Wed, Jul 01, 2009 at 02:03:40PM +0200, Patrick McHardy wrote:
>> Depending on how your SIP provider works, you might need to set the
>> sip_direct_signalling option to zero (in case signalling connections
>> can arrive from different addresses than the one registered with),
>> additionally you might need to set the sip_direct_media option to
>> 0 in case the RTP streams arrive from different addresses than the
>> signalling endpoint.
> 
> I tried this. Actually, it makes things worse. Now Asterisk
> complains: 
> [Jul  1 16:17:46] WARNING[20516]: chan_sip.c:1787 __sip_xmit:
> sip_xmit of 0x86f8de0 (len 384) to 217.10.79.9:5060 returned -1:
> Operation not permitted
> 
> (Trying to register with sipgate.de; registration in parallel
> with tel.lu seems to work)

sipgate needs sip_direct_media=0 since the RTP streams originate from
a seperate cluster.

Did you load the NAT module before the conntrack module?

> nf_conntrack_sip without options on a trial incoming call however gives:
> 
> # conntrack -E expect
> 180 proto=17 src=85.93.219.114 dst=212.88.133.153 sport=0 dport=7070
> 180 proto=17 src=85.93.219.114 dst=212.88.133.153 sport=0 dport=7071

Besides the direct_media option, I assume you're accepting EXPECTED
and RELATED packets?
