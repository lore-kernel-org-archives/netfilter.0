From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Thu, 20 Dec 2012 10:54:24 -0500
Message-ID: <201212201054.25174.neal.p.murphy@alum.wpi.edu>
References: <50D01F13.7030707@nottheoilrig.com> <50D2C156.2050801@nottheoilrig.com> <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, December 20, 2012 03:18:43 AM Jan Engelhardt wrote:
> On Thursday 2012-12-20 08:42, Jack Bates wrote:
> >>> with "iptables -i br-lan:1" but I discovered that --in-interface
> >>> doesn't support aliases (I guess this makes sense, traffic doesn't
> >>> reference the IP of
> >>> the next hop, so how can you tell which alias it arrived on?)
> >> 
> >> Obviously, using the iptables -d option.
> >
> >--destination is the ultimate destination. The default gateway for the
> >proxy is 192.168.1.84, so when it makes a request to the origin server,
> >it forwards it to 192.168.1.84 (--destination is 12.34.56.78)
> >
> >I think iptables can't tell whether the request was forwarded to
> >192.168.1.1 or 192.168.1.84, so it can't tell whether it arrived on the
> >"br-lan" interface or the "br-lan:1" alias?
> 
> It is not an iptables problem.
> 
> The question is, how do you define "arriving on br-lan:1"? That is,
> looking only at one Ethernet packet, how would you tell it is "for
> br-lan:1" rather than for br-lan? Open a hexdump, tell me which byte(s)
> shall represent "br-lan:1".

You can... Hmmm... The packet from the proxy to internet (via the gateway) 
doesn't contain 192.168.1.84, does it?

Perhaps the only way to make such a scheme work would be to add a second 
primary address (i.e., in another subnet) to br-lan and to the proxy's NIC. 
Assuming the existing netmask is /24, one could
  ip addr add 192.168.2.1/30 dev br-lan
on the gateway and
  ip addr add 192.168.2.2/30 dev ethN
on the proxy system, then tell the proxy to use 192.168.1.84 on its internal 
side and 192.168.2.2 on its external side. Now netfilter can differentiate the 
traffic using the source address. But now netfilter need do nothing because 
simple routing properly directs the packets.

I'd say you're right. It more closely resembles an addressing/routing issue 
than it does a packet filtering issue.
