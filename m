From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Kazaa Ports
Date: Mon, 08 Sep 2003 18:47:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5D06F6.20408@Loudoun-Fairfax.com>
References: <20030908210228.48729.qmail@web40201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030908210228.48729.qmail@web40201.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Thanks for answering

>Assuming that you are running the Kazza on a Internal windows machine the
>POSTROUTING should handle all of the out going of the Kazza Client...
>  
>

hmmm . . . I revised my rule set recently using the iptables tutorial  
by Oskar Andreasson as a guide, and he recommends again doing any 
filtering in the nat tables.

http://iptables-tutorial.frozentux.net/chunkyhtml/traversingoftables.html#TRAVERSINGGENERAL


>what is probably not making it through is the returning connection attempts of
>the Kazza servers? In which case... you shouldn't be using FORWARD lines at all
>sinnce these are supposedly destined for the local machine(as in the Linux box
>itself and not anything in your lan).
>

If you look further down in the link I posted, there is a diagram that 
shows INPUT going to the localhost and the FORWARD being used for 
packets destined for other hosts.  Hmmm again . . .  :-)

> What I think is needed here is the
>PREROUTING of a range or specific ports. I think this will solve your problem
>for Kazza but it offers very little as in the way of security for those ports.
>
>An example of this is when I used to run my Half-Life Deadicated Server on my
>internal Windows Machine I used a PREROUTING line such as...
>
>iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
>--to-destination 192.168.1.25:27015
>
>While my scenerio was alot simpler than yours it's similar I think. Your
>problem will be of course finding the range of ports. I would also say take
>note of the use of limiting it to one protocol(if you can). Better to have a
>straw open to the world than a big ol sewer pipe!
>
>  
>
Absolutely! That's what makes this an issue for me. I can't nail down 
the ports Kazaa needs and the more I open up the less protection I have. 
I need to find a better strategy and I'm open to suggestions.

Jeff



