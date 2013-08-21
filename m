From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Re: Machine in the middle
Date: Wed, 21 Aug 2013 14:24:21 -0500
Message-ID: <521513E5.2030908@tiendalinux.com>
References: <5214F4AA.4010409@tiendalinux.com> <CAHUGJcG9=wBzy256c2Rk1NMi8TSWp_DCUrqLoA5Tvo+3QgHYMA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHUGJcG9=wBzy256c2Rk1NMi8TSWp_DCUrqLoA5Tvo+3QgHYMA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matty Sarro <msarro@gmail.com>
Cc: netfilter@vger.kernel.org

Hi, thanks for your answer, I forgot to say that the ports I will be
intercepting are going to be redirected to a third host, so I can't just
listen or drop, I need to respond to those packets.

I am planning to use an openwrt router for this.

Initially I though that could be done with two routers as follows:

Original scenario:

192.168.1.1/24 <-> 192.168.1.2/24

New scenario:

192.168.1.1/24 <-> ( 192.168.1.2/24 natting to from 169.254.1.2/24) <->
( 169.254.1.1/24 natting to from 192.168.1.1/24) <-> 192.168.1.2/24

The idea is that every router take the other side IP address then DNAT
to a zeroconf ip address and send to the other one, the other router
will receive the packet and SNAT to the original IP address, problem
solved, I thought.

That way I could intercept the traffic in any of the two devices and
with another network interface I could send that packet to another host.

But I prefer a solution where I don't have to use two routers, can it be
done using just one router reinjecting the packet after the first NAT ?

Another option I was thinking is to define a router with two network
interfaces where I put an ip address of the other side as an alias and
then mark the packet, then put into another routing table and forward
via the other interface, seems confusing, I will try to explain:

192.168.1.1/24 <-> (eth0.1: 169.254.1.2/24,192.168.1.2/24 and eth0.2:
169.254.1.1/24,192.168.1.1/24) <-> 192.168.1.2/24

I will receive the packet from one side, then at the mangle stage I will
mark the packet, I will have just set up a new route table that obeys
the packet and forward via another interface, this way I will not have
to deal with NAT and the same the other way.  But this is just my
hypothesis, Could it be possible or I am smoking marihuana ?

Thanks.

-- 
Nestor.Diaz.


On 08/21/2013 12:30 PM, Matty Sarro wrote:
> 1) An ethernet tap is your best bet to do this. They can be purchased
> to run at line speed (up to 1GBps, perhaps faster), and are made
> specifically to do what you want. You can attempt to make one on your
> own if you don't have a budget, but they rarely perform as well as a
> manufactured one.
>
> 2) A switch with a SPAN port may work as well. You can specify a port,
> and then duplicate all ethernet frames going into/out of that port on
> to another port, which is cabled to a box that is sniffing traffic.
>
> 3) If transparency and throughput aren't really that important, you
> can use a network hub. Because of how hubs function, all traffic is
> sent out all ports. You'd connect the sniffing box and be done. The
> downside is you will have lots of collissions, nothing will run at
> full duplex (no gigabit speeds).
>
> There are dedicated solutions for sucking in network traffic once you
> have a tap installed (namely snort, http://www.snort.org/).
>
[...]
