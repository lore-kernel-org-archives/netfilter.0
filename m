From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATting again
Date: Sat, 17 Jul 2004 10:08:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407171008.07388.Antony@Soft-Solutions.co.uk>
References: <f51b72bc04071608505bc1da93@mail.gmail.com> <200407161927.55940.Antony@Soft-Solutions.co.uk> <f51b72bc040716210743d323c2@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc040716210743d323c2@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Saturday 17 July 2004 5:07 am, Payal Rathod wrote:

> On Fri, 16 Jul 2004 19:27:55 +0100, Antony Stone
>
> > > Why is the FORWARD rule needed here?
> >
> > Because without it, the DNAT rule will change the destination address of
> > the packets, and then they won't be allowed through the next chain in
> > sequence (PREROUTING --> FORWARD --> POSTROUTING).
>
> I am sorry I don't undertand it much.

Try reading the section of Oskar Andreasson's tutorial discussing the path of 
packets through the chains and tables.

> Tell me one more thing if I have 10 machines in DMZ with 10 ports each to
> allow for outside world, does that mean writing 100 FORWARD rules and 100
> PREROUTING rules?

Yes.

You may find it possible to combine some of the rules by:

1. grouping IP addresses
2. using the multiport match
3. using a user-defined chain (if the ports to be allowed to all ten machines 
are the same, you can have 10 rules matching on the different IP addresses, 
all pointing to one user-defined chain, and then match the 10 ports in that 
chain)

However, one way or another you have to allow for each unique packet type you 
want to allow through your firewall.

100 rules is not a lot - people on this list have firewalls running with 
thousands of rules on them.

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


