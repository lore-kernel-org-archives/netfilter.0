From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: dhcrelay-*-*-*-*-*-*-*-
Date: Sat, 29 Nov 2003 23:04:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311292304.40538.JALaramie@Loudoun-Fairfax.com>
References: <1070150706.3fc93432d9526@paris-hme1> <200311292140.11754.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311292140.11754.Alistair@nerdnet.ca>
Content-Disposition: inline
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

On Saturday 29 November 2003 21:40, Alistair Tonner wrote:
> On November 29, 2003 07:05 pm, zynkx wrote:
> > dhcrelay howto is no big deal you know... ;)
> >
> > gonna put it all to accept to see how it goes and i'll
> > let you all know ;)))
>
> 	ummm..
> 	dhcp uses tcp/udp 67 + 68 does it not folks?
> 	and somethling like 547 for ipv6?

Hmm, bootstrap=dhcp=tcp/udp 67:68 ? I thought dhcp ran on a lower protocol  
level than tcp/ip, but if this is true then this should work.

>
> 	iptables -A INPUT -p tcp  -s ${client ip range} -d 255.255.255.255 -m
> multiport --dport 67:68 -j ACCEPT
>
> 	iptables -A INPUT -p udp  -s ${client ip range} -d 255.255.255.255 -m
> multiport --dport 67:68 -j ACCEPT
>
>         and appropriate equivalient rules on the OUTPUT chain should make
> this work shouldn't it?

Sounds like a winner to me! synkx: Does it work?

Jeff

