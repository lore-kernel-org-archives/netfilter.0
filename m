From: rhn <vamali.rhn@porcupinefactory.org>
Subject: redirecting connections to userspace
Date: Sat, 25 Sep 2010 16:24:22 +0200
Message-ID: <20100925162422.7a57f1c6.vamali.rhn@porcupinefactory.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'd like to forward TCP connections coming from intranet to my gateway to userspace programs on the gateway.

For example,
host A on the intranet tries to connect to host B on the Internet using gateway G. Upon receiving the connection, gateway G sends the original connection destination (B and port) to a userspace program, and sends the network data to/from the program.

Is it possible to achieve that using netfilter?

So far, I've only found ipqueue, which operates on the packet level - a little too low for me. The other solution would be to use VPN, but I don't get the flexibility of writing my own program then.

Thanks in advance!

Cheers,
rhn
