From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: network setup help
Date: Sat, 10 Apr 2004 23:50:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404102350.24148.Antony@Soft-Solutions.co.uk>
References: <008301c41f2d$4be932e0$68892090@grouse>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008301c41f2d$4be932e0$68892090@grouse>
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

On Saturday 10 April 2004 7:54 pm, Jee J.Z. wrote:

> Dear all,
>
> I am trying to setup three PCs and do some simple filter+nat jobs. The
> situation is specified below:
>
> 1.PC1 has one NIC with a global IP connected to a Switch;
> 2.PC2 has two NICs, eth0 with a global IP connected to the Switch and eth1
> with an internal IP (192.168.0.1/24) directly connected to PC3's eth1;
> 3.PC3 has two NICs, eth0 with a global IP connected to the Switch and eth1
> with an internal IP (192.168.0.2/24) directly connected to PC2's eth1.

!? Why !?

(Either, why are PC2 and PC3 connected, or, why are both PC2 and PC3 connected 
to the switch?)

> I am trying to send packets from PC1 to PC3, via PC1/eth0(global
> IP)-->PC2/eth0(global IP)-->PC2/eth1(192.168.0.1)-->PC3/eth1(192.168.0.2).
> Actually, PC3/eth0 is not in used in the case.

So, what's PC3/eth0 for?

I think your problem is a routing table (almost certainly the one on PC3, but 
possibly the one on PC2).

Look at the routing table of each machine the packets are going through, and 
then the replies trying to get back again, and see if (a) there is a path, 
and (b) it makes sense.

I think once you've done this you will find the source of your problem, but I 
really do recommend you think about your network setup, and the path you are 
trying to get packets to take, and ask yourself "why do it like this?"

For your benefit I have specifically selected the sig on this email :)

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


