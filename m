From: Payal Rathod <payalrathod@gmail.com>
Subject: Re: NATting again
Date: Sat, 17 Jul 2004 09:37:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc040716210743d323c2@mail.gmail.com>
References: <f51b72bc04071608505bc1da93@mail.gmail.com> <200407161703.42973.Antony@Soft-Solutions.co.uk> <f51b72bc0407161049d9edfa7@mail.gmail.com> <200407161927.55940.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407161927.55940.Antony@Soft-Solutions.co.uk>
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

Hi,

On Fri, 16 Jul 2004 19:27:55 +0100, Antony Stone 
> > Why is the FORWARD rule needed here?
> 
> Because without it, the DNAT rule will change the destination address of the
> packets, and then they won't be allowed through the next chain in sequence
> (PREROUTING --> FORWARD --> POSTROUTING).

I am sorry I don't undertand it much. Tell me one more thing if I have
10 machines in DMZ with 10 ports each to allow for outside world, does
that mean writing 100 FORWARD rules and 100 PREROUTING rules?
 
> If you *didn't* have a DNAT rule, you would need a FORWARD rule, so I think it
> would seem strange if you didn't need a FORWARD rule just because you'd
> changed the destination address.   (For example, what would happen if you
> used a DNAT rule which "changed" the address to the same as it already was?
> Or maybe two DNAT rules in a row - one changes it, and the next changes it
> back again?)

Sorry again, but this is just sounding greek to me now :)

With warm regards,
-Payal

