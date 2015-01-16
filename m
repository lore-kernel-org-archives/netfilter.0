From: The Media Server <info@themediaserver.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 09:03:56 -0500
Message-ID: <CAJb3rWABudBLX1px44Ew-0VbdR-9erPuv351ddgevwzTDs5_ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Glad to hear that you found a solution.
> That setting must be a new one as my other system (Debian 7) doesn't know about it.

Yes it is just on Ubuntu 14.10...

On 14.04, I don't have this option and the fwmarking doesn't work.

Does this mean that on 14.04 and xmbcbuntu we would have to re-compile
the kernel with this option to make it work?

> What do you want to achieve with these rules ?

I was just testing the marking.. My ultimate goal was to bypass a VPN
on some port on ubuntu

I found the solution if you check the previous post, it was a kernel
option by default off:
net.ipv4.tcp_fwmark_accept=0

Thks for the support!
--
themediaserver.com
