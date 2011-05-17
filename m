From: Ed W <lists@wildgooses.com>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 14:04:20 +0100
Message-ID: <4DD27254.1090706@wildgooses.com>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu> <4DD256F7.7050007@googlemail.com> <fbc9abc624824c8e6f973c342e81fe51@visp.net.lb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fbc9abc624824c8e6f973c342e81fe51@visp.net.lb>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denys Fedoryshchenko <denys@visp.net.lb>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

On 17/05/2011 12:14, Denys Fedoryshchenko wrote:
> Especially it is a problem for source based distributions, like gentoo,


I know there was a debate about this on the gentoo-hardened list
recently, but my opinion is that one needs to start "enabling" (as in
it's installed/compiled in) IPV6 code on all systems ASAP and start
flushing out problems.  That said I think it's also fair to lock
down/disable/minimise your use of the IPV6 to whatever is appropriate to
your environment/requirements, but having the code there, compiled into
production systems and starting to test it would seem to be very prudent
right now?

Just add USE="+ipv6" to your make.conf, "emerge --newuse -uvDkp world"
and off you go...

Good luck

Ed W
