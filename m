From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 15:51:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4093FFB3.9060502@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405010819.30079.Antony@Soft-Solutions.co.uk> <4093E190.8020308@isoar.ca> <200405011905.30495.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405011905.30495.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Saturday 01 May 2004 6:42 pm, Andrew E. Mileski wrote:
>>There is only one rule needed if all other defaults are ACCEPT:
>>
>>This one is on my network:
>>iptables -t nat -A POSTROUTING -s ! $WAN_IP -o $WAN_IFC -j SNAT
>>--to-source $WAN_IP
> 
> What is $WAN_IP, and what are the IP addresses on the machine on which this 
> rule is running?

LAN is a private network:
   LAN_IFC=eth0
   LAN_NET=192.168.0/24
   LAN_IP=192.168.1.1

WAN is the internet:
   WAN_IFC=eth1
   WAN_NET=209.217.118.0/29
   WAN_IP=209.217.118.226

> I still don't really understand why you need a SNAT rule on a machine which is 
> running the service locally?

The machine is a gateway to the internet as well.  The gateway has to
use SNAT to allow private hosts to reach the internet for other
services, like say HTTP.  Private hosts are not restricted to the
services provided by the gateway.

> Please give a clear explanation of where the client is, where the server is, 
> and why you want a SNAT rule in the system.   Also, please explain what is 
> "ambiguous" about all this, as you described it - I don't understand what you 
> mean by that in this context.

A private host (192.168.1.2) on a private network (192.168.1.0/24) that
is contacting a remote server on the internet.

I used the term "ambiguous" to attempt to describe the situation I'm
seeing where there are two possible destinations for a reply packet
coming from the internet.  The packet can be routed to the server
process on the gateway machine, or to a private host.

As I've stated I'm unclear on exactly what is happening, so don't
attribute too much weight to it or my phraseology.  I'm attempting to
put words to a process I can not yet fully understand or explain.  My
appologies for this.

For example:

The NTP server process on the gateway sends a UDP packet to a NTP server
on internet, let's say time.nist.gov.  The packet sent out WAN_IFC has:
   source address: WAN_IP = 209.217.118.226
   source port: 123
   destination address: time.nist.gov = 192.43.244.18
   destination port: 123
A reply packet from time.nist.gov arrives on WAN_IFC with:
   source address: time.nist.gov = 192.43.244.18
   source port: 123
   destination address: WAN_IP = 209.217.118.226
   destination port: 123

When a private client (192.168.1.2) sends a packet to the same place,
the packet arriving on the LAN_IFC has:
   source address: private client = 192.168.1.2
   source port: 123
   destination address: time.nist.gov = 192.43.244.18
   destination port: 123
This gets SNAT'ed by the gateway and sent out the WAN_IFC to the
internet looking like this:
   source address: WAN_IP = 209.217.118.226
   source port: 123
   destination address: time.nist.gov = 192.43.244.18
   destination port: 123
A reply packet from time.nist.gov arrives on WAN_IFC with:
   source address: time.nist.gov = 192.43.244.18
   source port: 123
   destination address: WAN_IP = 66.11.173.24
   destination port: 123
Because the port wasn't remapped, there appears to be ambiguity
in whether the reply packet should be routed to the private host
(192.168.1.2) or the NTP server process on the router.

-- 
Andrew E. Mileski

