From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables: exe
Date: Sat, 21 Sep 2002 23:19:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921221957.QKZQ13996.mta05-svc.ntlworld.com@there>
References: <20020921220721.11083.qmail@web20303.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020921220721.11083.qmail@web20303.mail.yahoo.com>
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

On Saturday 21 September 2002 11:07 pm, Tasha Smith wrote:

> Thanks Antony for your tips..:) im just starting out
> with iptables so it is really helping..and yes i have
> 2 interfaces so i will move the forwarding rule to
> the end, and add these rules:
> iptables --policy OUTPUT DROP

I would recommend you don't add that policy until everything else is working, 
because you are likely to block stuff getting out of your machine with this 
policy and it's better to have a system which works, then you add this rule 
and fix what gets broken, instead of putting this in at the beginning and 
getting too many problems to fix all at once.

> iptables --policy FORWARD DROP

Good.   Then you add the rules to your FORWARD chain to allow the packets you 
want.

> iptables -t nat --policy PREROUTING DROP

No !!!!!!   Don't do that !!!!   Setting a DROP policy, or even creating a 
DROP rule, in a nat table is a really *bad* idea.   You will block *all 
sorts* of traffic from getting through your machine and it simply won't work.

Do not filter packets in the nat tables - use those for address translating.  
Do your filtering in the filter tables - mainly in the INPUT and FORWARD 
chains, depending on where the packets are going.

> iptables -t nat --policy OUTPUT DROP

Remove this rule for the same reason given above.

> iptables -t nat --policy FORWARD DROP

There is no nat table in the FORWARD chain, so you couldn't even do this one 
if you tried :-)

> HEHEHE...now only if i could get them to startup :)
> properly!!

Like I said earlier, I hope someone else here can help with that - there are 
plenty of RedHat users on the list.   Unfortunately (for you) I'm not one of 
them.

Antony.

-- 

This email was created using 100% recycled electrons.

