From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: Ipsec/L2tp with NETKEY
Date: Sat, 04 Jul 2009 07:14:56 +0300
Message-ID: <4A4ED740.9050104@caf.com.tr>
References: <1246666906.5753.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1246666906.5753.31.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 04.07.2009 03:21, Martin wrote:
[...]
> Here is a diagram, just for fun ;)
> 
> MS-client ==== /ext interface/ Linux GW /internal interface/ ==== LAN
> 
> 
> What I see is that user completes ipsec auth, and then tries to connect
> to the l2tpd's port (7101) on the external interface, and then I must
> accept connections in that port, or the vpn connection fails.
> 
> 
> Any suggestions how to let connections on udp 1701 only to connections
> before authenticated by ipsec?

On the openswan machine, mark the ESP packets and accept only marked
packets to l2tpd daemon:

# iptables -t mangle -A PREROUTING -i $EXT_INT -p 50 -j MARK --set-mark 1
# iptables -A INPUT -i $EX_INT -m mark --mark 1 -j ACCEPT
# iptables -A INPUT -i $EX_INT -p udp --dport 1701 -j DROP

-- 
Eray
