From: Andrew Beverley <andy@andybev.com>
Subject: Re: Prioritizing IPs on interface with multiple addresses
Date: Sun, 28 Oct 2012 08:33:13 +0000
Message-ID: <1351413193.2740.10.camel@andylaptop>
References: <CAKfDRXiAL37+H2k0SepwmUzYv4chtKr_Fn0CQSFt2UV5NejsUw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKfDRXiAL37+H2k0SepwmUzYv4chtKr_Fn0CQSFt2UV5NejsUw@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1351413196;
	bh=Zh+6sW8qlARRG+5VAOFXDYWx/X1EhMtlkxlrzSEmnFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=PyNfT1GHR5dXoGD1QPTWDGXIPou5Uq/QGgtky00E6Ma6+uUabBeNe8uwI4eOK4wbg
	 UdYU3zp35erwsaPENxMNr910u5LJKuAjNO56URQKAXV3OcUO/kb4DCl0+btCau29fF
	 yK7rjjKRiIqYfmq3++xqge+MePZEED9n2Pi+IGv0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kristian Evensen <kristian.evensen@gmail.com>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org

On Mon, 2012-10-22 at 11:36 +0200, Kristian Evensen wrote:
> Hello,
> 
> I am currently working on configuring an embedded system that will be
> used as an access point for other devices. In order to reduce the
> number of external devices, we want to connect the LAN on the embedded
> system to a switch. Then, two separate networks will also be connected
> to this switch, and the LAN interface assigned one IP from each
> network. The IPs are static and network addresses are not overlapping.
> One interface is the main interface for all traffic from clients,
> while the other is used as fallback and for some monitoring traffic.
> The clients that connect to this AP will be assigned IPs using DHCP
> and traffic from them will be NAT'ed.
> 
> Initially, this setup works fine. The devices connected to this AP are
> able to send traffic through the intended network and to the correct
> hosts. If I disconnect from the main network, the routing tables are
> updated and traffic is routed through the secondary network. However,
> when I connect to the main network again, things break. The problem is
> that there is an inconsistency between the order in the routing table
> and the order of IP addresses assigned to the interface, which causes
> problems when I do NAT (MASQUERADE). The default route (with the
> lowest metric) points to the main network, but the first IP address
> belongs to the secondary network. So what happens is that the packets
> have the MAC-address of the first hop in the main network, but a
> source IP address from the second network (chosen by the NAT). This
> causes the traffic to be discarded by the network. Deleting (and then
> later adding) the IP of the secondary network is not an option as it
> is needed for the monitoring traffic.

I have to admit that I'm struggling to get my head round this, and I
suspect others are as well given lack of replies. Could you provide an
ascii diagram and either write more succinctly or try and simplify the
problem you are having? 

> My question is, is there some way to prioritize the different IP
> addresses assigned to an interface? For example, is there an
> equivalent to a metric, index or something similar?

That said, I don't know if there is any way of doing this. Can you not
achieve it with iptables rules and SNAT?

>  Based on my
> understanding, ip addr is only able to append addresses.

Well it can delete them as well, or have I misunderstood?

> Another soulution would be to monitor network events and create/delete
> SNAT rules on-demand, but this is a big hack if you ask me and I would
> like to try to avoid it.

Ah, you've already thought of SNAT. Is there not a way of doing it
without adding and deleting rules? For example can you use packet
marking somehow?

Andy


