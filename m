From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Is DIVERT w/o forwarding feasible?
Date: Wed, 11 Sep 2002 10:16:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7EFBCF.70406@fugmann.dhs.org>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Bokhoncovich <byg@center-f1.ru>, netfilter@lists.netfilter.org

Yury Bokhoncovich wrote:
> Hello!
> 
> I need an advice for this topic: is diverting without forwarding feasible?
> At present time we've managed to work SSL-tunnels via our MAN-provider
> for a few several protocols by well-known method "connect this app to
> border gateway, it takes care all the rest" and with (essentially!)
> forwarding disabled in the kernel at all. But this method fails to meet
> challenge of deploying fully-functional VPN with transparent packet
> crossing over the MAN. In principle situation can be easily resolved if
> there's a way to divert packets to an program on the border gateway
> without need to enable forwarding in the kernel.
Err, please explain why you do not want forwarding enabled. If this is 
because you want to control who accesses the internal network, and are 
afraid of ipspoofing, then VPN is the way to go.

You say that you have ssh-tunnels to the systems.
ssh supports a socks mode. This means that when the client ssh'es to the 
firewall, ssh can be set to act as a local socks server, tunneling all 
packets to the server, making them seem like they originate from the 
server itself. This works just like a VPN, and there is no need to setup 
alot of different tunneling rules. On the client a sock-client should be 
setup. As of today OpenSSH only supports SocksV4, which does not support 
udp packets. There are some simple patches on the net to enable socksV5, 
which does support udp packets to socks.

While talking of VPN's. Have you considered ipsec or other VPN systems?

> 
>  I.e. can I change this:
> "if the kernel does not have forwarding enabled, or it doesn't know how to
> forward the packet, the packet is dropped"
> (sorry ,quote from HOWTO) to something like
> "if the kernel does not have forwarding enabled AND NO SPECIAL DIVERT
> RULES SPECIFIED, or it doesn't know how to forward the packet, the packet
> is dropped" ?
Technically yes. But you would have to spend alot of time coding, and 
understading networking traffic. In essence what you want it to create a 
VPN module for netfilter to be installed on the server and some client 
program to encapsulate packets and send them to the server, which seems 
to me as re-inventing the wheel. (When there are Ferraris out there for 
free, why build your own skoda?)

Regards
Anders Fugmann


-- 
Author of FIAIF
Fiaif Is An Intelligent/Iptables Firewall
http://fiaif.fugmann.dhs.org


