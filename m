From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: redirecting connections to userspace
Date: Sun, 26 Sep 2010 21:45:33 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009262144160.21905@obet.zrqbmnf.qr>
References: <20100925162422.7a57f1c6.vamali.rhn@porcupinefactory.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100925162422.7a57f1c6.vamali.rhn@porcupinefactory.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rhn <vamali.rhn@porcupinefactory.org>
Cc: netfilter@vger.kernel.org

On Saturday 2010-09-25 16:24, rhn wrote:

>Hello,
>
>I'd like to forward TCP connections coming from intranet to my gateway 
>to userspace programs on the gateway.
>
>For example, host A on the intranet tries to connect to host B on the 
>Internet using gateway G. Upon receiving the connection, gateway G 
>sends the original connection destination (B and port) to a userspace 
>program, and sends the network data to/from the program.
>
>Is it possible to achieve that using netfilter?
>
>So far, I've only found ipqueue, which operates on the packet level - a 
>little too low for me. The other solution would be to use VPN, but I 
>don't get the flexibility of writing my own program then.

xt_TPROXY comes to mind. Then you just do the usual socket(2) things in 
userspace.

