From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNAT to 127 fails
Date: Fri, 05 Aug 2005 12:08:12 +0200
Message-ID: <42F33A8C.9060905@mnemon.de>
References: <Pine.LNX.4.61.0508051141020.31142@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508051141020.31142@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

Jan Engelhardt schrieb:
> Hi,
> 
> 
> Connection from anywhere-on-the-internet (dsl0) to alphagate:80 only does not 
> work when --to-dest is 127.0.0.1. It works with 192.168.44.1.
> (It's not a bridge problem, that for sure!)
> Why? Some routing problem?
> 
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-dest 127.0.0.1:8000

"-j DNAT" is not intended to DNAT to localhost. The REDIRECT target is
for this. From "man iptables":

REDIRECT
       This  target  is  only  valid  in the nat table, in the
       PREROUTING and OUTPUT chains, and user-defined chains
       which are only called from those chains.  It redirects
       the packet to the machine itself  by  changing  the
       destination  IP  to  the  primary  address of the incoming
       interface (locally-generated packets are mapped to the 127.0.0.1
       address).  It takes one option:

       --to-ports port[-port]
              This specifies a destination port or range of ports to
              use: without this,  the  destination  port is never
              altered.  This is only valid if the rule also specifies
              -p tcp or -p udp.

Have a nice time,

Joerg


