From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 1 May 2004 21:21:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405012121.27461.Antony@Soft-Solutions.co.uk>
References: <409310DE.2020004@isoar.ca> <200405011905.30495.Antony@Soft-Solutions.co.uk> <4093FFB3.9060502@isoar.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4093FFB3.9060502@isoar.ca>
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

On Saturday 01 May 2004 8:51 pm, Andrew E. Mileski wrote:

> Antony Stone wrote:
> > On Saturday 01 May 2004 6:42 pm, Andrew E. Mileski wrote:
> >>There is only one rule needed if all other defaults are ACCEPT:
> >>
> >>This one is on my network:
> >>iptables -t nat -A POSTROUTING -s ! $WAN_IP -o $WAN_IFC -j SNAT
> >>--to-source $WAN_IP
> >
> > What is $WAN_IP, and what are the IP addresses on the machine on which
> > this rule is running?
>
>    WAN_IP=209.217.118.226
>
> > I still don't really understand why you need a SNAT rule on a machine
> > which is running the service locally?
>
> For example:
>
> The NTP server process on the gateway sends a UDP packet to a NTP server
> on internet, let's say time.nist.gov.

Okay, I think you mean that the NTP *client* process on the gateway sends a 
packet to an NTP server on the Internet.   I was getting confused because you 
kept talking about a server, and I couldn't see where SNAT would come into 
that, however for a client process I can understand it.

> The packet sent out WAN_IFC has:
>    source address: WAN_IP = 209.217.118.226
>    source port: 123
>    destination address: time.nist.gov = 192.43.244.18
>    destination port: 123
> A reply packet from time.nist.gov arrives on WAN_IFC with:
>    source address: time.nist.gov = 192.43.244.18
>    source port: 123
>    destination address: WAN_IP = 209.217.118.226
>    destination port: 123

That all seems perfectly clear and reasonable.

> When a private client (192.168.1.2) sends a packet to the same place,
> the packet arriving on the LAN_IFC ... gets SNAT'ed by the gateway and sent
> out the WAN_IFC to the internet looking like this:
>    source address: WAN_IP = 209.217.118.226
>    source port: 123
>    destination address: time.nist.gov = 192.43.244.18
>    destination port: 123

Yup - I agree with that as well.   The netfilter code will not change the 
source port of a packet unless that source port is already bound to an 
existing connection.

> Because the port wasn't remapped, there appears to be ambiguity
> in whether the reply packet should be routed to the private host
> (192.168.1.2) or the NTP server process on the router.

If there is a connection tracking table entry (because the packet came from a 
LAN client) then the reply packet will be routed back to the client.   If 
there isn't, then it won't be.   I see no opportunity for ambiguity because 
netfilter is stateful.

I do not think that netfilter will ever get "confused" about whether a reply 
packet is in response to a locally-generated request, or a NATted connection 
from a LAN client machine.   The gateway which you are running netfilter on 
will always keep an accurate record of (a) locally-bound ports, and (b) 
connection tracking table entries for packets originating elsewhere.

What makes you think that netfilter is getting anything wrong?   Are you 
seeing packets in LOG entries which do not seem to correspond to current 
connections?   If you are simply seeing connections not succeeding from time 
to time, do keep in mind that this is UDP we're talking about, which although 
is strictly known as User Datagram Protocol, can be fairly accurately 
interpreted as Unreliable Datagram Protocol (unlike TCP, which is a reliable 
service).

Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


