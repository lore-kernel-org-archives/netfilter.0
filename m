From: "andre achternaam" <andreiscmeel@hotmail.com>
Subject: Why UDP packet loss in the stack
Date: Thu, 28 Nov 2002 06:24:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F88l4JWaskCcBONAARb00005315@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org


We encounter UDP packet loss. We are aware of the unreliable nature of UDP =

but the way we loss packets is rather strange.  Assume 2 PCs linked with a =

cross Ethernet cable. One PC having an UDP testserver and the other an UDP
client.

Besides the UDP client we have also a tcpdump -nn -x -i eth0 > dumpfile
running. Looking at the packets (every packet has a increasing number) in=20
the UDP client we encounter sometimes (appears to be random=85) packet loss=
.=20
Sometimes +/-50 successive packets. Even seen losses of more than 150=20
packets in a row. Actually we never found a loss of one packet in a row, up=
=20
till now.

When searching the dumpfile will learn that the packets do arrive at the pc=
!=20
Oke so they are lost somewhere in the stack. Why?

Some context of our UDP testserver:
The UDP server streams as fast as possible (although send socket call is=20
synchronize) e.g. 50 Mega bit of data and will sleep the rest of the second=
=20
before it send the next chunk of packets (50 Mbit in total). The packet siz=
e=20
is 1500 minus UDP /IP header lengths. Both PCs have a NIC that is 100 Mbit.
Every packet has a tracking number in the payload that is increased for
every packet.

Does anybody know where/why they are lost? Is there a max of the outstandin=
g=20
packets in the kernel? If yes how do I tweak this max. How do I detect if=20
the stack desides to throw away some of the UDP packets (statistics).

At the moment the server side is not the problem but this is not proven yet.

Examining the dumpfile we found the also packet loss but not the
packetnumbers we found in the UDP client. So this implies that the udpdump =

is not recording every packet. Is this right?

Current settings in proc/sys/net/core

hot_list_length =3D 128
Lo_cong =3D 100
Message_burst =3D 50
Message_cost  =3D  5
Mod_cong  =3D 290
Netdev_max_backlog =3D 300
No_cong =3D 20
No_cong_tresh  =3D 20
Opt_memmax =3D 10240
[r/w]mem_[default/max] =3D 65535

Grep from the web
hot_list_length, maximum number of skb-heads to be cached, default 128 What=
=20
does this mean?
optmem_max, maximum amount of option memory buffers.  What does this mean?
net.core.rmem_max, maximum receive socket buffer size, default 65535  What =

does this mean? Do I suffer from it while sending /receiving packets with=20
the size of 1500bytes



All related information is appreciated

Thanx in advance Andre





_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*=20
http://join.msn.com/?page=3Dfeatures/junkmail


