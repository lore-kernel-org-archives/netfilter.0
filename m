From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: netfilter + masquerade, mutliple i/fs sharing an IP
Date: Wed, 23 Sep 2009 00:50:04 +0200
Message-ID: <4AB9549C.5040508@plouf.fr.eu.org>
References: <C427FC06DA4331C494D72BCA@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C427FC06DA4331C494D72BCA@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Alex Bligh a =E9crit :
>=20
>                                           [------------------]
>                           192.168.1.0/24  [   NAPT gateway   ]
>  [ Host A  192.168.1.2] ------------------[ 192.168.1.1      ]
>                                      tun0 [                  ] 1.2.3.=
0/24
>                                           [          1.2.3.4 ]---->
>                                           [                  ] eth0
>  [ Host B  192.168.1.2] ------------------[ 192.168.1.1      ]
>                                      tun1 [                  ]
>                                           [------------------]
>=20
> Now, I appreciate that duplicating IP addresses is not in general
> a good idea. However, in theory this could work. The complex
> part is that when a packet traverses the NAPT left to right, it
> needs to record both the input i/f, together with the source IP=09
> and port. When the reply is translated back, the packet is
> going to be destined for 192.168.1.2, but it must be sent out
> the same interface as the NAPT table shows the packet is received on,
>=20
> Doing this the standard way (i.e.
>   iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE=09
>   )
> only appears to work when either tun0 OR tun1 are up (but not both).
> I suspect this is because on NAPT traversal of the reply packet,

No, this has nothing to do with NAT but with routing.

> the kernel looks up a next hop, and uses that next hop to determine
> which interface to use (using first subnet match).

Correct. Just plain routing. No NAT involved here.

> Is there any way around this? For instance can I used multiple
> NAPT tables, one for each inbound i/f?

I repeat : this has nothing to do with NAT.
You might be interested in the CONNMARK target and the connmark match.

1) Mark packets received on each tunX interface with MARK.
2) Copy the packet mark into the connection mark with CONNMARK.
3) Copy the connection mark of packets received on eth0 into the packet
mark with CONNMARK.
4) Route the packets according to their mark with ip rule & ip route.
