From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sat, 21 Sep 2002 17:57:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0a7b01c261c2$3d9156c0$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <0a3801c26172$51f71af0$c6b22543@repligate> <20020921135239.CIIH27185.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> 
> I think it's much fairer to say that of the 160 bits in the IPv4 header, 83 
> of them make sense for routing purposes:
> 
> 8 bits - type of service
> 3 bits - fragmentation flags
> 8 bits - protocol identifier
> 32 bits - source address
> 32 bits - destination address
> 

The "3 bits - fragmentation flags" are complicated...

One is Spare....it can be set to 0 or 1 and seems to pass thru untouched...

The other two MF-More Fragments and DF-Don't Fragment can not easily be touched.

One could argue that the DF bit turns off the usage of the 13 Fragment Offset Bits...
IF one wanted to give up Fragmentation, they could redefine DF to be an Extended Address
indicator and the 13 bits (plus the one Spare) could make up two 7-bit fields. Unfortunately,
that approach would make it such that Extended Addressing would only apply to packets
that do not have the Fragmentation Feature...(shades of IPv6, which does not have that field).

The 8-bits of Protocol could also be re-worked with care to be a 2-bit field and a 6-bit field.
The 2-bit field would specify one of the 3 dominate Protocols or Legacy values. With the
three dominant protocols, ICMP, UDP and TCP, one could have two 3-bit fields for Extended
Addressing. This again, has its limits because those Extended Address spaces would then only
be used with that limited set of Protocols. That may not be all that bad. The 3-bits then create
8 planar networks for each of the dominant protocols. It is like adding 7 stories to an existing
building.

The 8 TOS bits are the easiest to split into two 4-bit Extended Addressing fields. That instantly
makes the existing IPv4 Internet, 15 times larger. The TOS values with 0x0* or 0x*0 can be
viewed, as special, if one assumes that 0x00 is the legacy Internet. All other values can be used
to route between the planes, 0x43 would be a SRC=4 and a DST=3. Going back the other way
the TOS is reversed to be 0x34. A value such as 0x30 may not make sense because a legacy node
will not know how to reverse the bits and reply to 0x03. All of the useful TOS values fit into the
special point codes.

All of this of course does not touch the UDP and TCP Port Numbers which are an integral part
of the address space. Those 16-bits can be loaded into a 128-bit DNS AAAA record in the
right-most bits for the quickest expansion and to gain access to bits which never before fit in the
32-bit A records. Those bits increase the 32-bit addressing by a huge factor. The limit again is that
not all services use the dominant UDP and TCP protocols. YMMV.

In the end, the marketplace can take the 160-bits and use every one in various ways, and eventually
a consensus can be reached about what bits make the most sense in the 128-bit DNS AAAA
records. Not all of the 128-bit DNS AAAA record bit have to go in the header. As an example,
one bit can be used for "Options Control" indicating that no IPv4 Options are supported at the Destination.
That will show up as the Header Length=5, which is common. If one moved to a situation where it was
assumed that there was ALWAYs at least One Option, then the Options Control resulting in the value
of 5 would tag packets as "unique" and in some sense that is a form of control and routing could be
done special on HL=5 and HL!=5.

128-bit DNS AAAA Record Flag Day Formats
2002:[IPv4]:[SDLL.OFFF.FFFF.TTTT]:[64-bit IPv8 or IPv16 Persistent Address]
[YMDD]:[IPv4]:[SDLL.OFFF.FFFF.TTTT]:[64-bit IPv8 or IPv16 Persistent Address]
1-bit to set the Reserved ("Spare") bit in Fragment Offset [S]
1-bit to set the Don't Fragment (DF) bit [D]
2-bits to select 1 of 4 common TTL values (255, 128, 32, 8) [LL]
1-bit for Options Control [O]
7-bits to set the Identification Field(dst) [FFFFFFF]
4-bits to set the TOS(dst) Field [TTTT]
Default SDLL.OFFF.FFFF.TTTT = 0000.0000.0000.0000
FFF.FFFF.TTTT = GGG.SSSS.SSSS

People have only begun to consider all the ways that 160 bits can be set, and what happens
to those bits with respect to the edge devices and the core transport. It is critical to consider
what bits are unchanged across the transport, and which bits can have any value without impacting
the results of the transport, which can end up being an interim transport, as edge devices are
deployed which can route directly to each other base on bits in the 160-bit header that are not
part of the transport's routing activity. Only packets, as a last resort, need to go across the
global transport. As more and more traffic flows around the edges, eventually, the 32-bit legacy
core can be turned off, just like many networks over time. People evolve and expand and route
around the legacy road-blocks....


Jim Fleming
2002:[IPv4]:000X:03DB:...IPv8 is closer than you think...IPv16 is even closer...
http://www.netfilter.org/
http://www.analogx.com/contents/dnsdig.htm
http://ipv8.dyndns.tv
http://ipv8.yi.org
http://ipv8.dyns.cx
http://ipv8.no-ip.com
http://ipv8.no-ip.org
http://ipv8.no-ip.biz
http://ipv8.no-ip.info
http://ipv8.myip.us
http://ipv8.dyn.ee
http://ipv8.community.net.au
http://ipv8.ods.org


