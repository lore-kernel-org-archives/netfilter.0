From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding help
Date: Wed, 26 Nov 2003 22:30:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311262230.31909.Antony@Soft-Solutions.co.uk>
References: <000701c3b469$17203ba0$14d36c50@anonymous>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3b469$17203ba0$14d36c50@anonymous>
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

On Wednesday 26 November 2003 10:03 pm, sc2@gmx.at wrote:

> hello
> i use iptables .7, but it does not work (forward) , any ideas?
> thank you ,
> ps: same rules down i have make for tcp match not only for udp
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -F FORWARD
> iptables -t nat -F
> iptables -A FORWARD -j LOG
> iptables -A FORWARD -p udp -d ip --dport port -j ACCEPT
> iptables -t nat -A PREROUTING -p udp -d ip --dport port -j DNAT --to
> ip:port

I assume in that last rule the two occurrences of "ip" are different.

Which one is specified in the FORWARD rule?   Make sure it is the translated 
address (ie the address on the packet after it has gone through the 
PREROUTING rule), because it will no longer have the original destination 
address by the time it hits the FORWARD chain.

If that's not the answer then post your actual ruleset (by all means munge the 
addresses if you don't want us to know exactly what they are, but let us see 
which ones are which...)

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


