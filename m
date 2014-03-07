From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: What is the "algorightm" that decides on the routing path?
Date: Fri, 07 Mar 2014 02:13:17 +0200
Message-ID: <53190F1D.2050309@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

What is the "algorightm" that decides on the routing path?
I am asking to understand how to explain the decision of multi dual 
weight nexthop routes.

For example I do have a client with one  router which load balance 
towards two other routers with NAT on them using two different IP 
addresses as outgoing IP.

so client 192.168.120.1 goes to 192.168.120.254 with the other leg at 
192.168.130.254 and two next hops with 130.1 and 130.2 with another leg 
at the 192.168.10.X leg.
Now I want to make sure I understand how exactly it is decided with what 
nexthop will the packet be delivered towards?

There must be a "Static" way to calculate it.(ip? port? etc?)

Thanks,
Eliezer
