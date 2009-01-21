From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 10:36:26 -0800
Message-ID: <49776B2A.4070005@mailinator.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>	 <4977522B.5030007@mailinator.com>	 <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com> <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David J Craigon <david@craigon.co.uk>
Cc: netfilter@vger.kernel.org

David J Craigon wrote:
> Think I might of misunderstood your email. What I want to happen is
> for all traffic to go through the firewall. Customer 1 and Customer 5
> are on separate VLANs. I want Customer 5 to be able to access Customer
> 1's server as if it was any other host on the internet.
> 
> Does that make more sense?
> 
> 2009/1/21 David J Craigon <david@craigon.co.uk>:
> 
>>No, the routing is definitely working 8-). Otherwise how could all
>>traffic go from the internet to these servers? They have no other
>>internet connection than through the firewall.

Not too sure about VLANs but I have a 3-legged firewall/router with 
discrete network cards.

I just removed the route to my DMZ and now I can't reach it.  Hosts on 
my DMZ can still see my LAN and the internet because 1)net is on default 
route and 2)route to LAN still exists.

Ping a DMZ host from a LAN host and I see 100% packet loss.

I re-added the route:  ip route add DMZ/24 dev eth1

Voila', ping starts to work.

:m)
