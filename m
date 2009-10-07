From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Multiple interfaces with the same IP address
Date: Wed, 07 Oct 2009 14:15:22 -0700
Message-ID: <4ACD04EA.5040303@hp.com>
References: <4ACCEDDA.9020508@spacex.net> <4ACCF3F0.5040703@hp.com> <4ACCFF8F.1010000@spacex.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACCFF8F.1010000@spacex.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Wilson-Lindberg <gregw@spacex.net>
Cc: Greg Wilson-Lindberg <Greg.Wilson-Lindberg@spacex.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Greg Wilson-Lindberg wrote:
> 
> Rick Jones wrote:
> ...
> 
>>
>> Is there a specific reason you cannot further subnet the 10.0.0.0/8 
>> network for your HDLC channels and eschew the NAT?  Then at least 
>> ignoring the issue of "routing" broadcast datagrams (these are IP 
>> broadcasts and not simply ethernet broadcasts right?) reaching-out and 
>> touching the HDLC devices from the WAN would seem to be more 
>> straightforward.
>>
>> rick jones
>> visions of many static routing table entries floating through his head
> 
> 
> The 10.0.0.0/8 network is an existing network that has 100's of 
> computers on it. 

Not knowing (perhaps I just missed it) "the rest of the story" (a la Paul 
Harvey), simply 100's of computers doesn't sound like all that much for a 
renumbering - should it come to that.

Are the IPs of the "HDLC machines" similarly constrained?

> We are planning on  using some 10.x.0.0/16 addresses 
> to NETMAP to the 172.16.0.0/16 addresses in some limited situations, but 
> this doesn't solve the problem of routing to the correct HDLC channel to 
> get to the final destination.

I have not fully parsed the manpage for the ip command, but it does have tidbits 
which suggest being able to specify interfaces by name when manipulating routing 
tables.  If that is correct you should be able to add specific host routes 
pointing-out specific interface names if you are indeed forced to put assign the 
same IP address to each of the HCLC interfaces on the "gateway."

Earlier you mentioned broadcasts that needed to reach through and touch the HDLC 
systems - did you actually mean IP multicast?

rick jones
