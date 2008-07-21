From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables to perform MAC NAT ?
Date: Mon, 21 Jul 2008 10:08:39 -0500
Message-ID: <4884A677.8080003@riverviewtech.net>
References: <4884282D.80804@demaine.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884282D.80804@demaine.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 01:09, DEMAINE Benoit-Pierre wrote:
> Hello (this is my first post on this list).

Welcome.

> I want to use a small PC as Wireless Access-Point. The machine has this 
> hardware:
> 00:07.0 Network controller: Intersil Corporation Prism 2.5 Wavelan 
> chipset (rev 01)
> 00:0f.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
> RTL-8139/8139C/8139C+ (rev 10)
> 
> The system is Debian with Hostap package.

*nod*

> For a long time, I used to use it only as a NAT bridge, using Iptables 
> script. But Iptables implies "one way only request", and two different 
> unrouted networks, that are not very practical for users.

I can tell you from experience the problem is not with bridging or 
brctl.  If there is a problem it will be with one of the devices that is 
being bridged or rather said devices lack of ability to do what is needed.

> I have recently tried to convert the machine to a pure bridge, using 
> brctl. It does not work. In fact, it's years I am warned brctl rarely 
> works with wifi cards. Still, I think that modern tools can workaround 
> the old limits.

I had an Athros chipset based wireless card that I bridged with my eth0 
interface that I used as an AP for many months with out any problems. 
(I migrated away from it b/c there was a nice unused DW1000 (?) at the 
office and I needed to re-purpose the computer.)

> What's available now:
> 
> br0       Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
>           inet addr:192.168.0.203  Bcast:192.168.0.255  Mask:255.255.255.0
>           inet6 addr: fe80::209:5bff:fe91:5608/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> 
> br0:1     Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
>           inet addr:192.168.0.204  Bcast:192.168.0.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> 
> eth0      Link encap:Ethernet  HWaddr 00:E0:C5:68:F9:6E
>           inet6 addr: fe80::2e0:c5ff:fe68:f96e/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> 
> eth1      Link encap:UNSPEC  HWaddr 00-09-5B-91-56-08-30-3A-00-00-00-00-00-00-00-00
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> 
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
> 
> wlan0_ren Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
>           inet6 addr: fe80::209:5bff:fe91:5608/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

The only thing I notice right a way is that you do not have a consistent 
binding of IP and IPv6 to your interfaces.  This may be a problem in and 
of its self.  Also, eth1 does not have any thing bound (directly) to it 
at all.

> Gluton:~# brctl show
> bridge name     bridge id               STP enabled     interfaces
> br0             8000.00095b915608       no              eth0
>                                                         wlan0_rename

*nod*

> For obvious reasons, I run this during init:
> echo 1 > /proc/sys/net/ipv4/ip_forward

Ok...

> Straight after setting up the bridge, the machine can be accessed by 
> both sides, but nothing goes through. When one side (let say host A on 
> the ethernet side) tries to ping the other side (let say host B in Wifi 
> side), I see this in console:
> Gluton:~# tcpdump -veni br0 arp
> tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 96 
> bytes
> 
> After
>      ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
>      --to-source 00:09:5B:91:56:08 --snat-arp ;
> I get a bit more messages:
> 
> Gluton:~# tcpdump -veni br0 arp
> tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 96 
> bytes
> 
> In both cases, the TX packet counter increases for the Wifi card; the RX 
> packet counter increases only in the second case => as said in many 
> forums: the Wifi card seems to be unable to send packets with a MAC 
> different from it's own.

This sounds more like your wireless card can't properly go in to 
promiscuous mode like I'm accustom to seeing.

> My snat command seems to improve things, since Gluton (G for gateway) 
> now receive an answer; but, if i understand correctly, when G receives 
> the answer, it is not forwarded to the querying host: A. As consequence, 
> A's arp table remains empty: arp -n => "192.168.0.1 (incomplete)" .

*nod*

This is because the ARP reply is coming back to (destination MAC of) G. 
  G is not passing the ARP reply on like it possibly should.

> So, i tried to force arp answers. After the following:
>     ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
>      --to-source 00:09:5B:91:56:08 --snat-arp ; ebtables -t nat -A
>      PREROUTING -p arp -j arpreply --arpreply-mac 00:09:5B:91:56:08
> all arp querries are answered, to the MAC of the bridge. As an 
> advantage, traffic now goes through; as a problem, Gloton answers even 
> for IPs that are not taken by any host of any side; this prevents 
> systems to boot (before taking an IP, Windows and Linux make an arp 
> who-has, and gluton answers, so, the OS complains the IP is already 
> assigned to an other host). After forcing manually, or disconnecting 
> Gluton for a few seconds, host can take their IPs.

*nod*

You have now put something in place that functions much like (or at 
least my understanding of) Proxy ARP.

> ??? Question: how to tell Gluton to always provide answers to arp 
> querries when the host is available, and answer only when IP is not 
> located on the same side as the question comes from ? In other words, I 
> want Gluton to check if an IP is alive, and, if it is not on the same 
> side as the question, it should answer it's own MAC.

Now you are wanting EBTables / IPTables to act conditionally based on 
the state of something out side of the system they are running on.  To 
pull this off you will probably have to drop out of the kernel in to 
user space and have something monitor your target MACs.

> Two people said they can use brctl with this MA301. I may not have the 
> same firmware as they do. Still, I am certain there is an ebtables 
> solution to this problem. I have been thinking about the redirect 
> Target, but not sure where my packets goes. Snat obviously NAT correctly 
> from A to B question, but not the answer from B to A.

I'm sure you could do something with a series of MAC mappings, but 
(IMHO) that is just nasty.  I.e. any ethernet frames with a target MAC 
addresses that are on the other side of the bridge would have their 
source MAC address changed to that of the opposing interface in the bridge.

> Since IPs could move from one side to an other, I really need something 
> dynamic (in the 1s to 10s range); I wondered if the --among-dst-file 
> option reads file only when declaring the rule, or if it is read 
> periodically from the disk; in the second case, I could periodically 
> refresh some tables after a periodical compleet scan ...

I would think that your wireless MACs would always be on the wireless 
side of the bridge regardless of what IP they may have.  So you may be 
able to get away NATing the MAC address.  However this will get very nasty.

Let me do some thinking about how to make this happen in something even 
remotely reasonable.  (I.e. how to do what is usually a layer 3 
operation on layer 2 with the same layer 3 addresses on both side of the 
bridge.)

> NB: i don't mind at all about security; i am only trying to get traffic 
> go through, as if it was a cheap AP.

*nod*

> You can assume I did not run any other basic command than "echo 1 > 
> /proc/sys/net/ipv4/ip_forward".

'k

> I would love this machine to be IPv6 compliant in the coming months, so, 
> please, try to avoid things that would limit this feature. But if, as I 
> think, the problem is only around ARP, IPv6 should not be a problem 
> (but, i may be wrong; there seem to be strange IPv6 specific discovery 
> packets).

*nod*

> The whole problem lays in arp tables: if after
>      ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
>      --to-source 00:09:5B:91:56:08 --snat-arp ;
> I declare arp tables manually on all hosts, everything works fine.

Hum...



Grant. . . .
