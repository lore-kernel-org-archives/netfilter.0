From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: TOS problem
Date: Wed, 5 Mar 2003 14:55:13 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303051453490.24841@dns.toxicfilms.tv>
References: <3e65f3f1.49d8.0@unacs.bg>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3e65f3f1.49d8.0@unacs.bg>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nedco@unacs.bg
Cc: netfilter@lists.netfilter.org

> on tcpdump get
> 02:36:44.898854 62.176.107.193 > 62.73.77.8: icmp: echo request
> 02:36:44.956965 62.73.77.8 > 62.176.107.193: icmp: echo reply [tos 0x10]
>
> Am I doing something wrong?
tcpdump on a different machine, if you're tcpdumping on a the iptables
machine tcpdump gets a copy of the packet, then it is mangled, so tcpdump
won't show that.

Regards,
Maciej


