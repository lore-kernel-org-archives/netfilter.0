From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Changes in kernel >= 2.4.20 ?
Date: Mon, 17 Nov 2003 08:31:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311170831.21117.Alistair@nerdnet.ca>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
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
To: Martin Petruzzi <m.petruzzi@bluewin.ch>, netfilter@lists.netfilter.org

On November 17, 2003 05:06 am, Martin Petruzzi wrote:
> Hello
>
> Apparently there have been changes in kernel since 2.4.20 concerning
> netfilters. NAT, masqerading, forwarding or whatever it is called does not
> work the same as before. I have the rules as following:
>
> #!/bin/bash
> /sbin/modprobe iptable_nat
> /opt/sbin/iptables -F
> /opt/sbin/iptables -X
> /opt/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward



	Running slackware and 2.4.x kernels, I have NOT had to change my iptables 
rules from 2.4.9 through 2.4.22. on iptables 1.2.7a
	I have yet to upgrade to latest iptables ... but note that this is likely a 
kernel config issue.   ... perhaps tcp_ecn got turned on somewhere?
	ipmtu issue maybe? are you on DSL?




> ...
> and so on.
>
> This worked perfect with kernels < 2.4.20. Now I'm on 2.4.22 and NAT only
> works partially. The system is RH7.2. I tried the latest iptables from
> updates.redhat.com and also compiled the latest from netfilter.org. I had
> no errors at all, nor while compiling (kernel/iptables) neigther while
> installing or inserting the roules.
>
> The behaviour is:
> - ftp works fine
> - http works partially (i.e. google works but most websites do not).
> - ssh connections do work, certain commands ok, but for example "last"
> hangs.
>
> This behaviour is reproducable.
>
> Latest iptables also work fine with older kernel (that's how I run it now).
>
> Any idea, what the problem is? What do I need to change?
>
> Thank you very much.
>
> Martin

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

