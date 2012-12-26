From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: help with cluster and/or clusterip
Date: Wed, 26 Dec 2012 23:51:16 +0100
Message-ID: <20121226225116.GB32453@1984>
References: <A3FB5D9FD28C50429DF7692DC31054E604BA741B@DC1INTADCW8201.yieldbroker.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <A3FB5D9FD28C50429DF7692DC31054E604BA741B@DC1INTADCW8201.yieldbroker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Samad - Yieldbroker <Alex.Samad@yieldbroker.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Tue, Dec 18, 2012 at 04:30:17AM +0000, Alex Samad - Yieldbroker wrote:
[...]
> I am sticking with clusterip... until somebody show / explains why
> cluster module is better ....

The cluster match is more generic. You cannot use CLUSTERIP for
load-sharing setups in gateways, only in backend nodes.

> My default gateway had the wrong mac associated with the ip address,
> I had the VIP assigned to the nic before I had the CLUSTERIP
> iptables line. So arp request where being answered with the mac of
> the nic not the maddr ! so I cleared the switched arp table for that
> entry and now I am getting packets to both machines.
> 
> And tcpdump sees all the inbound packets.  The line in iptables
> consumes the packet if it fails ie not for this machine.  The
> interesting thing is seeing all the reply packets from the test
> machine go to second node ( the one that is not handling the link
> ... oh well)
> 
> Now  when I try to make a https connection so 
> 
> Client -> router -> cluster vlan 
> 
> I can see the tree way hand shake syn, syn/ack, ack. Well from the client side
> 
> But on the server side I have this
> tcp        0      0 10.32.21.30:10001           10.172.207.133:60123        SYN_RECV
> 
> tcpdump has the ack ... but some reason it's not making it up the stack 

Not sure I got it. But if you're using CLUSTERIP in the router, it
will not work.

Regards.
