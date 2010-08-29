From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: using iptables with tun/tap interfaces? no rule sees tun/tap
 interface traffic
Date: Sun, 29 Aug 2010 13:15:59 +0200
Message-ID: <20100829131559.23abd652@catus>
References: <4C7A3E75.5020202@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A3E75.5020202@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

Hi Tomasz,

>tcpdump: WARNING: tap0: no IPv4 address assigned

So you're bridging.

Make sure /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1.

Good luck.

Best regards,
Marek
