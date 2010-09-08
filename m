From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: OpenVPN throttling problem
Date: Wed, 8 Sep 2010 12:18:29 -0400
Message-ID: <BAY145-ds90D651823B103C8EFCC28F3720@phx.gbl>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl> <1283857776.32608.39.camel@enterprise.ims-firmen.de> <BAY145-ds21DEA1A44DBD89BF0401BCF3710@phx.gbl> <1283871946.32608.212.camel@enterprise.ims-firmen.de> <BAY145-ds1243A907F1D466511E7978F3710@phx.gbl> <1283872818.32608.230.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283872818.32608.230.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

I have tried by adding these lines to the iptables script and restarted it:
-A POSTROUTING -o eth0 -p tcp -m tcp --tcp-flags SYN,RST SYN -j 
TCPMSS --set-mss 1460
-A POSTROUTING -o eth0 -p tcp -m tcp --tcp-flags SYN,RST SYN -j 
TCPMSS --clamp-mss-to-pmtu

However, the stuttering still occurs on the VPN server.
Some at the OpenVPN users list suggested that I could change the windows tcp 
stack?
"I was doing some testing with iperf, and found that changing the TCP
Window size can have a significant impact (~ 5-10x). Have you tried this?"

I think I have already done this but cannit see why that should make a 
massive difference. Not only that, but once you get into editing registry 
entried, it;s beyond the capabilities of most client users.

--------------------------------------------------
From: "Thomas Jacob" <jacob@internet24.de>
Sent: Tuesday, September 07, 2010 11:20 AM
To: "J Webster" <webster_jack@hotmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: OpenVPN throttling problem

> On Tue, 2010-09-07 at 11:12 -0400, J Webster wrote:
>> Would the clamping only be tcp specific?
>
> Correct, MSS (maximum segment size) is a TCP specific
> feature.
>
>> Could I add the same rule for the udp VPN service?
>> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j
>> CPMSS  --clamp-mss-to-pmtu
>
> Nope, see above. But for UDP this is not often
> a problem, as most standard protocols that use
> UDP have smaller packet sizes,
> unless of course your video streaming is done via UDP ;)
>
>> --------------------------------------------------
>> From: "Thomas Jacob" <jacob@internet24.de>
>> Sent: Tuesday, September 07, 2010 11:05 AM
>> To: "J Webster" <webster_jack@hotmail.com>
>> Cc: <netfilter@vger.kernel.org>
>> Subject: Re: OpenVPN throttling problem
>>
>> > On Tue, 2010-09-07 at 10:25 -0400, J Webster wrote:
>> >> If the path MTU were not 1500 then why would the proxy server work
>> >> without
>> >> video stuttering issues but the VPN have stuttering?
>> >
>> > Because OpenVPN seems to prevent the normal path MTU algorithms
>> > from working in some instances, so the dynamic MSS/MTU
>> > calculations cannot happen. Anyway, a proxy server
>> > doesn't forward TCP packets in the way OpenVPN does,
>> > it opens a new TCP connection and just relays the Web data stream,
>> > so it's really quite a different thing.
>> >
>> >> I would have thought most broadband connections were not limited in 
>> >> that
>> >> way?
>> >
>> > PPPoE DSL is, for instance.
>> >
>> >> I did try some MTU setting before of 1400, 1460, 1300 and the 
>> >> difference
>> >> was
>> >> minimal.
>> >
>> > It's not enough to just configure that in OpenVPN, all the other
>> > components (client NIC, gateway NICs, server NIC, intermediate router
>> > NICs) also have their own MTU (hence the path MTU discovering
>> > solution).
>> >
>> >> Not sure what else to try or how to troubleshoot. I suppose I could
>> >> follow
>> >> the traffic but not sure if it would help resolve the throttling 
>> >> issue?
>> >
>> > Have you tried MSS clamping yet?
>> >
>> > http://lartc.org/howto/lartc.cookbook.mtu-mss.html
>> >
>> >
>
>
> 
