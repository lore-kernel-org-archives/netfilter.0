From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: Re: simple netfilter machine redirection
Date: Sun, 16 Mar 2008 18:28:09 -0400 (EDT)
Message-ID: <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan>
References: <200803162323.m2GNNXe3013255@dell2.home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803162323.m2GNNXe3013255@dell2.home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marty Leisner <leisner@rochester.rr.com>
Cc: netfilter@vger.kernel.org



On Sun, 16 Mar 2008, Marty Leisner wrote:

> I want to accomplish something simple with iptables..
> (I've used IPtables successfully without really understanding how to do
> something from scratch -- I just followed "recipes")
>
> I want machine A to redirect port 80 to machine B.
>
> What's a way to do it?  (seems simple enough).
>
> I've tried a number of ways, and nothing seems to work...
>
> (the machine isn't a firewall)
>
> marty

152] How do I forward a port from the internet to the LAN? iptables -A PREROUTING -i eth0 -t nat -p tcp --dport 22 -j DNAT --to 192.168.0.5:22

Forward port 22 -> internally to host 192.168.0.5:22 for instance.

.. and yes I did test this just now, it still works :)

Justin.

