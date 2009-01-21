From: David J Craigon <david@craigon.co.uk>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 20:33:54 +0000
Message-ID: <c1ace6860901211233h7a978638g86e891e25991b4d4@mail.gmail.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
	 <4977522B.5030007@mailinator.com>
	 <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com>
	 <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>
	 <49776B2A.4070005@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=uZAGNq3OCWPATLHLDS7hzt0uFzaksccFK04KdnNOjFc=;
        b=WiFOvRUlfcGYYpnliV5vQaEedblYWrLwhSUe+GkwIZf9oHl6XfRL9ZEy3eDqT325Cm
         m8cx3VR3Cd8NzaMNVJUBsFbvl0Mjgl6KHR1IQ1M4/8mMa2zf1Y9lJuTkXcwtvmtLYaDK
         GFcUHV7BTvnI3nDMGOfW2jfJISaRvD9uxVKXA=
In-Reply-To: <49776B2A.4070005@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Wright <mike.wright@mailinator.com>, netfilter@vger.kernel.org

well whatever. Routing, schmoting. If I turn off IPTables, everything
can see everything else fine.

2009/1/21 Mike Wright <mike.wright@mailinator.com>:
> David J Craigon wrote:
>>
>> Think I might of misunderstood your email. What I want to happen is
>> for all traffic to go through the firewall. Customer 1 and Customer 5
>> are on separate VLANs. I want Customer 5 to be able to access Customer
>> 1's server as if it was any other host on the internet.
>>
>> Does that make more sense?
>>
>> 2009/1/21 David J Craigon <david@craigon.co.uk>:
>>
>>> No, the routing is definitely working 8-). Otherwise how could all
>>> traffic go from the internet to these servers? They have no other
>>> internet connection than through the firewall.
>
> Not too sure about VLANs but I have a 3-legged firewall/router with discrete
> network cards.
>
> I just removed the route to my DMZ and now I can't reach it.  Hosts on my
> DMZ can still see my LAN and the internet because 1)net is on default route
> and 2)route to LAN still exists.
>
> Ping a DMZ host from a LAN host and I see 100% packet loss.
>
> I re-added the route:  ip route add DMZ/24 dev eth1
>
> Voila', ping starts to work.
>
> :m)
>
