From: "jimbo jones" <jdvuyk_crap@hotmail.com>
Subject: Re: Kazaa Ports
Date: Tue, 09 Sep 2003 08:21:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F28DUggCXOFTYv00010938@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JALaramie@Loudoun-Fairfax.com, dagent.geo@yahoo.com
Cc: netfilter@lists.netfilter.org


Have you fiddled with the firewall settings in Kazaa that supposedly let you 
change the outgoing port to anything you like.  I have heard in cases that 
you can change this to, say, port 80 and suddenly everything goes (web port 
and all).  However I have exactly the same setup with exactly the same issue 
and this option didnt work for me.  But maybe it will for someone else.  
Would also like to get this solved.

Suggestions appreciated.

Cheers


>From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
>To: SBlaze <dagent.geo@yahoo.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Kazaa Ports
>Date: Mon, 08 Sep 2003 18:47:18 -0400
>
>Thanks for answering
>
>>Assuming that you are running the Kazza on a Internal windows machine the
>>POSTROUTING should handle all of the out going of the Kazza Client...
>>
>>
>
>hmmm . . . I revised my rule set recently using the iptables tutorial  by 
>Oskar Andreasson as a guide, and he recommends again doing any filtering in 
>the nat tables.
>
>http://iptables-tutorial.frozentux.net/chunkyhtml/traversingoftables.html#TRAVERSINGGENERAL
>
>
>>what is probably not making it through is the returning connection 
>>attempts of
>>the Kazza servers? In which case... you shouldn't be using FORWARD lines 
>>at all
>>sinnce these are supposedly destined for the local machine(as in the Linux 
>>box
>>itself and not anything in your lan).
>>
>
>If you look further down in the link I posted, there is a diagram that 
>shows INPUT going to the localhost and the FORWARD being used for packets 
>destined for other hosts.  Hmmm again . . .  :-)
>
>>What I think is needed here is the
>>PREROUTING of a range or specific ports. I think this will solve your 
>>problem
>>for Kazza but it offers very little as in the way of security for those 
>>ports.
>>
>>An example of this is when I used to run my Half-Life Deadicated Server on 
>>my
>>internal Windows Machine I used a PREROUTING line such as...
>>
>>iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
>>--to-destination 192.168.1.25:27015
>>
>>While my scenerio was alot simpler than yours it's similar I think. Your
>>problem will be of course finding the range of ports. I would also say 
>>take
>>note of the use of limiting it to one protocol(if you can). Better to have 
>>a
>>straw open to the world than a big ol sewer pipe!
>>
>>
>>
>Absolutely! That's what makes this an issue for me. I can't nail down the 
>ports Kazaa needs and the more I open up the less protection I have. I need 
>to find a better strategy and I'm open to suggestions.
>
>Jeff
>
>
>

_________________________________________________________________
Tired of 56k? Get a FREE BT Broadband connection 
http://www.msn.co.uk/specials/btbroadband


