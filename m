From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bidirectional forwarding
Date: Wed, 28 Jul 2004 11:41:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407281141.19408.Antony@Soft-Solutions.co.uk>
References: <1090977653.4106ff750c48a@webmail.ccse.kfupm.edu.sa>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090977653.4106ff750c48a@webmail.ccse.kfupm.edu.sa>
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

On Wednesday 28 July 2004 2:20 am, Itrat Rasod Quadri wrote:

> Hello,
>
> I have setup linux routers as shown below
>
> PC1               R1           R2           R3           R4            PC2
>
> |---------------|   |-------|    |--------|   |--------|   |-----------|
>
> 192.168.10.2   .1  12.1    12.2 13.1     13.2 16.1    16.2 11.1       11.2
> e0             e0   e1     e0   e1        e0  e1       e0  e1          e0
>
> I am able to send traffic from PC1 to PC2 but I am unable to receive the
> response beyond R3. I am able to set up a bi directional path from R1 to R4
> but unbelievably I can't seem to do the same for PC1 and PC2. Response from
> a ping from PC2 doesn't go beyond e0 of R3.

I suspect this is almost certainly a routing table problem (on one or more of 
the systems involved).

Quickest way to eliminate netfilter as a cause of the problem is:

iptables -A FORWARD -p icmp -j ACCEPT

as a temporary rule on whichever of the above machines are running netfilter.

Sig below chosen specifically for this email.

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


