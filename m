From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: HELP: how to block faked RST packet
Date: Sat, 12 Jun 2010 16:32:11 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006121631210.19078@obet.zrqbmnf.qr>
References: <AANLkTin10l7SVMgOS6SUU8IZruGsbjrJoopVqn6uZtCP@mail.gmail.com> <AANLkTikRgRaIUe4WLIJanGp0Q8et1LXYJHu0PyyjFwc2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikRgRaIUe4WLIJanGp0Q8et1LXYJHu0PyyjFwc2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narendra Choyal <narendrachoyal@gmail.com>
Cc: =?UTF-8?B?6LW15pum?= <pagonz@gmail.com>, netfilter@vger.kernel.org

On Saturday 2010-06-12 16:12, Narendra Choyal wrote:

> iptables -A INPUT -p tcp -i eth0 --tcp-flags ACK,SYN,FIN,RST,URG,PSH
>RST -j DROP
>
>if you are using above iptable rule then this will stop breaking of
>the the connection, like if you make a ssh connection then this will
>not break connection.

This is flawed, it basically ignores any RST, which means connections 
will hang around for until they timeout. And that in turn, can be 
up to 5 days.
