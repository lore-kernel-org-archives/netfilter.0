From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: User specific ip addresses
Date: Wed, 25 Mar 2009 09:55:02 -0400
Message-ID: <1ddks4t2gjtti5839156qb5nucp82rjb21@4ax.com>
References: <17E09B19-465C-4861-BE9B-551377A2ECD2@romal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> I have a tricky problem. I need a dual-homed linux box, one nic is  
> connected to our network, the other nic is connected to the customer  
> network.
> 
> Several users from us are logging in via our interface and are leaving  
> the system on the customers interface. BUT I need them to leave with  
> different IP-addresses (al in the same subnet).
> 
> Is there some netfilter or virtual ip addresses magic to do this ?

If your clients have distinct IP addresses, then maybe the NETMAP or SAME
targets will do what you want.  The descriptions in iptables(8) aren't entirely
clear, but maybe they'll do it.

If you really want to do NAT based on user IDs, then vanilla iptables can't do
it.  Except for packets that originate on localhost, the owner of a packet is in
general unknown.  NuFW claims to solve this problem, but it's complex.

Good luck,
Andrew.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
