From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: AW: bootp problems
Date: Wed, 7 Apr 2004 12:40:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E847@ORION>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Received: **stripped**
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

> How is Linux supposed to route a reply packet from 1.1.1.2:67 back to 
> 0.0.0.0:68?
> 
> > SECOND the DialIn try it with BROADCAST
> > with tcpdump on 2.1 i can see 0.0.0.0:68 > 255.255.255.255:67 It 
> > doesnt work and i CAN see an entry in the iptables log
> 
> Broadcasts do not cross routers.   That is nothing to do with 
> netfilter (and 
> no, you cannot create any netfilter rules to make a broadcast 
> cross to the 
> other side).
> 
Ok. I give up. I will put a dhcp server in the segment.

But one info for my brain.

Why can i see iptables log for 0.0.0.0:68 > 255.255.255.255:67 and not for
0.0.0.0:68 > 1.1.1.2:67?

