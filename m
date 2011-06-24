From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables NAT POOL
Date: Fri, 24 Jun 2011 22:17:00 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106242211170.3553@frira.zrqbmnf.qr>
References: <BANLkTi=Mrtp_T27jqMyu3CTp3ohzaiaiCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=Mrtp_T27jqMyu3CTp3ohzaiaiCA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nima chavooshi <nima0102@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-06-23 21:01, nima chavooshi wrote:

>Hi
>In our company, we have got one range IP public from our Internet
>provider. so I want to assign this range to our users.this range is
>128 bit.

Unfortunately, you are not in a position to do that, first because you 
are not IANA, and second, because parts of the address space are already 
delegated, such as ff00::/8 (a range with 120 bit).

>Bu my concern is:
>1- Do I have to set all IP public on output interfaces? Or iptables
>automatically adds all IP's on output interface?

iptables is not a network device configuration utility (-> see iproute 
instead).
