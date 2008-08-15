From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Fri, 15 Aug 2008 11:28:02 -0500
Message-ID: <48A5AE92.6090500@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com> <48A5A0ED.8010502@riverviewtech.net> <200808151914.21997.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808151914.21997.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 11:14, Jan Klod wrote:
> May I ask some commands?

*nod*

> Say, I have eth1 with address 192.168.2.34, router (and nameserver) 
> address 192.168.2.1 and I've connected to VPN through ppp0 with local 
> IP address 215.155.114.16 and remote IP address 215.155.115.254! 
> (VPN's gateway is 194.12.33.1 for connecting) (VPN or PPTP)

So your client is 192.168.2.34 and your (current) default gateway is 
192.168.2.1.  You have a VPN established from your client to 
215.155.115.254.  Your end of the inside of the VPN is 
194.12.33.<something> and the remote end of the inside of the VPN is 
194.12.33.1.  Is all of this correct?  (I'm going to presume yes with 
the commands below.)

route add -host 215.155.114.254 gw 192.168.2.1
route add default gw 194.12.33.1 metric 1
route del default gw 192.168.2.1
route add default gw 192.168.2.1 metric 2

This should do the following:
  - Add a route to your VPN target by way of (the IP of) your (current) 
default gateway.
  - Add a the remote end of the inside of the VPN as your new default 
gateway with a low metric.
  - Delete your old (local) default gateway.
  - Re-add your old (local) default gateway with a higher metric.

> At least, what are those command line entries, so I can browse 
> network through VPN?

If by "browse" you mean browse the web or use any other ""standard 
internet service, you should be good to go.  If by "browse" you mean 
"Browse 'My Network Places'" you may run in to other SMB / CIFS related 
networking issues (crossing subnets).

> Hope, I explained better...

I think so.  Does my response help?



Grant. . . .
