From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Kernel, IPTables or Router Anomaly? Maybe me?
Date: Fri, 31 Oct 2003 14:18:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031191842.GA30613@cannon.eng.us.uu.net>
References: <1067611776.1427.47.camel@main.tqmcube.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1067611776.1427.47.camel@main.tqmcube.com>
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
Content-Transfer-Encoding: 7bit
To: "David C. Hart" <DCH@TQMcube.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

You have three interfaces on the same 192.168.0.0/24. Why?

On Fri, Oct 31, 2003 at 09:49:37AM -0500, David C. Hart wrote:

> I can't figure this out.
> 
> Our server has three internal IP addresses on two interfaces. So we have
> eth0, eth0:1 and eth1.
> 
> "Oct 31 09:24:47 mail2 kernel: FIREWALLED: IN=eth1 OUT=
> MAC=00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 SRC=217.97.25.71 DST=192.
> 168.0.5 LEN=404 TOS=0x00 PREC=0x00 TTL=111 ID=40607 PROTO=UDP SPT=6022
> DPT=1434 LEN=384"
> 
> In this case, destination 192.168.0.5 is on eth0:1. Yet it shows as eth1
> with the eth1 MAC. This connections was NATed through the router so it
> never hit the eth1 interface. Here's part of the ifconfig.
> 
> eth0      Link encap:Ethernet  HWaddr 00:50:04:65:E3:1B
>           inet addr:192.168.0.31  Bcast:192.168.0.255 
> Mask:255.255.255.0
> 
> eth0:1    Link encap:Ethernet  HWaddr 00:50:04:65:E3:1B
>           inet addr:192.168.0.5  Bcast:192.168.0.255  Mask:255.255.255.0
> 
> eth1      Link encap:Ethernet  HWaddr 00:09:5B:22:29:D1
>           inet addr:192.168.0.32  Bcast:192.168.0.255 
> Mask:255.255.255.0
> 



