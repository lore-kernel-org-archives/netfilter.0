From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: monitoring with iptables question
Date: Tue, 23 Sep 2008 09:27:05 +0200
Message-ID: <200809230927.07368.vladislav.kurz@webstep.net>
References: <16d377d70809221125l5e3195cage4035a92352577d8@mail.gmail.com> <1222109240.3502.50.camel@pauloric.contatogs.com.br> <16d377d70809222334i2c5c506aj4c41e31339095efa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <16d377d70809222334i2c5c506aj4c41e31339095efa@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday 23 of September 2008, Aleksej wrote:
> Thanks for the links, I'm reading it now, but there is a lot of
> information... My problem is that I don't know how much available bandwidth
> I have (this is about wireless networks). Otherwise I could just calculate
> the total throughput on the interface and see if there is some free
> bandwidth left. Can one with linux traffic control tools or iptables derive
> the load of interface/queue? The only thing I need to know is whether the
> output transmission queue can cope with all the traffic waiting for
> transmission, in other words, is the queue full loaded or not.

Maybe something like this would show what you are looking for:

tc -s qdisc show dev eth0

iptables count packets that hit certain rules, but tc counts packets that hit 
the outgouing queue on interface. That might help you. Anyway read lartc.org.

-- 
Regards
        Vladislav Kurz
