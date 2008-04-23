From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Redirecting ports in a bridge
Date: Wed, 23 Apr 2008 20:48:02 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804232047490.15791@fbirervta.pbzchgretzou.qr>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es>
 <alpine.LNX.1.10.0804231722570.13697@fbirervta.pbzchgretzou.qr> <480F6EEE.9010201@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F6EEE.9010201@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Wednesday 2008-04-23 19:16, Grant Taylor wrote:

> On 04/23/08 10:24, Jan Engelhardt wrote:
>> Often layer-2 transparency is not needed, but what do I know. If you just log
>> layer-3 (IP addrs) and up without caring about MAC addresses, make a standard
>> routing setup, i.e. 192.168.1.0/22 on eth0, 192.168.2.0/22 on eth1, and
>> enable forwarding; kinda like that. And let hosts use 192.168.1.1/192.168.2.1
>> as a default gw (as they already should do).
>
> If it was not for the fact that the OP wanted layer 3 transparency, I would
> agree with you.  However the desire to insert this between a router and one or
> more systems with out changing the IP addressing necessitates the use of layer
> 2 technology, i.e. bridging.

Well what routes do clients have at the moment?
