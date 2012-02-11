From: vivek rajagopalan <vivvek.r@gmail.com>
Subject: Source based routing using LKM
Date: Sat, 11 Feb 2012 01:15:57 -0800
Message-ID: <CAKbcA9L2XVTuR04TONTRo7ECrBip9VYWk3T_Ar2c_ucN1QqY_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=TRnVpMgoDJYquI+nyUkB4eNzVg0CHtdqAUROrk9494U=;
        b=mjDQFqq4saYclgdKe+C2STwK273jZRMiEEFDdjM0U7WriRCO7DNsPt1tJoPpiRj1x7
         8s86c86TJ2gGYYL6bKl8ypZNaRDQSRRYNo2aR0uLs4BOHimZaVC6hT/VfWKiM1y68XdA
         /1VbN8orDD9qrfIxT32ZQTi/AVzAsuOjqigkI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to set the source ip of an RX packet to a local IP in a
pre_route filter (from within a kernel module) but the kernel drops
such a packet during routing phase. By local IP I mean one of the IP
addresses defined on the system running my kernel module. At what
point is the kernel dropping the packet? Is it that the kernel doesn't
like a packet received from the network with a local source IP? Can
this behavior be overridden?

The bigger picture is the following. I have a linux box with 4
interfaces each having multiple local IPs. This box needs to route
packets to multiple remote subnets. In order to successfully route
packets i had to create multiple routing table entries towards every
new remote subnet encountered. However the remote subnets far exceed
the local IPs and hence I was exploring the usage of policy based
source routing so as to minimize the creation of routing entries. With
a destination based routing system i used to modify destination IP in
pre_route hook and source IP in forward_hook. I was wondering how to
mangle the packet in a source based routing scheme

Thanks,
Vivek
