From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: BroadCast, Multicast and Unicast..
Date: Fri, 15 Aug 2003 10:52:35 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308151043350.31438-100000@localhost>
References: <009101c362d3$294a42e0$cc9b7ad5@AlienW>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009101c362d3$294a42e0$cc9b7ad5@AlienW>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sarky <sarky@raycon.net>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi Sarky,

> Just wondering what ports do those work on, if someone wants to try to limit
> the broadcast and the rest coming out of the system what is the best method.

They don't work on "ports" as such, they are above the TCP/UDP layer that 
knows about ports.

There are two "types" of broadcast and multicast which are commonly 
encountered: Ethernet (layer 2) and IP (layer 3).

Ethernet broadcast is where an Ethernet frame is sent to the special MAC
address FF:FF:FF:FF:FF:FF on an Ethernet network. Ethernet multicast is
where a frame is sent to an address with the top bit set (e.g.
01:00:00:5e:00:00).

Both of these are used extensively for protocols such as ARP, Spanning
Tree Protocol, and to support IP broadcast and multicast over Ethernet.

IP broadcast is where an IP packet is sent to a broadcast address. The 
definition of an IP broadcast address is usually the last IP address in a 
subnet (e.g. 192.168.0.255 if your network is 192.168.0.0/24). IP 
multicast is where a packet is sent to an address in 224.0.0.0/4.

IP broadcast packets sent over Ethernet should be sent to the Ethernet 
broadcast address. The rules for multicast are less clear (to me, at 
least).

> At the moment my Switch is recieving low amount of Broadcast and MultiCast
> but transmitting a lot of it..
> And i dont know what to do or where to start.

Find out what kind of broadcast/multicast by looking at "tcpdump -e" and 
checking the MAC addresses that the packets were sent to. Often the 
traffic can be disabled by setting options on the switch (e.g. disabling 
Spanning Tree Protocol/STP). However, it usually doesn't take a lot of 
traffic and performs a useful service, so it might not be wise to disable 
it.

Hope this helps,

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


