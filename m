From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: bootp problems
Date: Wed, 7 Apr 2004 09:50:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E843@ORION>
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

> > [DialIn]2.2.2.2----2.2.2.1[FW]1.1.1.1---1.1.1.2[DHCP]
> >
> > the DialIn tries to get an IP from the DHCP Server.
> 
> You need a DHCP relay on the 2 network to do this.
> 
> DHCP requests do not cross routers (they are ethernet broadcasts).

Hi antony,

The DialIN should play Relay

FIRST the DialIn try it DIRECTLY to the DHCP Server
with tcpdump on 2.1 i can see 0.0.0.0:68 > 1.1.1.2:67
It doesnt work and i CANT see any entry in the iptables log

SECOND the DialIn try it with BROADCAST
with tcpdump on 2.1 i can see 0.0.0.0:68 > 255.255.255.255:67
It doesnt work and i CAN see an entry in the iptables log

Thx for more informations
Jo

