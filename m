From: deniska@westnet.com.au
Subject: Re: Traffic counts wrongly in OUTPUT.
Date: Sat, 5 Mar 2005 22:53:46 +1030
Message-ID: <7087.70631249553$1110024968@news.gmane.org>
References: <20050305071603.GA26850@(none)> <opsm5uelt8do0wqz@supportivo.org>
Reply-To: deniska@westnet.com.au
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <opsm5uelt8do0wqz@supportivo.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Daniel wrote:
> Where do you account these 10Mbytes per second? What tool do you use? What 

# iptables -I OUTPUT 1 -o ppp0 -j LOG
# iptables -Z OUTPUT; while true; do iptables -L -v | egrep 'OUTPUT|LOG'; sleep 1; done

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)                                                                   0     0 LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 11409 packets, 17M bytes)
11409   17M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 20800 packets, 30M bytes)
20800   30M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 30292 packets, 44M bytes)
30292   44M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 39745 packets, 58M bytes)
39745   58M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 49285 packets, 72M bytes)
49285   72M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 58688 packets, 85M bytes)
58688   85M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Chain OUTPUT (policy ACCEPT 68216 packets, 99M bytes)
68216   99M LOG        all  --  any    ppp0    anywhere             anywhere            LOG level warning 
Control-C

> kind of shaping discipline you use? I suppose a simple TBF may sort you 
> problems out. The bottleneck with those modems is their ethernet 
> subinterface, which tends to provide 100Mbit/sec, but the modem can upload 
> just a tiny bit of those. An egress classless qdics will fix your 
> problems. TBF of pfifo_fast which is default.

and my QoS setting...

tc qdisc add dev ppp0 root handle 1: prio
tc qdisc add dev ppp0 parent 1:2 tbf latency 50ms burst 1450 rate 50kbit
tc qdisc add dev ppp0 parent 1:1 pfifo limit 200
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 80 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 25 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 110 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 143 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 22 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 21 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip sport 21 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip sport 25 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip sport 80 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 20 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 1 u32 match ip dport 53 0xffff flowid 1:1
tc filter add dev ppp0 protocol ip parent 1: prio 2 u32 match u32 0 0x0 flowid 1:2

Regards,
D.

