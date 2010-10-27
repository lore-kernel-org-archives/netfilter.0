From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: newbie: forward rule to itself
Date: Wed, 27 Oct 2010 21:17:28 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010272116580.19157@obet.zrqbmnf.qr>
References: <4CC8774C.1070908@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC8774C.1070908@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-10-27 21:02, Mauricio Tavares wrote:

> 	Let's say I have server1 with two ports, eth0 and eth0, and server2
> whose eth0 port is connected to server1's eth1. And let's say the subnet
> between them is 192.168.1.0/24 while the one server1's eth0 is connected to is
> 192.168.4.0/24.
>
> I have the following rules to forward port 6969 coming on eth0 on server1 to
> port 6969 on server2's eth0:
>
> iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to
> 192.168.1.server2:6969
> iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state NEW
> --dport 6969 -j ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> Any machine in 192.168.4.0/24 seems to be able to get to server2 by using
> 192.168.1.server1:6969. But, if I try to connect to 192.168.1.server1:6969 on
> server1 itself, I will not be forwarded to server2. What am I missing here?

That prerouting only applies to packets coming from devices connected to
the machine.
