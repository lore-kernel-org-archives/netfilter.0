From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PPPoE on a bridge, nat sees bridge as incoming interface
Date: Thu, 06 Mar 2008 23:36:53 +0100
Message-ID: <47D07205.10906@plouf.fr.eu.org>
References: <20080306172218.GA14566@possum.gg3.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080306172218.GA14566@possum.gg3.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Georgi Georgiev <chutz@gg3.net>
Cc: netfilter@vger.kernel.org

Hello,

Georgi Georgiev wrote :
> 
> I am having trouble understaning how bridging and iptables fit together.
> The situation that bugs me is: if I do a PPPoE connection over a bridge
> with a single physical port, my nat table will see any incoming packet
> as coming from the bridge interface, and not the ppp interface. Why?

I guess you have a kernel 2.6.22 or above.

 From ChangeLog-2.6.22 :
     [NETFILTER]: bridge-nf: filter bridged IPv4/IPv6 encapsulated in
     pppoe traffic

     The attached patch by Michael Milner adds support for using iptables
     and ip6tables on bridged traffic encapsulated in pppoe frames,
     similar to what's already supported for vlan.

Setting the net.bridge.bridge-nf-filter-pppoe-tagged sysctl 
(/proc/sys/net/bridge/bridge-nf-filter-pppoe-tagged) to 0 should disable it.

 From <kernelsourcedir>/Documentation/networking/ip-sysctl.txt :

bridge-nf-filter-pppoe-tagged - BOOLEAN
     1 : pass bridged pppoe-tagged IP/IPv6 traffic to {ip,ip6}tables.
     0 : disable this.
     Default: 1
