From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 09:15:33 +0100
Message-ID: <m9ahb5$4uo$1@ger.gmane.org>
References: <CAJb3rWBxDV7uB-w5k1bMXi2CdY8o5OqXwH6VVG_=1hPCTcirUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWBxDV7uB-w5k1bMXi2CdY8o5OqXwH6VVG_=1hPCTcirUQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The Media Server wrote, On 01/16/2015 06:33 AM:
> OMG THANK GOD I JUST FOUND IT!!!!
>
> it was hidden and off by default!! The tcp_fwmark_accept was off by default!
>
> sudo sysctl -w net.ipv4.tcp_fwmark_accept=0

Glad to hear that you found a solution.
That setting must be a new one as my other system (Debian 7) doesn't know 
about it.


