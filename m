From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: Re: ebtables to perform MAC NAT ?
Date: Wed, 23 Jul 2008 20:54:14 +0200
Message-ID: <48877E56.90703@demaine.info>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net> <4884B214.90406@demaine.info> <4884E580.5000909@riverviewtech.net> <4885171A.1080709@demaine.info> <48860C0C.60504@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48860C0C.60504@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Grant Taylor wrote:
> Heh.  Sounds like your home network is more of a daisy chain of 
> computers with multiple network cars in them or something else equally 
> as strange.

This is a very good point of view of my topology. But offtopic.

> That's because it's not a package per say.  Proxy ARP is a feature of 
> the kernel that has to be enabled, much like routing and IP forwarding.
> 
> Rather than me re-typing how to do it, take a look at the write up about 
> it in the Linux Advanced Routing and Traffic Control HowTo - 
> Pseudo-bridges with Proxy-ARP 
> (http://lartc.org/howto/lartc.bridging.proxy-arp.html).

I will read that soon.

[...]

For now, i have tested parprouted (see message dated 22/07/08 18:01 
(west Europe)). Fact is: it solves the arp problem at one condition: I 
have to shutdown completely the bridge.

parprouted does not work at all with br0; it works properly only for 
eth0+wlan0_rename ... and only when br0 is off ("brctl delbr br0"); 
then, all ARP tables are set up as desired (real mac of the machine 
within the segment; IPs of machines from other segments are aliased to 
Gluton's MAC). Et the time i do "brctl addbr br0 && brctl addif br0 
eth0", arp resolution stops working (after cache expiry, or manual 
deletion).

So, my problem is not to get the right arp resolution, and find a way to 
bridge interfaces so that it wont prevent arp to work as required. This 
is an offtopic problem for now; i have a new path to walk, and i got new 
ideas for google keywords to search for. I ll give feedback in few days 
(either giving a solution, or with new problems :D ). I have to find why 
parprouted and brctl seem incompatible ... or how people do the bridging 
when using parprouted around ...

***

I am open minded for changing the software approach, as long as we keep 
trying to use my actual hardware.

I now have things to work on my side.

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)
