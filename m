From: "Martin Djernaes" <martin@djernaes.dk>
Subject: RE: (newbie) SNAT woes
Date: Fri, 8 Aug 2003 06:14:06 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1941.12.232.115.115.1060316046.squirrel@mail.djernaes.dk>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C079@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C079@wardrive.citadelcomputer.com.au>
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
To: georgev@citadelcomputer.com.au
Cc: martin@djernaes.dk, netfilter@lists.netfilter.org

Hi,

Some pepole have helped me off the list and even though it all looked
strange and I don't know what happened, it's working now!

> What you've missed is that tcpdump and other utilities work on different
> layers and if I'm not wrong (hopefully not) it's seeing the packets
> before the SNAT.

tcpdump works below ipfilter, so I see what comes out of the filter.

> Also, better to use MASQUERADE rather than SNAT for workstation access
> to the internet.

Why? ... what I have read made me beleive that SNAT was prefered when ever
possible, but I would be happy to hear something else.

Martin

> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
>
> -----Original Message-----
> From: Martin Djernaes [mailto:martin@djernaes.dk]
> Sent: Friday, August 08, 2003 12:15 AM
> To: netfilter@lists.netfilter.org
> Subject: (newbie) SNAT woes
>
>
> Hi,
>
> I realise that you have seen mails like mine lots of time before, but I
> have spend hours reading howtos and googling for some hint as to why my
> very simple setup doesn't work.
>
> I have a simple box which just is suppose to do normal NATing of
> outgoing traffic so it uses the public IP address.
>
> I thought that I had it all setup right (that was at least what I
> understood from everything I read), so here is my nat table:
>
> # iptables -t nat -v -L
> Chain PREROUTING (policy ACCEPT 1774 packets, 193K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain POSTROUTING (policy ACCEPT 1443 packets, 77156 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 SNAT       all  --  any    eth1    anywhere
> anywhere           to:11.22.33.44
>
> Chain OUTPUT (policy ACCEPT 317 packets, 23092 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Now if I ping an external IP address from another box on the "inside"
> and run "tcpdump -ni eth1" on the gateway box, I will see the source
> address being unchanged! (and I don't get an icmp echo reply back).
>
> So what did I miss? Isn't it just a oneliner to turn SNAT on?
>
> Martin




