From: mclinden@informed.net
Subject: RE: netfilter forwarding to FTP gateway
Date: Wed, 2 Jun 2004 08:28:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF688D8E69.EC294E79-ON85256EA7.00434B36-85256EA7.00467F7C@informed.net>
References: <7C9884991ADAE0479C14F10C858BCDF591E322@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E322@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org, netfilter-admin@lists.netfilter.org

The configuration looks like the following. I CAN manipulate the CISCO 
configurations, if need be, but the client gets a little skittish about 
this kind of stuff. Of course, since IP is supposed to be connectionless, 
they COULD have make the network flat (instead of subnetting) and let 
their switches handle the routing (in which case, MS would have no 
problems since 172.16.11.0 and 172.16.16.0 would be on the same network).

Does this make things any clearer?

Sean



MS Windows Client                                           Linux 
"Forwarder"
172.16.16.39/22 172.16.16.8/22
Default Route: 172.16.16.200                          Default Route: 
172.16.16.20 
            ^                  ^
             |                    |
             |                    |
             ___________________________________
                                                    |
                                                    |
                                 CISCO Catalyst
                                  172.16.16.200
                                                    |
                                                    |
                                                    |
                                 CISCO Catalyst
                                  172.16.8.200
                                                    |
                                                    |
              ________________
             |
             |
             v
Linux FTP Proxy (incoming port 2370)
Internal Interface: 172.16.11.237/22
External Interface: Internet






"Daniel Chemko" <dchemko@smgtec.com>
Sent by: netfilter-admin@lists.netfilter.org
06/01/2004 06:25 PM
 
        To:     <mclinden@informed.net>, <netfilter@lists.netfilter.org>
        cc: 
        Subject:        RE: netfilter forwarding to FTP gateway



Nice description, but one piece of info's required.

If you want transparent control of services, you MUST have control of
all gateways. If 172.16.16.0/22 has anotehr gateway besides the firewall
your talking about, you need to perform the following:

# 172.16.16.0/22 router (GATEWAY2)
ip route add 172.16.11.237/32 via ${GATEWAY1_NET16} dev ${IF_NET16}
iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT
--to 172.16.11.237:2370
iptables -t nat -A POSTROUTING -d 172.16.11.237 -p tcp --dport 2370 -j
SNAT --to ${GATEWAY2_NET16}

# 172.16.8.0/22 router (GATEWAY1)
# Theoretically these rules don't need to exist since hosts on the
subnet should never be required to hit the firewall first.
iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT
--to 172.16.11.237:2370
iptables -t nat -A POSTROUTING -d 172.16.11.237 -p tcp --dport 2370 -j
SNAT --to ${GATEWAY1_NET16}

If you don't have access to GATEWAY2, you're hooped. You need channel
control to get it working.

If there isn't gateway2, then just use the rules from GATEWAY1. The SNAT
rule is just a sanity check to make sure the routes are sane. If there
aren't any other routers in the network, they probably aren't needed.



> I also configure point to point routes to the specific FTP sites using
> 172.16.11.237 as the gateway, which appears to work ok for systems on
> the same subnet (172.16.8.0/22). But Microsoft's desktop OSs do not
> let you specify gateways outside the subnet of the client, therefore,
> clients on the 172.16.16.0/22 subnet cannot use the transparent FTP
> proxy. 
> 
> My thought was to put another Linux box with a single interface on the
> 172.16.16 subnet, use it as the gateway to the downstream clients, and
> have it forward all packets for port 21 to the machine on the other
> subnet. But I'm a bit confused on how to do this.
> 
> Suggestions or references to tutorials/faqs/etc would be appreciated.
> 
> Thanks in advance
> 
> Sean McLinden
> Allegheny County Health Department




