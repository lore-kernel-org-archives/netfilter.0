From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Filtering PPP traffic
Date: Fri, 18 Apr 2003 12:30:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030418193058.17530.qmail@web40202.mail.yahoo.com>
References: <3EA018CF.2010702@numlog.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EA018CF.2010702@numlog.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francis GASCHET <fg@numlog.fr>
Cc: netfilter@lists.netfilter.org


Have you tried filtering on the nas0 device?

--- Francis GASCHET <fg@numlog.fr> wrote:
> 
> Hello,
> 
> The bridge we use is the kernel patch provided by 
> http://bridge.sourceforge.net
> On the card side, we use Ethernet over ATM bridging (RFC 1483/2684 
> kernel module). It emulates an "Ethernet like" device : nas0.
> The pppOE daemon sits in the VM where it reads and writes ppp frames on 
> a virtual eth device created with TAP (http://Vtun.sourceforge.net).
> The official address is carried by this virtual eth device.
> The bridge forwards pppOE packets between the nas0 and the tap0 devices.
> The goal is to use a bridged firewall. That means : a FireWall which is 
> not visible from the external network.
> 
> The problem is to be able to filter the pppOE packets that flow across 
> the bridge.
> 
> -- 
> Francis GASCHET / NUMLOG
> http://www.numlog.fr
> Tel.: +33 (0) 130 791 616
> Fax.: +33 (0) 130 819 286
> 
> 
> 
> 
> Thanks for any help.
> 
> SBlaze wrote:
> 
> >You should be able to filter at the "eth0" level of your diagram...
> >
> >I kinda need more information on your "BRIDGE" before I could suggest
> something
> >else.. If by bridge you mean it bridges the DSL modem and the LAN...then
> your
> >eth0 is in the same machine you are calling a bridge?
> >
> >In that case you should theoretically filter the eth0 device
> >
> >
> >--- Francis GASCHET <fg@numlog.fr> wrote:
> >  
> >
> >>Hi list,
> >>
> >>Is there somebody who knows a possibility to apply netfilter rules to 
> >>ppp packets ?
> >>
> >>Configuration :
> >>
> >>DSL - PCI modem card - BRIDGE - eth0 (in a virtual machine)
> >>
> >>I would like to filter the traffic which flows across the bridge, but at 
> >>this level, the IP traffic is encapsulated...
> >>
> >>Any clue ?
> >>
> >>Ciao.
> >>
> >>    
> >>
> 
> 
> 
> 


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

