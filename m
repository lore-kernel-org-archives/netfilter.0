From: Steve Mickeler <steve@neptune.ca>
Subject: Re: forward is not forwarding
Date: Fri, 6 Sep 2002 01:41:49 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209060140001.413-100000@triton.neptune.on.ca>
References: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
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
To: Abraham Kim <Abraham.Kim@veritas.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


Did you enable IP forwarding at the kernel level ?

what does "cat /proc/sys/net/ipv4/ip_forward" show ?

If 0, then you need to enable IP fowarding by doing this:

echo 1 > /proc/sys/net/ipv4/ip_forward


On Fri, 6 Sep 2002, Abraham Kim wrote:

> Just installed RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.
> Added 2 rules in FORWARD, but I can't ping from 10.1.1.2 to 192.168.1.2,
> vice versa.
> (those 2 are Sun machines, got default route to 10.1.1.1 and 192.168.1.1
> each)
>
> iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
> iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT
>
> Did I miss anything simple here?
> Should I arrange a routing module separately?
>
> Thanks in advance,
> Abraham
>



[-] Steve Mickeler [ steve@neptune.ca ]

[|] Todays root password is brought to you by /dev/random

[+] 1024D/9AA80CDF = 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF


