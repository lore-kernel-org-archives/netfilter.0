From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: network setup help
Date: Sun, 11 Apr 2004 00:59:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404110059.05382.Antony@Soft-Solutions.co.uk>
References: <008301c41f2d$4be932e0$68892090@grouse> <200404102350.24148.Antony@Soft-Solutions.co.uk> <00d001c41f54$2b238ac0$68892090@grouse>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d001c41f54$2b238ac0$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 11 April 2004 12:33 am, Jee J.Z. wrote:

> Hi Antony,

Thanks for getting the spelling right - lots of people round here don't :)

> > Look at the routing table of each machine the packets are going through,
> > and then the replies trying to get back again, and see if (a) there is a
> > path, and (b) it makes sense.
>
> Both PC2 and PC3's routing look like:
> Destination                Gateway                   Genmask
> Flags      Metric      Ref      Iface
> 192.168.0.0               0.0.0.0                     255.255.255.0
> U            0           0        eth1
> 144.32.xxx.0              0.0.0.0                     255.255.254.0
> U            0           0        eth0
> 127.0.0.0                  0.0.0.0                     255.0.0.0
> U            0           0         lo
> 0.0.0.0                     144.32.xxx.yyy           0.0.0.0
> UG           0           0        eth0

Okay, I'm assuming that 144.32.xxx.yyy is not the address of PC1 - it's 
something else which is connected to your switch - however that's not too 
important here.

Here's what I think is going on:

PC1 has a simple routing table saying "network 144.32.xxx.0/23 is on eth0, and 
the deafult gateway is 144.32.xxx.yyy".   That means if you ping 192.168.0.2 
from PC1 it will send the packets to the default gateway :(

Set a network route on PC1 to tell it how to find the 192.168.0.0/24 network, 
via PC2 as a router:

route add -net 192.168.0.0 netmask 255.255.255.0 gw 144.32.xxx.b

where 144.32.xxx.b is the IP address on PC2/eth0

Once you have done that I think the pings will work, however they will not 
work the way you would like them to :)

An echo request packet will come from 144.32.xxx.a (PC1/eth0) to 192.168.0.2 
and get routed (by your new routing table entry on PC1) via 144.32.xxx.b, 
where PC2 will decide "192.168.0.2? Oh, that's on my eth1", and will send it 
to PC2.

However, if PC2/eth0 is still operational and plugged in, it will think "I 
have to send an echo response packet to 144.32.xxx.a, and that's on this 
subnet connected to my eth0", so it will send the reply packet out through 
eth0.

This will actually work for pings, but it's not the way you want TCP packets 
to flow (remember that pings are ICMP packets), and it certainly won't work 
once you start doing nat on PC2 (which I assume, for some reason, that you do 
want to do?).

However, I still remain puzzled about why you have this crazy setup in the 
first place, and what you're trying to achieve by sending pings from PC1 to 
PC3 via PC2, so add the routing table entry to PC1, check whether a ping 
works (with all the cables plugged in, so all the paths shown on your 
original diagram are available), and then try to explain to us why you are 
doing things this way and what you want to achieve.

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


