From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Multiple Internal Networks
Date: Thu, 26 May 2011 00:28:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105260027130.20213@frira.zrqbmnf.qr>
References: <BANLkTik71rCYn0hQ1CavBmDGo_1NtZX0aA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTik71rCYn0hQ1CavBmDGo_1NtZX0aA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-05-26 00:01, Aaron Clausen wrote:

>I just can't wrap my head around this one.
>
>What I have is a router with three interfaces:
>
>eth0 - External interface (IP address retrieved DHCP)
>eth1 - Internal interface (trusted) - can access Internet and anything
>on eth2 network
>eth2 - Internal interface (untrusted) - can only access Internet
>
>What the heck is the iptables commands to get this to work?

This does not look like an iptables issue.
