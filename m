From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARDING and NAT chains
Date: Fri, 30 Jan 2004 10:25:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301025.17981.Antony@Soft-Solutions.co.uk>
References: <001901c3e670$a4bd2250$3d40000a@wisdom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001901c3e670$a4bd2250$3d40000a@wisdom>
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

On Thursday 29 January 2004 2:02 pm, Srinivasa Hebbar wrote:

> Hello,
>
> I believe that the NAT PREROUTING and POSTROUTING will
> always takes place for all the incoming/outgoing packets
> irrespective of whether the packet is destined to the node or not.
>
> I have a situvation that if the dest. IP address of the packet is
> for the local node, then apply NAT rule, otherwise it should simply
> forward the packet according to the routing table.
>
> How can I achive the above?

Place the destination address in the nat rule, eg:

iptables -A PREROUTING -t nat -d ! my.ip.add.ress -j DNAT --to a.b.c.d

This means "destination nat all packets which are not addressed to 
my.ip.add.ress and send them to a.b.c.d".

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


