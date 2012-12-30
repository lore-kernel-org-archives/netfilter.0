From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Mirroring traffic with iptables TEE target
Date: Sun, 30 Dec 2012 12:25:28 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212301224240.30402@nerf07.vanv.qr>
References: <20121230091048.GA4575@devnull.qunarservers.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20121230091048.GA4575@devnull.qunarservers.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Sunday 2012-12-30 10:10, Aaron Lewis wrote:

>Hi,
>
>I tried to mirror TCP traffic with mangle chain, 
>
>that all packets sent to 192.168.56.2 would be copied to 192.168.56.1,
>
># On 192.168.56.2 I executed,
>iptables -A PREROUTING -p tcp --dport 80 -j TEE --gateway 192.168.56.1
>
>But on 192.168.56.1 no traffic to port 80 was seen

Check with tcpdump on 192.168.56.1.
(And make sure you do not block outgoing packets on 56.2.)

