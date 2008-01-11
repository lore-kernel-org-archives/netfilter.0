From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: Is there a way to DROP on OUTPUT without returning EPERM?
Date: Fri, 11 Jan 2008 09:51:40 +0100
Message-ID: <m3myrciw2r.fsf@ursa.amorsen.dk>
References: <20080110213605.GA14931@club.cc.cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Mike Kasick <mkasick-nf@club.cc.cmu.edu> writes:

> iptables -A OUTPUT -o eth1 -m statistic --mode random --probability 0.5 -j DROP
>
> has the side effect of returning EPERM for write/send syscalls for which
> packets are dropped.

It would make more sense if DROP dropped silently and REJECT returned
EPERM. Hard to fix now, of course.


/Benny


