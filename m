From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange logs...
Date: Sun, 11 Jan 2004 12:02:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111202.40264.Antony@Soft-Solutions.co.uk>
References: <002201c3d837$a6c70e90$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c3d837$a6c70e90$1530a8c0@HUSH>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 11 January 2004 11:40 am, Carlos Fernandez Sanz wrote:

> Jan 11 11:52:12 fulanito kernel: [IPTABLES DROP NAT] : IN=eth1 OUT=
> MAC=00:01:03:27:83:4c:00:0c:6e:77:a9:92:08:00 SRC=192.168.20.5
> DST=192.168.20.1 LEN=78 TOS=0x00 PREC=0x00 TTL=128 ID=13013 PROTO=UDP
> SPT=137 DPT=137 LEN=58
>
> eth1 is my external (connected to the internet router) interface,
> 192.168.20.5 is one of my window boxes, 192.168.20.1 is my linux box. These
> two boxes are connected via a switch (which has nothing else connected to
> it), and the interface is eth0.
>
> What could cause that the packet appears in eth1 instead of eth0? Of course
> that explains that it's being dropped, as I have a rule that drops
> everything coming in the external interface with private addresses....
>
> I know the obvious answer would be "someone special made that packet and
> sent it", but the packet does come from the LAN. The MAC matches the IP
> it's supposes to come from (i.e. belongs to the NIC in my windows card),

The fact that the MAC address is correct means that the packet has surely come 
from the Windows machine, and has not come through any other router (because 
if it had, it would have the IP address of the Windows box and the MAC 
address of the router).

Tell us more about your network connections - you say you have a switch on 
eth0 connected to the Windows box and nothing else; how is eth1 connected to 
your Internet router?   Crossover cable?   Switch/hub?   What?

Also, do you have a nice simple, clean subnet arrangement - something like a 
single public IP on eth1, and a private class C on eth0, nothing fancy?

It would be good to try running tcpdump or ethereal on the netfilter machine, 
so that when a log entry such as this appears, you can check the tcpdump or 
ethereal log and see if it agrees that the packet really did only come in on 
eth1.

Not a solution to your probloem, I know, but maybe a help along the way?

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


