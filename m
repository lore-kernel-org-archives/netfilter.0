From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Wed, 11 Jan 2012 19:25:11 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ye Liu <yeliu@carmelvision.com>
Cc: netfilter@vger.kernel.org, Dov Berliner <dov@carmelvision.com>

On Wednesday 2012-01-11 19:20, Ye Liu wrote:

>Hi there,
>
>I need to setup iptables rules to tee the traffic, so I've tried to
>add the following rule:
>$> iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xxx.xxx.xxx
>But the command gives an error, says
>$> iptables: Invalid argument. Run `dmesg' for more information.

xxx.xxx.xxx.xxx is of course not a valid IP address.
