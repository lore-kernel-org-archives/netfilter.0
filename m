From: Steve Mickeler <steve@warning.ca>
Subject: Re: ROUTING thru two LINKs problem
Date: Wed, 12 Mar 2003 00:06:49 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303112356010.13050@gypsy>
References: <1047426450.3e6e759219a53@www.spsul.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1047426450.3e6e759219a53@www.spsul.com.br>
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
To: alexb@atix.com.br
Cc: netfilter@lists.netfilter.org


use iptables to mark the incoming packets and use iproute2 to route the
packets back out based on the mark

Somthing like this should work:

iptables -t mangle -i eth0 -j MARK --set-mark 11

ip rule add fwmark 11 table ISP1


> How can I route back thru ISP1(eth0) ONLY the packets of conections that first
> started over eth0 ?
>
> Thanks for any help
>
> Alex
>

