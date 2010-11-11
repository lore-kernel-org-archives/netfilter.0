From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: limit bandwidth equally
Date: Thu, 11 Nov 2010 19:42:23 +0100
Message-ID: <4CDC390F.6060508@unipex.it>
References: <4CD7D742.2040702@googlemail.com> <4CD926C6.8070604@unipex.it> <4CDBDC82.6020006@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CDBDC82.6020006@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: J Webster <jw.jwebster@googlemail.com>
Cc: netfilter@vger.kernel.org

J Webster ha scritto:
> I am using the following script for tc/htb.
> My server has 2 VPN services and a proxy server.
> The proxy server already limits using delay pools but I need to add a
> 1Mbps limit for every IP connecting to the VPN.
> The VPN is on tun1 and tun 0.
> Does the tc script go in the same folder as iptables.../etc/sysconfig?
>

No, it's not need.
This script are a separate "program".

> # The network interface we're planning on limiting bandwidth.
> IF=eth0 # Interface
> # Download limit (in mega bits)
> DNLD=1mbit # DOWNLOAD Limit
> # Upload limit (in mega bits)
> UPLD=1mbit # UPLOAD Limit

> $TC qdisc add dev $IF root handle 1: htb default 30
> $TC class add dev $IF parent 1: classid 1:1 htb rate $DNLD
> $TC class add dev $IF parent 1: classid 1:2 htb rate $UPLD

This is the first error that I found. With htb you cannot limit upload 
and download speed on the same interface. Are you looking for ifb?

Michele
