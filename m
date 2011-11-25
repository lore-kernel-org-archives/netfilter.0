From: John Haxby <john.haxby@oracle.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 20:01:09 +0000
Message-ID: <4ECFF405.8080904@oracle.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com> <janteh$3ui$1@dough.gmane.org> <4ECF9C17.80804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECF9C17.80804@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lu zhongda <luzhongda@gmail.com>
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>, netfilter@vger.kernel.org


On 25 Nov 2011, at 13:45, lu zhongda wrote:

> We supply java application server product to our customer.
>    The application server supplies jdbc connection pool functionality
> to deployed web application.
>    The jdbc connection pool usually keeps a fixed count of physical
> connections to database which are socket connections.
>    The support staff reflected that the connections in the connection
> pool were dropped by firewall after 30mins to become idle under
> customer environment .
>    I can't get clear information whether the firewall product is iptables.


This is quite common.

A lot of home routers (certainly the Netgear ones) use iptables and will
drop idle connections after some configurable time.  Cisco routers that
track connections (for NAT or otherwise) will typically drop idle
connections after some configurable interval (I think the first time I
came across this in about 2001 it was 30 minutes).

If you're affected by this then you need something that will keep the
connection alive.   In your case you need a no-op to keep the connection
alive.  Either that or drop your idle connections before the router does
it for you.

jch
