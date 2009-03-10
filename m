From: Erik Wasser <erik.wasser@iquer.net>
Subject: iptables bad byte counter?!?
Date: Tue, 10 Mar 2009 10:26:48 +0100
Message-ID: <200903101026.48807.erik.wasser@iquer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I'm quoting here a real old message from the netfilter-devel list:

> Subject: iptables bad byte counter?!?
> From: Torge Szczepanek
> Date: 05 Jun 2002 21:07:35 +0200

You can find the complete mail here: 
http://lists.netfilter.org/pipermail/netfilter-devel/2002-June/008038.html

Torge got problems with the byte counter during the output of the logged 
traffic. I've got the same problems here to. Here's an example line 
of "iptables --list --verbose --numeric --exact":

> Chain INPUT (policy ACCEPT 2086 packets, 252096 bytes)
>     pkts      bytes target     prot opt in     out...
> 18446744073709551148 18446744073709508226 ACCEPT   all  --  eth0 *...
> 18446744073709548061 18446744073708196250 ACCEPT   all  --  *    *...

These values are of course ridiculous for a 5 minute interval. In the 
normal case the output looks like this:

> Chain INPUT (policy ACCEPT 3458 packets, 421710 bytes)
>     pkts      bytes target     prot opt in     out...
>    16886  1481496 ACCEPT     all  --    eth0   *...
>    20932  2638562 ACCEPT     all  --    *      *...

I'm using kernel 2.6.18-92.1.17.el5 and iptables-1.3.5-4.el5 on a cent 
os 5.2 computer (x86_64)

The last comment to the original mail was the followng:

> no, this is clearly a problem within the 32bit-userspace / 64bit
> kernelspace handling of iptables.

Is that true? The original report of this "bug" is 7 years ago. 
Shouldn't it be fixed since then? What is the causing this 
misunderstanding? Is this bug fixable?

-- 
So long... Fuzz
