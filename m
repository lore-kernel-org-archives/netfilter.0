From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: OpenVPN throttling problem
Date: Tue, 7 Sep 2010 10:25:21 -0400
Message-ID: <BAY145-ds21DEA1A44DBD89BF0401BCF3710@phx.gbl>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl> <1283857776.32608.39.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283857776.32608.39.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

If the path MTU were not 1500 then why would the proxy server work without 
video stuttering issues but the VPN have stuttering?
I would have thought most broadband connections were not limited in that 
way?
I did try some MTU setting before of 1400, 1460, 1300 and the difference was 
minimal.
Not sure what else to try or how to troubleshoot. I suppose I could follow 
the traffic but not sure if it would help resolve the throttling issue?

--------------------------------------------------
From: "Thomas Jacob" <jacob@internet24.de>
Sent: Tuesday, September 07, 2010 7:09 AM
To: "J Webster" <webster_jack@hotmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: OpenVPN throttling problem

> On Mon, 2010-09-06 at 21:23 -0400, J Webster wrote:
>
>> So, for example the client accesses the proxy server and types in
>> www.googlevideos.com and plays the video with the proxy as an in between
>> server.
>> For the VPN, the client accesses the VPN server and types in
>> www.googlevideos.com and plays the video with the VPN as an in between
>> relay - it's not VPN in the strict sense of just gaining access to a 
>> private
>> network, it's more of a public server with security access restrictions 
>> for
>> geo IP location.
>>
>> On going to speedtest.net I get this when connected to the VPN:
>> ping 289ms
>> Down 0.58Mbps
>> Up: 0.84 Mbps
>>
>> On connecting directly to the proxy server on the same server box I get:
>> ping 414ms
>> Down 2.54Mbps
>> Up: 0.22 Mbps
>
> Judging from the latter speed result you are probably connecting
> through some sort of consumer connection, where there is a
> pretty high likelihood that your path MTU will not be 1500, so
> I'd say the OpenVPN guys are probably right when they think
> it's an MTU problem. Your iptables rules certainly don't
> look if they could be causing the throttling.
>
> Your best option would probably be to fiddle around with
> the MTU related settings of OpenVPN. Try searching
> the OpenVPN-users mailing list, having MTU related problems
> is apparently quite common, that's why there are
> so many different options for that area.
> Also maybe look into the  --clamp-mss-to-pmtu thing.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
