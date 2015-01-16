From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 03:14:18 +0100
Message-ID: <m99s5q$plu$1@ger.gmane.org>
References: <CAJb3rWBaO6R+6ZRKmByRfMk_cWWF2KVEJgChpUaNiFToy8p-kg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWBaO6R+6ZRKmByRfMk_cWWF2KVEJgChpUaNiFToy8p-kg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

> Looks like it doesn't want to mark anything on the PREROUTING /
> INPUT phase.. or an option somewhere is not enabled..

A hint:
I think you have to send packets from another host to this host
to let the pkts go thru the PREROUTING chain of the mangle table.



