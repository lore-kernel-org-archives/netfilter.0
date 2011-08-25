From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Thu, 25 Aug 2011 17:30:16 +0200
Message-ID: <4E566A88.2040309@freemail.hu>
References: <4E5634C3.80908@freemail.hu> <4E56617E.4040704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E56617E.4040704@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>


> How about putting a reject route in the kernel routing table?
Yeah.. that is an alternative...
But:
  - I want to REJECT any tcp sessions with tcp-reset,
  - and any other protocoll with icmp-admin-prohibited.
  - I would like to do it in iptables/netfilter.

The main question is: Why do not we have such a table in the POSTROUTING 
chain?
>
> That will very easily prevent the packets from leaving your system.
>
> Further, I think the kernel will (by default) send an ICMP packet 
> indicating that there is no route.
As I know this is true...
>
> IPTables is great, but sometimes it's better to use a different 
> technology.
>
>
>
> Grant. . . .
>
>
> P.S.  Here's a series of commands that I run on my systems.
>
> route add -net 0.0.0.0 netmask 255.0.0.0 reject
> route add -net 10.0.0.0 netmask 255.0.0.0 reject
> route add -net 169.254.0.0 netmask 255.255.0.0 reject
> route add -net 172.16.0.0 netmask 255.240.0.0 reject
> route add -net 192.0.2.0 netmask 255.255.255.0 reject
> route add -net 192.168.0.0 netmask 255.255.0.0 reject
> route add -net 198.51.100.0 netmask 255.255.255.0 reject
> route add -net 203.0.113.0 netmask 255.255.255.0 reject
>
I have similar rules in my iptables firewall script. And you can put the 
rules above in a table with the "ip route add table..." thing. And after 
that you can "call" them with "ip rule ..." rules.

Thanx for your reply! :D


Swifty
