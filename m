From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 17:00:53 -0400
Message-ID: <201306291700.53177.neal.p.murphy@alum.wpi.edu>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com> <1372536635.3924.89.camel@andrew-desktop> <CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Saturday, June 29, 2013 04:39:06 PM Nick Khamis wrote:
> I love you guys!!! I am sorry that I have left out important details
> that left you speculating. We offer a SIP phone service to our
> clients. In netfilter speak that's:
> 
> -A UDP -p udp -m udp --sport 5060 ---dport 5080 -j ACCEPT :)
> 
> Anyone can use our SIP server however, they will first need to create
> an account through our website, and provide the mac of the device that
> will be connecting to us. The website does not have to capture their
> info.
> 
> Why we prefer mac is because the device will not be static, it will be
> on the move hopping on different networks all happy and stuff :)....
> 
> Andrew, that is kind of what we are looking for but as you mentioned
> ipset would be a much better way of doing it. Until this post I did
> not know of ipset, will have to educate myself regarding it.
> 
> What is unclear at this moment is, do we have mac support,

The MAC address is only used on local links. The MAC address of a packet 
arriving at your firewall or perimeter router is that of the router at the 
other (ISP) end of your link. The only exception would be if the higher 
protocol (SIP) includes the MAC address; but that's another ball of wax.

Does SIP handle roaming? If so, you'd almost need a SIP helper to track and 
update the client's IP.
