From: <lists@sterenborg.info>
Subject: Re: sync flood and resource utilization .
Date: Sat, 27 Feb 2010 08:09:00 +0100
Message-ID: <1267254540.12006.10.camel@kushiel.sterenborg.org>
References: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sat, 2010-02-27 at 11:05 +0530, ratheesh k wrote: 
> iptables -A INPUT -j  DROP .
> iptables -A OUTPUT -j ACCEPT
> 
> When i syn flooded my desktop . I can see all pkts are getting
> rejected by the rule . But system becomes slow beacuse of this . Is
> there any way to make system fast ? will black listing will help ?

IIRC syn_cookies were meant to deal with that.

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

http://www.securityfocus.com/infocus/1729
http://www.unixresources.net/linux/lf/57/archive/00/00/09/85/98546.html


--
Rob


