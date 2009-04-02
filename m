From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables - full cone
Date: Thu, 2 Apr 2009 15:37:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0904021535400.15325@blackhole.kfki.hu>
References: <47A7F67C62706041BC49DB7822B1C9DB1506FB38FD@INOAVREX11.ptin.corpPT.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47A7F67C62706041BC49DB7822B1C9DB1506FB38FD@INOAVREX11.ptin.corpPT.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hugo Miguel Mendes <est-h-mendes@ptinovacao.pt>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 1 Apr 2009, Hugo Miguel Mendes wrote:

> I'm using iptables 1.3.8, and I need to implement a full cone NAT which had to be capable of doing the following:
> 1. A packet is sent from a machine in the LAN from Address1:port100 to a machine in the WAN with Address3:port200, the NAT converts the local Address1:port100 to Address2:port100 which is the address assigned to the home router by the ISP. So this packet is sent with source: Address2:port100 and destination: Address3:port200.
> 2. The packet received by the machine in the WAN in 1) is processed and then the answer comes from a different machine with a different address but using the same ports. So the response packet is sent by Address4:port200 to Address2:port100. So this packet has source: Address4:port200 and destination: Address2:port100.
> 3. When the home router receives the response packet it has to ignore the sending address in the matching table, so that all traffic received in Address2:port100 is simply forward to Address1:port100. This is just a Full Cone NAT.
> 
> I have read some tutorials about iptables and the only way I have found to do this is make rule that forwards all traffic that arrives in Address2:port100 to Address1:port100. This does the work for just one machine on the LAN which has a static ip and will always contact the same machine on the WAN.
> What I really want to do is implement a Full Cone NAT in which a packet sent from Address1:port100 which is translated to Address2:port100 by the NAT and goes to Address3:port200, activates port100 in the home router so that any packets arriving in port100 will be forwarded to Address1:por100. And this would just work for any number of machines.
> 
> Is there anyway of doing so in the actual iptables or I will have to add this feature to iptables?

Netfilter implements port restricted cone NAT, so you cannot create a full 
cone NAT with it. I don't think it'd be easy to add such a feature.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
