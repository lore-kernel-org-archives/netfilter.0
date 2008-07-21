From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: Re: ebtables to perform MAC NAT ?
Date: Mon, 21 Jul 2008 17:58:12 +0200
Message-ID: <4884B214.90406@demaine.info>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884A677.8080003@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

(Grant sorry for double, I forgot to change the To: field)

Grant Taylor wrote:
> I can tell you from experience the problem is not with bridging or 
> brctl.  If there is a problem it will be with one of the devices that is 
> being bridged or rather said devices lack of ability to do what is needed.

As mentioned, i know the problem is 99% likely to be due to the MA301.

> I had an Athros chipset based wireless card that I bridged with my eth0 
> interface that I used as an AP for many months with out any problems. (I 
> migrated away from it b/c there was a nice unused DW1000 (?) at the 
> office and I needed to re-purpose the computer.)

Do all atheros chipsets work fine ? maybe I could buy one for cheap ?

> The only thing I notice right a way is that you do not have a consistent 
> binding of IP and IPv6 to your interfaces.  This may be a problem in and 
> of its self.  Also, eth1 does not have any thing bound (directly) to it 
> at all.

I dont really know what eth1 is; hostap always produce two interfaces
per NIC; never understood the real difference, but in my case, i know i
shall iwconfig/ifconfig on wlan0_rename. eth1 and wlan0_rename are both
the same NIC, managed by hostap (see how the MAC is very similar). Thus,
it is normal you think eth1 is unconnected (maybe you would have
understand if you better knew hostap, or if I joined iwconfig).

IPv6 is not today's problem.

> This sounds more like your wireless card can't properly go in to 
> promiscuous mode like I'm accustom to seeing.

It's what i have been said years ago; that's why 3y ago, when brctl
failed, i did not spend more than 10 minutes testing it, and moved *at
once* to (IP) NAT. And, IMHO, my tests confirm it again. So, the point
of this thread is to "workaround" this :)

> This is because the ARP reply is coming back to (destination MAC of) G. 
>  G is not passing the ARP reply on like it possibly should.

Yup, see question further :)

> You have now put something in place that functions much like (or at 
> least my understanding of) Proxy ARP.

Yup, kinda works. But, does not work "well". I dont know enough about
ARP, frames, bridging and so to dig further by myself, thus, coming to
chat. It works with very bad side effects.

>> ??? Question: how to tell Gluton to always provide answers to arp 
>> querries when the host is available, and answer only when IP is not 
>> located on the same side as the question comes from ? In other words, 
>> I want Gluton to check if an IP is alive, and, if it is not on the 
>> same side as the question, it should answer it's own MAC.
> 
> Now you are wanting EBTables / IPTables to act conditionally based on 
> the state of something out side of the system they are running on.  To 
> pull this off you will probably have to drop out of the kernel in to 
> user space and have something monitor your target MACs.

No, I simply want to solve my side effect. I have exposed the
limitations of the machine (try to keep hardware, that MA301 seems to
not enjoy brctl), and exposed some tests I did. Before the question I
exposed what I did, and know for sure. After, I exposed what I think, or
could do.

Maybe there is a magical ebtables option I did not remark, or a friend
tool specially dedicated to help brctl in this kind of configurations.
Many people bought MA301, so, I really hope this case have been met by
many people, and hopefully, some solved it.

> I'm sure you could do something with a series of MAC mappings, but 
> (IMHO) that is just nasty.  I.e. any ethernet frames with a target MAC 
> addresses that are on the other side of the bridge would have their 
> source MAC address changed to that of the opposing interface in the bridge.

I can remove the bridge if it can help. All I want is to remove the
IP-NAT thing, so that my network get unified => transform the machine
into a real transparent bridge, at least at the IP point of view. But,
if I remove brctl bridging, I will need to recreate an other way (or the
apckets will never go through ^^ ).

Facts are: I want bridging to gain homogeneous/unified network, but
MA301 is not bridge friendly.

>> The whole problem lays in arp tables: if after
>>      ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
>>      --to-source 00:09:5B:91:56:08 --snat-arp ;
>> I declare arp tables manually on all hosts, everything works fine.
> 
> Hum...

This is a very important point to me, because it shows that it's only an
ARP problem, and that brctl really helps a lot (it does actually forward
packets from side to side). But, messing up arp tables is something
really messy. I am surprised that this simple command does not work "as
well" as it's iptables equivalent: the iptablei NAT does NAT for both
questions and answers; I wonder why ...

In fact, I wonder if there could be two bugs in brctl:
- answer not coming back through
- bug in --snat-arp

I did not detailed this point in my first post, but after the simple
snat thing, host B get A's MAC in his ARP tables. Considering this
point, plus tcpdumps just means: my ebtables rule does forward the
question, but the question still contains A's MAC even when using
--snat-arp (that should IMHO work "inside" the question). I can send
details on this if you want within 24h. I would need to move two
machines in the network to do that.

I wondered if brctl was bothered by the fact the answer comes back with
it's own MAC as destination; once ARP tables are declared, all works
fine, maybe because of IP routing tables; ARP queries seem to be more in
trouble.

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)

