From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: Re: help: ip_nat_pptp/ip_nat_conntrack
Date: Mon, 26 May 2003 15:26:22 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <025801c32358$1bcb2c20$6400a8c0@homes>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CDF@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

thanks... it helps.

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>;
<netfilter@lists.netfilter.org>
Sent: Monday, May 26, 2003 1:08 PM
Subject: RE: help: ip_nat_pptp/ip_nat_conntrack


patch-o-Matic. downloaded seperately to netfilter and you must get the same
one as the source of iptables downloaded..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698


-----Original Message-----
From: Voltaire Pascual [mailto:voltaire@voltaire.servebeer.com]
Sent: Monday, May 26, 2003 2:56 PM
To: netfilter@lists.netfilter.org
Subject: help: ip_nat_pptp/ip_nat_conntrack


Hi there,

do you know where to find ip_nat_pptp/ip_conntrack_pptp  patches for kernel
2.4.20? I tried searching in google but didn't find any good guide for
newbie. The reason why im doing this is to allow my private network to
connect to the VPN simultaneously.

I have these files installed but can I ask your help how to install these as
modules?

"/usr/src/linux-2.4.20/net/ipv4/netfilter"
ip_nat_pptp.c
ip_conntrack_pptp.c

I cant find "pptp connection tracking" support in "make
menuconfig/Networking Options/Netfilter Configuration"

Appreciate your help.

/TIA.
VP.




