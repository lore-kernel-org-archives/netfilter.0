From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Source based routing using LKM
Date: Sat, 11 Feb 2012 16:27:06 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202111624290.22796@frira.zrqbmnf.qr>
References: <CAKbcA9L2XVTuR04TONTRo7ECrBip9VYWk3T_Ar2c_ucN1QqY_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbcA9L2XVTuR04TONTRo7ECrBip9VYWk3T_Ar2c_ucN1QqY_A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vivek rajagopalan <vivvek.r@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2012-02-11 10:15, vivek rajagopalan wrote:

>I am trying to set the source ip of an RX packet to a local IP in a
>pre_route filter (from within a kernel module) but the kernel drops
>such a packet during routing phase. By local IP I mean one of the IP
>addresses defined on the system running my kernel module. At what
>point is the kernel dropping the packet?

rp_filter comes to mind.

>Is it that the kernel doesn't like a packet received from the network 
>with a local source IP?

It would indicate a spoofing attempt.

>The bigger picture is the following. I have a linux box with 4
>interfaces each having multiple local IPs. This box needs to route
>packets to multiple remote subnets. In order to successfully route
>packets i had to create multiple routing table entries towards every
>new remote subnet encountered. However the remote subnets far exceed
>the local IPs and hence I was exploring the usage of policy based
>source routing so as to minimize the creation of routing entries.

Changing the addresses in-flight breaks end-to-end connectivity. It will 
be better if you would, for example, mark the packets in the RX 
path, based upon your desired criteria, and reuse this mark value to 
select the routing table.
