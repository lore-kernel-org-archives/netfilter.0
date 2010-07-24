From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problem with NAT rule
Date: Sat, 24 Jul 2010 15:51:40 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007241551150.515@obet.zrqbmnf.qr>
References: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2010-07-24 15:41, Pete Kay wrote:

>Hi,
>
>I would like to setup my iptable rules to forward udp packet from one
>device to another:
>
>192.168.1.100:16385  <---------> 192.168.1.114:29848 :: 192.168.1.200
>:29850  <----------> 192.168.1.300:10112
>
>What I want to do is forward all packets from 192.168.1.100:16385 to
>192.168.1.300:10112 and all packets from 192.168.1.300:10112 to
>192.168.1.100:16385
>
>Here is my iptables rule:


Routing does forwarding; nf_nat does NAT, those are two separate things.

