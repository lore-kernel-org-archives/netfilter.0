From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 17:39:23 -0500
Message-ID: <201311071739.23230.neal.p.murphy@alum.wpi.edu>
References: <5278501B.4040406@ngtech.co.il> <CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com> <527C0E1A.6050003@ngtech.co.il>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <527C0E1A.6050003@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, November 07, 2013 05:03:06 PM Eliezer Croitoru wrote:

> OK so the next scenario:
> Client: 192.168.1.1/24
> 
> Lan Router: 192.168.1.254/24
> Lan Router wan side:192.168.100.254/24
> 
> Wan Router 1:192.168.100.1/24
> Wan Router 1-wanip: 3.3.3.3
> 
> Wan Router 1:192.168.100.2/24
> Wan Router 1-wanip: 4.4.4.4

This should be Wan Router 2?

> 
> Simple HTTP\SMTP\SSH\TCP server: 6.6.6.6
> 
> Client -> SYN --> Lan ROUTER: --> *WAN-router1*(which does NAT) --> BIG
> INTERNET --> TCP server
> 
> TCP server SYN-ACK --> BIG INTERNET -> *WAN-router1*(NAT) --> Lan ROUTER
> --> Client
> 
> Client -> ACK --> Lan ROUTER: --> *WAN-router2*(which does NAT) --> BIG
> INTERNET --> TCP server
> 
> OK so now stop and feel the TCP server FW:
> "Hmm what is this strange packet?? I think it's an invalid packet and
> the sentence for this one is *DROP*"
> In the application level it will be almost the same:
> "Hmm I do not recall any existing connection from this IP so
> *DROP*\ignore that"
> 

In order for you to do what you want to (balance the load--to arbitrary 
internet hosts--across two links), don't you need a single NAT with a single 
public address, and BGP (or equivalent) to inform the internet routers that 
your single IP can be reached via either route?

With the setup as described, can you only load balance at the conn level, not 
at the packet level?
