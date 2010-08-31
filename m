From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same
 ip/subnet.
Date: Tue, 31 Aug 2010 15:41:49 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008311539260.1510@obet.zrqbmnf.qr>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giacomo Bernardi <mino@minux.it>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-08-31 13:34, Giacomo Bernardi wrote:

>mark outgoing packets for 10.3.0.1
>ip rule add fwmark 103 table 103                                    #
>create an iproute table
>ip route add table 103 default dev eth3                             #
>send out marked packets on eth3
>iptables -t nat -A POSTROUTING -m mark --mark 103 -j SNAT --to
>10.0.0.100 # rewrite source ip
>iptables -t nat -A OUTPUT -m mark --mark 103 -j DNAT --to 10.0.0.1  #
>rewrite dest ip
>
>And then send snmp queries to 'fake' addresses 10.1.0.1, 10.2.0.1 and 10.3.0.1.
>
>Result:
>- the device gets the packets and sends back the results (with
>srcip=10.0.0.1 and dstip=10.0.0.100)
>- but when the linux box gets them back, they are obviously discarded.
>
>How can I do this?

Check why replies do not get translated back. Use -j TRACE for them.

