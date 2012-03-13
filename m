From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: comments about local loopback interface rule granularity
Date: Tue, 13 Mar 2012 16:06:16 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1203131605200.6346@frira.zrqbmnf.qr>
References: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-03-13 15:28, paddy joesoap wrote:

>Hi all,
>
>What is the correct local loopback iptables rules for a single hosted
>firewall (laptop)?
>
>I often see the following:
>
>iptables -A INPUT -i lo -j ACCEPT
>iptables -A OUTPUT -o lo -j ACCEPT
>
>where a default DROP policy is applied to both INPUT and OUTPUT chains.
>
>I notice with this configuration I can ping the localhost (as
>expected) but I also can ping the local IP address of the machine!

Well that's the whole point of loopback.

>Why is this this the case with respect to the local IP address?
>
>Is this the correct set of rules?

No, because your local host has more addresses than just 127.0.0.1/32,
and they very well want to be accessible.

