From: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Subject: Re: FORWARD -P DROP + allow MSN
Date: Thu, 16 Apr 2009 14:30:05 +0300
Message-ID: <49E716BD.9070205@lab.vectoris.fr>
References: <49E6FAB3.90304@lab.vectoris.fr> <49E703FD.80100@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E703FD.80100@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> - The whole forwarding is stateless!
> I strongly suggest to change that.
> Allow that ports for your lan with something like that:
> iptables -A FORWARD -i $WAN -o $LAN -d $ACCEPTED_MACHINE -m state 
> --state ESTABLISHED,RELATED -j ACCEPT

Done.

> this is the general 'allow all back in, which is tracked by the state 
> machine' match.
> now your ports:
> iptables -A FORWARD -i $LAN -o $WAN -s $ACCEPTED_MACHINE -p tcp -m 
> multiport --dports x,y,z... -m state --state NEW,ESTABLISHED -j ACCEPT
> 
> [...]
> Same thing maybe on your $ACCEPTED_PORT in INPUT chain.

Erm, supposing I will have to add some more ports, I'd rather add them in 
one place than in each line, so, for that purpose, looping seems better for 
me.

> - Don't allow all icmp. Do you want your firewall to accept icmp 
> redirects? Guess not...

Okay, It's just in order to debug, because we make several traceroutes.

> - I will say some about the Facebook drop:
> $IPT -A INPUT   -p tcp -i $LAN         --destination  $IP_FACEBOOK -j DROP

It was for the following REDIRECT.
I did not filter REDIRECTing to the HTTP proxy, I filter when it INPUTs 
after the REDIRECT.

It's just a notice, not from a documentation reading.
Look at my ACCEPTED_PORT, it does not list 80, and web browsing fails if I 
block INPUTs. So, I guessed REDIRECTed packets are INPUT ones after 
REDIRECTion.

> Now, let me think about the MSN thing. Personally I never used it, and 
> don't know what configuration it may need. Didn't try to look it up now 
> too.

Happy you! Some collegues refuse to use Jabber.

> But, one thing I noticed:
> You REDIRECT all port 80 traffic to the local port 3128. HTTP proxy I 
> guess...

IT's the running SQUID, yes.

> Now MSN uses all those ports and as it looks port 80.

I did not understand this sentence.

> If now port 80 traffic goes over the http proxy and the rest of the 
> traffic does not, that may cause the MSN applications to fail.
> How about a socks proxy for MSN? 

Never heard about...

> I just guess client applications will 
> have such a feature. In that case, your socks proxy does all the work, 

I'll try: http://www.google.com/search?q=Ubuntu+SOCKS+proxy+MSN is not the 
right query yet, if you have a more powerful query, please tell ;-)


-- 
                              Chef de projet chez Vectoris
                                  Phone: +261 33 11 207 36
System: xUbuntu 8.10 with almost all from package install
    http://www.google.com/search?q=mihamina+rakotomandimby
