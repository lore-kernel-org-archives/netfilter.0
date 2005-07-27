From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: Re: QoS and IPSec...
Date: Wed, 27 Jul 2005 10:23:33 +0530
Message-ID: <42E7134D.3090809@multitech.co.in>
References: <42E6D57B.6050109@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E6D57B.6050109@riverviewtech.net>
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
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Hi Grant,

Add IPTABLE rules in the FORWARD mangle to handle the normal packets ( 
ICMP,etc) with specific mark values and add filters for the same .
As far as IPSEC traffic is concerned,  its generally generated from the 
box, unless its acting as an IPSEC pass thru. Hence u can add rules in 
the POSTROUTING chain to mark all AH/ESP packets with some mark value. I 
believe since IPSEC packet is generated from the box, the source ip will 
be that of the incoming interface..... Not sure about this!!!!

Hope this helps.

Regards,
Vinod C

Grant Taylor wrote:

> Hi, I have what to me is an interesting issue.  I am wanting to 
> prioritize (QoS) traffic that will be passing through an IPSec 
> (OpenS/WAN) VPN between two (identical) Linux routers.  I know that I 
> can apply the IPSec patches (1-4) to the kernel and IPTables (if they 
> are not already applied by now) filter traffic before and after IPSec 
> encapsulation.  My problem is that I don't know if I will be able to 
> QoS the traffic that will be encapsulated as far as I know QoS 
> prioritization (via CBQ or HTB) only applies to traffic that is being 
> dequeue from the skbuffers to go out the physical interface.  In my 
> mind the traffic that is to be encapsulated does not ""go out a 
> physical interface to be dequeued in the order that I want to 
> prioritize.  I know that I can QoS IPSec VPN traffic (IP/ESP) to a 
> higher priority than any other IP traffic but I'm not sure about the 
> traffic that is being encapsulated.  My (very) rough idea is to use 
> something like dummy net or IMQ to provide an interface (or subnet if 
> need be) that the traffic will traverse and be dequeued from where I 
> can apply the QoS that I want to.  I'm not quite sure how to go about 
> this so any advice would be greatly appreciated.
>
> I would like to QoS / Prioritize LAN traffic that is destined to the 
> other LAN based on the type of traffic that it is (ICMP, RDP, RFB, 
> SMB, etc) before it is encapsulated.  Once the traffic has been 
> encapsulated I'd like to QoS / Prioritize the ESP traffic that is 
> destined to the other LAN's globally routable IP before any other 
> internet traffic goes out.  This later part is not the problem, just 
> the former part.
>
> My network layout(s) are below for those of you that will be asking:
>
> Lan A:
> - 172.30.12.x/24 subnet
> - 172.30.12.1-250 client systems and the likes
> - 172.30.12.254 is the default gateway which will be replaced by one 
> of the boxen I'm asking about.
> - A.B.C.Z/24 globally routable IP on the router
>
> Lan B:
> - 172.30.13.x/24 subnet
> - 172.30.13.1-250 client systems and the likes
> - 172.30.13.254 is the default gateway which will be replaced by one 
> of the boxen I'm asking about.
> - A.B.C.Y/24 globally routable IP on the router
>
> VPN:
> - The VPN in question will be between the A.B.C.Z and A.B.C.Y globally 
> routable IP addresses.
>
> Note that both LANs have a DSL circuit from the same provider and thus 
> are 1 IP off from each other on their globally routable IP.
>
>
> Grant. . . .
>
> P.S.  I'm (cross) posting this to the NetFilter mail lists as I've 
> seen some very complex questions and answers on the LARTC and 
> NetFilter mail lists and I would like to pull from both pools of 
> talent.  So be mindful when replying to all.  ;)
>


