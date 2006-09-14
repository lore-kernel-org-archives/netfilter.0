From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT to one net, bridge to another
Date: Thu, 14 Sep 2006 13:41:31 +0200
Message-ID: <45093FEB.3050305@plouf.fr.eu.org>
References: <200609081250.32329.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609081250.32329.mike@v6.gaima.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Mike Williams a =E9crit :
>=20
> At the moment I'm looking at NATting stuff to 3 different zones (privat=
e=20
> networks), and hopefully bridging to a 4th zone.
> It'll have 10 nics, all paired off into round-robin bonds, so 5 usuable=
=20
> interfaces. 1 colo facing, 3 private, 1 "public".

What interfaces do you plan to bridge ?

> Can you DNAT packets to IPs X, and Y, Z assigned to a bridge, while bri=
dging=20
> those IPs not assigned to it?

First, bridging and DNAT don't take place at the same network layer.=20
Bridging takes place at layer 2 and DNAT at layer 3 or 4. You bridge=20
ethernet frames (possibly transporting IP packets but it doesn't matter)=20
  according to their MAC addresses, and this process is transparent for=20
the TCP/IP stack. You DNAT IP datagrams (possibly transported in=20
ethernet frames) according to their IP addresses and TCP or UDP ports. A=20
bridge can be considered as a virtual ethernet switch whose ports are=20
the bridged interfaces. On the host, it creates a bridge interface=20
"hiding" the bridged interfaces, just as a bond interface hide the=20
enslaved interfaces. So the kernel routing and Netfilter/iptables will=20
only see packets from the bridge interface, not those from the bridged=20
interfaces.

I assume you plan to bridge the "colo" and "public" interfaces.

          colo     public
            |        |
            |        |
         bridge interface
                |
                |
          TCP/IP stack (routing, iptables, NAT, filtering)
             |  |  |
             |  |  |
        private interfaces

The bridge catches incoming ethernet frames before the IP stack can see=20
them. So an ethernet frame forwarded from colo to public does not hit=20
the IP stack, unless it is an ethernet broadcast.

To try to answer your question, you can DNAT IP datagrams transported by=20
ethernet frames which are not bridged to another interface.

