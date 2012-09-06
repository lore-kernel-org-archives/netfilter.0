From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Using Netfilter with high bandwidth
Date: Thu, 06 Sep 2012 13:56:12 -0400
Message-ID: <86e4474c94886d032c6f7d83720e865a@linuxwall.info>
References: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
 <alpine.LNX.2.01.1209010028550.27474@frira.zrqbmnf.qr>
 <1346658980.3069.584.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1346954172;
	bh=WrKYWCmCBkKwWAqGnYfezhyRPcd+6M5DE7e6U8WruiA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xsC82gvhJpeBnurzIFM6IvlvsnCcDTXzxidYi2XqSvYqQFC1njYS6RV147eKk2uYx
	 9J7UXHAZ8w3mZ+Kgp/EZ/fAllEnXoPx4wlGiq4wgqdXjyMfkdZv5hFNVDBzOT9QxIR
	 cDtO+13bHPNFuY3Tev6jhR48Se7AAm5wHgqJoOMY=
In-Reply-To: <1346658980.3069.584.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jesper Dangaard Brouer <brouer@redhat.com>, Jan Engelhardt <jengelh@inai.de>
Cc: netfilter <netfilter@vger.kernel.org>


Thank you Jan & Jesper for the very detailled answers. We have started 
working on a prototype using Intel 10G cards (82599ES). I'll spend some time 
reading all the papers you posted, and will try to write something up at the 
end.

The cost difference compared to vendor prices is just ridiculous. We ca spec 
a 4*10G NICs with dual 8core for ~$6k each, while the equivalent from the big 
guys would be around ~$60/80k a piece.

-- 
Julien Vehent - http://jve.linuxwal.info


On 2012-09-03 03:56, Jesper Dangaard Brouer wrote:
> On Sat, 2012-09-01 at 00:39 +0200, Jan Engelhardt wrote:
>> On Friday 2012-08-31 21:38, Julien Vehent wrote:
>>
>> > Hi All,
>> >
>> > At work, we're building a new office, and we are considering building 
>> our own
>> > edge firewalls instead of giving bucket loads of money to the big guys. 
>> We're a
>> > Linux shop, so it makes sense to build those new firewall/vpn boxes 
>> using
>> > Linux. But we are concerned about performances and complexity. I make a 
>> simple
>> > diagram of what we want below. We would have a point to point WAN 
>> connection
>> > between the two networks, and then an uplink on each side.
>> >
>> > So I figured I would ask the Netfilter heavy users:
>> > * How much traffic can we expect to route to a decently configured 
>> Firewall ?
>> > Can we target 10GBPS with good NICs/CPUs and proper kernel tuning, or 
>> is that
>> > completely out of range ?
>
> I did a lot of 10Gbit/s routing testing back in 2009:
> 
> http://vger.kernel.org/netconf2009_slides/LinuxCon2009_JesperDangaardBrouer_final.pdf
>
> Which showed that Intels Nehalem microarchitecture, was capable of doing
> 10Gbit bi-directional routing on Linux.  Combined with multiqueue NICs,
> where the Intel 10G NIC were the winning NIC.  (Disclaimer, this testing
> were without iptables rules)
>
> Notice this was 2009, based on the first Nehalem arch.  I know that
> Sandy bridge will improve performance (due to better handling of
> outstanding PCI-transactions) but I have not tested the details.
>
> I'm also eager to test the new Intel CPUs E5-26xx, which have something
> called  DDIO (Direct Data I/O).  Where they basically allow the NIC to
> map data directly into L3-cache:
>  http://www.intel.in/content/www/in/en/io/direct-data-i-o.html
>
>
>> > * If I recall correctly, some ISPs are using Linux/Netfilter boxes on 
>> their
>> > network.
>
> I can confirm that I used to work for an ISP, that still have
> Linux/Netfilter boxes, that route and police all their customers
> Internet traffic.  Just before I left, we replaced all machines with
> Nehalem based machines to prepare for 10G upgrade, but I only a single
> machine was deployed with 10Gbit/s NICs while I was still there.
>
>
>> Do we know the limits of such systems ?
>
> I did some lab tests on 10Gbit/s routing on the new hardware, with
> approx 150.000 iptables rules and a corresponding HTB (bandwidth
> shaping) tree.  We ran into some limits around 4.5Gbit/s, but that was
> due to the HTB tree, because it causes serialization the traffic control
> layer when transmitting/queueing packets.
>
> Notice that you really have to careful how you structure your ruleset,
> if you want this many rules:
> 
> http://www.slideshare.net/brouer/netfilter-making-large-iptables-rulesets-scale
>
>
>> > * Can we consider conntrack and conntrack synchronization between 
>> master and
>> > slave ?
>
> Never played with contrackd.  Perhaps someone could share their
> experience in this area?
>
>
>> > * What type of network cards will handle 1GBPS and 10GBPS (eventually) 
>> ? Any
>> > recommendation on the hardware ?
>>
>> Those with multiqueue. Intel is known to have some offerings, check
>> there (I don't have the chip numbers at hand).
>
> The Intel chip number for the 1Gbit/s NIC is 82576 and for the 10Gbit/s
> NIC is 82599.
>
>
>
>> > * We are considering starting with a base ubuntu setup and then tuning 
>> the
>> > kernel/system to fit our needs. Some distros are more network oriented 
>> than
>> > others, is there anything that would stand out for our setup ?
>
> If you plan to manage the server yourself, I really recommend you just
> choose your favorite Linux distro on a standard server.  I have spend
> too much time on getting stuff to work on minimal semi-homebrewed
> distributions running on flash or disk-drives.
>
> And please remember to increase the number of conntrack entries.
>
> E.g.:
>  /proc/sys/net/netfilter/nf_conntrack_max = 900000
>
> And to the calc: Conntrack element size 228 bytes found
> in /proc/slabinfo: "nf_conntrack <objsize> = 228 "
>
>  228 * 900000 / 10^6 = 205.2 MB
>
> You should also change the nf_conntrack hash bucket size, as just
> increasing the number of conntrack entries, will cause more collisions.
>
> This is done either when loading the module:
>   modprobe nf_conntrack hashsize=300000
> Or runtime via /sys:
>   echo 300000 > /sys/module/nf_conntrack/parameters/hashsize
>
>
> Do you plan to write the iptables rules manually in a script, or do you
> plan to use a GUI for config?
> (I'm just asking because I don't know if there is some good free GUIs
> out-there... I once approx 2001 used fwbuilder.org, for a system that
> someone else had to admin, they seemed happy...)

