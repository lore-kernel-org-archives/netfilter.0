From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: irc
Date: Mon, 17 Nov 2003 19:29:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171929.hAHJTrj22410@agate.rockstone.co.uk>
References: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com>
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
To: netfilter@lists.netfilter.org

On Monday 17 November 2003 6:42 pm, trainier@kalsec.com wrote:

> Okay, here's the revised copy of my situation, with ip addresses:
>
> Client machine (192.168.1.162) ->  (192.168.1.7)  squid-proxy
> (208.224.3.156)  ->  DMZ  (208.224.3.153) ->  (irc.blessed.net)  IRC
> Server.

Right.   This looks to me like the squid proxy is also your router between 
the LAN and the Internet, therefore it needs standard NAT and FORWARDing 
rules to allow non-http traffic as well as the REDIRECT rule for diverting 
your http traffic to squid itself.

eg:

iptables -P FORWARD DROP
iptables -F FORWARD
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -p udp --dport 53 -j ACCEPT
(if you're using an internal DNS server, add another rule like the one above 
but for TCP traffic on port 53 as well)
iptables -A FORWARD -i eth1 -p tcp --dport 6667 -j ACCEPT
(the above rules assume eth1 is your internal interface - change if needed)
iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to 208.224.3.156
(the above rule assumes eth0 is your external interface - change if needed)

And, of course, make sure the box is forwarding packets:

echo 1 >/proc/sys/net/ipv4/ip_forward

If that doesn't do the trick start adding some LOGging lines above and/or 
below these rules and find out what traffic I've missed.

Regards,

Antony.

-- 

Windows: just another pane in the glass.

                                                     Please reply to the list;
                                                           please don't CC me.

