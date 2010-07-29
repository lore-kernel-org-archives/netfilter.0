From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rule for ovh
Date: Thu, 29 Jul 2010 11:47:57 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007291147010.22862@obet.zrqbmnf.qr>
References: <4C51450F.7070906@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C51450F.7070906@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Portedaix <portedaix@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2010-07-29 11:08, Portedaix wrote:
>
> QUESTION - SHORT VERSION :
> Is there a way to have a rule equivalent to the one below which is for kernel
> 2.6.14 and above,  with a linux kernel 2.6.9 ?
> '#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string "Cirpack
> KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net -j DROP'
>
> I could avoid that by activating the rule
>
> #iptables -A INPUT -p udp -m udp --dport 5060 -m string --string "Cirpack
> KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net -j DROP
>
> But my main problem is this string module. My kernel is 2.6.9, and string
> module is used starting from 2.6.14 kernel. Upgrading the kernel on my
> production server is not easy, and may lead to a heavy reconfiguration.

Neither of those kernels is supported anymore.
(My credo is: shouldn't have waited until it's completely turned to rust.)
