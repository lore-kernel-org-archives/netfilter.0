From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: FORWARD -P DROP + allow MSN
Date: Thu, 16 Apr 2009 15:31:40 +0200
Message-ID: <49E7333C.6070404@chello.at>
References: <49E6FAB3.90304@lab.vectoris.fr> <49E703FD.80100@chello.at> <49E716BD.9070205@lab.vectoris.fr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E716BD.9070205@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mihamina Rakotomandimby (R12y) wrote:
> Mart Frauenlob wrote:
>> - The whole forwarding is stateless!
>> I strongly suggest to change that.
>> Allow that ports for your lan with something like that:
>> iptables -A FORWARD -i $WAN -o $LAN -d $ACCEPTED_MACHINE -m state 
>> --state ESTABLISHED,RELATED -j ACCEPT
>
> Done.
>
>> this is the general 'allow all back in, which is tracked by the state 
>> machine' match.
>> now your ports:
>> iptables -A FORWARD -i $LAN -o $WAN -s $ACCEPTED_MACHINE -p tcp -m 
>> multiport --dports x,y,z... -m state --state NEW,ESTABLISHED -j ACCEPT
>>
>> [...]
>> Same thing maybe on your $ACCEPTED_PORT in INPUT chain.
>
> Erm, supposing I will have to add some more ports, I'd rather add them 
> in one place than in each line, so, for that purpose, looping seems 
> better for me.
>
>> - Don't allow all icmp. Do you want your firewall to accept icmp 
>> redirects? Guess not...
>
> Okay, It's just in order to debug, because we make several traceroutes.
>
>> - I will say some about the Facebook drop:
>> $IPT -A INPUT   -p tcp -i $LAN         --destination  $IP_FACEBOOK -j 
>> DROP
>
> It was for the following REDIRECT.
> I did not filter REDIRECTing to the HTTP proxy, I filter when it 
> INPUTs after the REDIRECT.
>
> It's just a notice, not from a documentation reading.
> Look at my ACCEPTED_PORT, it does not list 80, and web browsing fails 
> if I block INPUTs. So, I guessed REDIRECTed packets are INPUT ones 
> after REDIRECTion.
>
ah, yes... didn't think of that, but than maybe the FORWARD rule is not 
needed....
>> Now, let me think about the MSN thing. Personally I never used it, 
>> and don't know what configuration it may need. Didn't try to look it 
>> up now too.
>
> Happy you! Some collegues refuse to use Jabber.
>
>> But, one thing I noticed:
>> You REDIRECT all port 80 traffic to the local port 3128. HTTP proxy I 
>> guess...
>
> IT's the running SQUID, yes.
>
>> Now MSN uses all those ports and as it looks port 80.
>
> I did not understand this sentence.
>
because you said in your first post:
'Anyway, when setting the MSN LAN clients to use HTTP, it's OK with this 
config. '
And you have those iptables rules opening a lot of ports for MSN traffic.
>> If now port 80 traffic goes over the http proxy and the rest of the 
>> traffic does not, that may cause the MSN applications to fail.
It might happen that a part of the MSN traffic goes over the http proxy 
while the rest not, and that may cause a failure.

>> How about a socks proxy for MSN? 
>
> Never heard about...
>
>> I just guess client applications will have such a feature. In that 
>> case, your socks proxy does all the work, 
>
> I'll try: http://www.google.com/search?q=Ubuntu+SOCKS+proxy+MSN is not 
> the right query yet, if you have a more powerful query, please tell ;-)
>
What clients are you using on the LAN side to connect to the MSN network?
If I open up Windows messenger on xp, under extras, options, network, I 
can specify a socks server.
Your client application(s) should also provide such an option....

Now if you setup a socks server on your router (there are some 
available), and instruct your clients to use the socks server for MSN, 
you don't need to open up firewall ports.

If you don't want that, you need to find out what tcp/udp ports to open 
up for MSN.
Quickly searching brings me this i.e.
http://www.gentoo-wiki.info/Iptables_port_reference#MSN_Messenger

But maybe more is required, I don't know...

One more thing.
I suggest to only REJECT to your LAN(s) as final rule, doing the reject 
thing other than on port 113 (auth) to the outside (untrusted) world, 
can lead to DOS attacks.

greets

Mart

