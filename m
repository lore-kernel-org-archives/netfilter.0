From: Frank Gruellich <frank@der-frank.org>
Subject: Re: INPUT or FORWARD;;
Date: Tue, 21 Dec 2004 00:36:12 +0100
Message-ID: <20041220233612.GU30585@der-frank.org>
References: <1103547524.2932.6.camel@hubcap.ljm.dom>
	<20041220132421.DAE032F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041220132421.DAE032F42A@kshira.sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

* Rob Sterenborg <rob@sterenborg.info> 20. Dec 04:
> netfilter-bounces@lists.netfilter.org wrote:
> >   iptables -A INPUT -i ppp0 -d $IP_OF_ETH0 -j ACCEPT
> I agree it's a valid rule (syntax), but I don't think it will ever match
> a packet.
> 
> If -i and -d are specified, they both have to match to accept a packet,
> right ?
> Because <ip_eth0> is not assigned to ppp0, how can -i ppp0 -d <ip_eth0>
> ever match for the INPUT chain ?

I can just repeat Jason: forget the concept of associating IP#s with
interfaces if you ever intend to understand routing.  IP#s belong to the
IPstack of the kernel.  Think of it in the ISO/OSI layer model:

   Something unimportant
--------------------------
      IPstack with
 10.0.0.1 and 192.168.0.1
--------------------------
     NIC drivers for
   eth0   and     eth1
-----------.--------------
 hardware  | more hardware

If somebody yells into the cable "Hey, 10.0.0.1, tell me (10.1.2.3) your
MAC!" any interface getting this will ask the IPstack "Dude, are we
10.0.0.1?"  If the IPstack (that has no idea of interface drivers at
all) confirmes the NIC will answer with its MAC, no matter if anybody
assotiated this IP# with it.  If other hosts have its MAC things are
straighten out.  (This is a way, IP-spoofing works.)

The association of IP#s to interfaces is just a little hint to build up
the routing table automatically: if I issue something like

 # ifconfig eth0 10.0.0.1

the routing process fills this with some good presumptions and adds

 # route add -net 10.0.0.0 netmask 255.0.0.0 dev eth0

This is the only important point where interfaces meet IP#s: the routing
table.  (Please correct my if I write nonsens.)

HTH,
 regards, Frank.
-- 
Sigmentation fault

