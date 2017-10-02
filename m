From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Mon, 2 Oct 2017 16:20:35 +0200
Message-ID: <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org>
 <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
 <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Will Sewell <me@willsewell.com>
Cc: netfilter@vger.kernel.org

Le 02/10/2017 à 14:07, Will Sewell a écrit :
>> I don't know the detail of conntrack data structures, but conntrack watches
>> packets in two places :
>> - when the packet enters netfilter (PREROUTING or OUTPUT)
>> - when the packet leaves netfilter (POSTROUTING or INPUT)
> 
> Ah, I think my confusion came from the meaning of the "original" and
> "reply" directions. I had assumed original packets were those packets
> entering Netfilter from the outside network, and reply packets
> entering Netfilter from the local machine and which are sent
> externally.

This is only 25% true, when the connection comes from the outside and is 
directed at the local host. It is the opposite when the connection 
originates from the local host and is directed at a remote host.
It is wrong for local to local connections (no packet is going outside) 
and forwarded connections (no packet is sent or received locally).

> It sounds like you're saying original packets are what
> what enters Netfiler, and reply packets are those which leave
> Netfilter (after potentially being transformed) and are propagated up
> the networking stack.

You totally misunderstood me.
All packets in both direction enter netfilter, and all packets leave 
netfilter unless they are discarded or queued.

The "direction" (original or reply) is not defined by the path into 
netfilter and the IP stack. It is defined by the first packet of the 
connection from the client to the server, the one which creates the 
conntrack entry. This packet and subsequent packets with similar 
features are in the original direction. Packets from the server to the 
client are in the reply direction. This is true regardless of whether 
the local host is the client, the server or an intermediate router.

Let me illustrate this with an example :

A TCP connection from 192.0.2.6:6666 to 192.0.2.7:7777
Apply DNAT to destination 192.0.2.8:8888
Apply SNAT to source 192.0.2.9:9999

Packet in the original direction when entering netfilter :
source address 192.192.0.2.6
source port 6666
destination address 192.192.0.2.7
destination port 7777

Packet in the original direction when leaving netfilter :
source address 192.192.0.2.9
source port 9999
destination address 192.192.0.2.8
destination port 8888

Packet in the reply direction when entering netfilter :
source address 192.192.0.2.8
source port 8888
destination address 192.192.0.2.9
destination port 9999

Packet in the reply direction when leaving netfilter :
source address 192.192.0.2.7
source port 7777
destination address 192.192.0.2.6
destination port 6666



