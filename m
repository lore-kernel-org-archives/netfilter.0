From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ppooe state RELATED,ESTABLISHED issue
Date: Tue, 9 Aug 2005 11:50:20 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508091148270.6879@yvahk01.tjqt.qr>
References: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
	<42F3299E.9030701@mnemon.de>
	<1123461462.3383.25.camel@inyoureyes.linsolutions.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123461462.3383.25.camel@inyoureyes.linsolutions.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ted Kaczmarek <tedkaz@optonline.net>
Cc: netfilter@lists.netfilter.org


>With 2.4 Kernel Centos 3.5 it works fine, but I didn't bring up eth0 ip
>interface. Need to retest this without an ip interface on eth0 and 2.6
>kernel, the previous case I had an ip on eth0 as well.

The "up" and "down" states of interfaces seems to be the hardware switch. 
Dunno how it is implemented with NICs, but I have seen that in snd-cs46xx.c, 
the card is totally shutdown on module unload. So I guess, it's the same on 
"ip l s dev eth0 down"

To have a bridge `a la ebtables work, the ports need to be up. And preferably, 
have no IP. This is really cool - I've got a br0 with eth2 linked to a WLAN 
router. With just one command, "ip l s dev eth2 down", all wlan traffic 
(through the server) can be disabled.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

