From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Change source address on incoming packets
Date: Sun, 9 May 2004 23:14:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405092314.01941.Antony@Soft-Solutions.co.uk>
References: <409EA7A6.8070000@mail.ee>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409EA7A6.8070000@mail.ee>
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

On Sunday 09 May 2004 10:50 pm, Joel Vosu wrote:

> I would need to be able to change the source address of incouming
> packets. I have 2 different subnets, but I need the server to see the
> packes from the 2nd subnet as coming from the 1st.
> in iptables it would be something like:
> iptables -A PREROUTING -t nat -s 2nd_subnet -j SNAT --to-source
> local_machine
> but this is not possible because SNAT only works for outgoing packets in
> POSTROUTING.
> Is there a way to get this to work other than adding a second router box
> for NAT?

The only way I can think you'd be able to do this on one box is by hacking 
around the source for netfilter so you can use SNAT in PREROUTING.   You'd 
need to be careful about the auto-reverse NAT for reply packets, as well, to 
make sure they go back to the original machine.

Not impossible, by any means, but it's almost certainly easier to dig up an 
old 486 or Pentium and run NAT on that.

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


