From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Route packets from an interface to another
Date: Mon, 10 Sep 2007 10:23:20 -0500
Message-ID: <46E56168.4010909@riverviewtech.net>
References: <930617.62310.qm@web33307.mail.mud.yahoo.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <930617.62310.qm@web33307.mail.mud.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 09/10/07 07:18, vinod K D wrote:
> My gateway has two network interfaces: eth0 & eth1.
> 
> eth0 (192.168.1.1) is connected to public network and eth1 (10.0.1.1) 
> is connected to LAN.
> 
> MyServer, which is in the LAN, has ip 10.0.1.2.

Ok, reasonable enough.

> I created a virtual interface eth0:0 (192.168.1.2) in the gateway. 
> Using ipvsadm, I can route the packets, destined for this IP address 
> and a port,  to myServer.
> 
> And in myServer, I enabled ip_forwarding and assigned 192.168.1.2 for 
> the loopback interface.  So my server application receives and serves 
> the packets properly.

I'm surprised that having the 192.168.1.2 address on the loopback 
interface is working as expected at all as the kernel will usually 
protect the loopback interface from any thing not local to the system.

> The problem is in the return path. (Remember the packets have source 
> addres 192.168.1.2). While they reach the gateway, the packets are 
> being dropped.

*nod*  You will indeed have some reverse path issues to work out.

> (I think, the reason is nothing but the address 192.168.1.2 is 
> assigned to the gateway. Hence router assumes the packets are 
> traversing though a loop.)

*nod*

> I can't use masquerading, because I need to get the source & 
> destination IPs of the packets.

Ok...

I have to ask, why does your server have a private class C address on 
its external interface?  Either you are doing something weird and your 
external is not external to the internet or you are already in a 
situation where the packets have been modified as you are trying to 
avoid.  I'm just saying / opening the door for an answer.

> Can anyone suggest a way to redirect packets from an interface to 
> another (ie, eth1 to eth0) without making any change in the packet 
> header.

Why redirect the packets at all.  Why not let the packets come in 
directly to the router?

I'd suggest that you turn your router in to a bridging router.  I.e. 
bridge traffic to / from 192.168.1.2 through eth0 and eth1 while routing 
192.168.1.1 traffic for your LAN?  This way your server would have 
192.168.1.2 bound to its NIC and be able to reply directly to the world 
with out any problem at all.  If you are worried about not having a 
firewall, you can easily do either EBTables (layer 2) or IPTables (layer 
3) on the bridged (layer 2) traffic so your system will still be protected.

Do some light reading of section 7 of the following page: 
http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section7  I think 
this will help depict what I'm talking about.

> PS: The latest versions of netfilter doen't have inbuilt ipt_ROUTE 
> module. Else my life would be cool.




Grant. . . .

