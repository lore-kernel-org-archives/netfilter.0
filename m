From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: chains in the same table
Date: Fri, 7 May 2004 00:07:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405070007.45572.Antony@Soft-Solutions.co.uk>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105> <200405061147.35201.Antony@Soft-Solutions.co.uk> <006001c433bd$3b278de0$68892090@grouse>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006001c433bd$3b278de0$68892090@grouse>
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

On Thursday 06 May 2004 11:55 pm, Jee J.Z. wrote:

> Hi Antony, Amit, Frank, and Klemen,
>
> Thank you all for your replies. Your answer actually is what I was
> expected. However, I did an experiment which seems to show it is not the
> case, and therefore I got confused.
>
> My network structure is as follows:
>
>  PC1
>  (eth0:global_ip_1)
>   |
>  (eth0:global_ip_2)
>  PC2
>  (eth1:192.168.0.1)
>   |
>  (eth1:192.168.0.2)
>  PC3
>
> I put the following rules on the PC2:
>
> iptables -F
> iptables -F -t nat
> iptables -I FORWARD -j QUEUE
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip_2
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2
>
> echo '1' >/proc/sys/net/ipv4/ip_forward
>
> Since I didn't put in the rules like "iptables -P INPUT DROP" and
> "iptables -P OUTPUT DROP", I expect traffics that addressed to PC2 will not
> be passed on to the FORWARD chain

The three chains are totally independent of each other.

The default policy on INPUT has no bearing whatsoever on how packets will get 
processed by FORWARD (and vice versa, etc...)

>, and therefore they will not be queued to
> userspace. However, it seems not the case. When I ftp or ping from PC1 to
> PC2 (addressed to PC2), all the packets are queued to userspace and if
> accepted from userspace are then DNATed to PC3. Could you explain this to
> me?

PREROUTING happens (as you might guess from the name) before the routing 
decision, and it is the routing decison which determines whether a packet is 
destined for:
a) the local machine, or
b) somewhere else.

If the answer is (a), then the packet goes through the INPUT chain, and does 
not go through the FORWARD chain.

If the answer is (b), then the packet goes through the FORWARD chain, and does 
not go through the INPUT chain.

The thing which determines whether a particular packet goes through INPUT or 
FORWARD is its destination address at the point where it hits the routing 
decision (which is the standard routing mechanism in the Linux kernel, not 
really anything to do with netfilter).   The only way in which netfilter can 
affect this is by changing the destination address in the PREROUTING chain.

Hope this helps?

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


