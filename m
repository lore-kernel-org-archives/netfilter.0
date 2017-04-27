From: Kevin <kmg952@bigpond.com>
Subject: Re: SYN packet "disappears"
Date: Fri, 28 Apr 2017 09:15:04 +1000
Message-ID: <15557807.XA8vn6p98F@giles>
References: <1538022.l5gG4X5sYW@giles> <9E4BD412-E2B1-48BB-ABDD-90C70ADB0DFC@familie-kuntze.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9E4BD412-E2B1-48BB-ABDD-90C70ADB0DFC@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

On Friday, 28 April 2017 1:08:27 AM AEST Noel Kuntze wrote:
> Am 27. April 2017 07:21:14 MESZ schrieb Kevin <kmg952@bigpond.com>:
> >Hi,
> >
> >I'm having trouble changing my iptables configuration to work with a
> >new
> >NordVPN/OpenVPN.
> >
> >In trying to diagnose the problem, I have saturated my firewall with
> >"-j LOG"
> >rules. The problem is that the initial SYN packet to TCP port 22 seems
> >to go
> >missing between the "nat prerouting" and the "mangle input" chains.
> 
> That's where the routing decision is and the rp_filter. It likely drops the
> packets because they're martians. That's a good thing. Fix your routing on
> the host.

That was the problem! I was not aware of rp-filter. As I'm running Fedora I've 
echo'd 2 to the relevant /proc rp-filter files.

Sadly, that hasn't solved my initial problem - but that's not an iptables 
problem.

Thanks for your help - all I needed was that one keyword.

Kevin

