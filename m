From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding in a NAT..
Date: Sun, 22 Sep 2002 11:03:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020922100331.EYTD2092.mta07-svc.ntlworld.com@there>
References: <F185dlqHukzpaPE3vX7000158cf@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F185dlqHukzpaPE3vX7000158cf@hotmail.com>
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

On Friday 20 September 2002 4:03 am, Random Person wrote:

> Ok, this is a question that has probably been answered before, but I'm
> going to ask anyway because I can't find the answer.
>
> I have 2 eth interfaces (eth0/eth1) and I use my linux box as a
> firewall/gateway NAT... What I want to do is take any packet that comes to
> eth0 (internet) that has destination port X and is trying to start a
> connection is forwarded to eth1 (internal network)... but not to a specific
> computer (i.e.. not mangled in any way but with the packet still having
> same source/dest address).
>
> Ok, did that make any sense?

No :-)

You want to take a packet which comes in to eth0 (your external interface) 
with destination port X....

Now, if it has come in to your external interface, one of three situations 
applies:

1. The destination address on the packet is the external address of your 
firewall, therefore if you don't change the destination address in a NAT rule 
then it's not going to go anywhere else.

2. The destination address on the packet is another address in the same 
subnet as the external interface of your firewall, and that interface has 
done a proxy arp for it.   Same thing applies here - if you don't change the 
destination address in a NAT rule then the packet's not going to go any 
further than your firewall.

3. The destination address on the packet is an address which your ISP is 
routing to you, through your firewall address (ie your ISP regards your 
firewall as a router, and is routing packets with the destination address 
we're discussing using the firewall address as a next-hop gateway).   In this 
case you simply need to have the firewall know how to route those packets, 
and have a suitable rule in your FORWARD chain to allow them, and they will 
reach their destination (as specified in the original packet).

If this doesn't answer your question please repeat the question, telling us:

1. The external address of your firewall
2. The internal address of your firewall
3. The address range of machines on your internal LAN, to which you want 
these packets to be sent
4. An example destination address on such a packet so we can see how it might 
be able to get there.

By all means disguise / change / hide parts of any real IP addresses in the 
above information, provided we can still understand what's left.   A good way 
to do it is to make the first byte of any public IP addresses you're using 
more than 300 - it's obviously an invalid address, but it doesn't stop us 
answering the question.

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it is capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

