From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: recently confused about setting a chain policy
Date: Tue, 29 Oct 2002 23:12:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029231256.RWXD18329.mta06-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210291727380.17897-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210291727380.17897-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Tuesday 29 October 2002 10:37 pm, Robert P. J. Day wrote:

> for the longest time, i always thought that, to set a global,
> total DROP policy as a starting point, i just had to:
>
>   # iptables -P INPUT DROP
>   # iptables -P OUTPUT DROP
>   # iptables -P FORWARD DROP

That is correct.   These policies, so long as you have no rules, will block 
everything into, out of, and through the machine.

> but i just looked at the "panic" clause in the case statement in
> /etc/init.d/iptables and i'm a bit confused.

I'm not surprised.   Where does this script come from ?

>   panic)
> 	echo -n $"Changing target policies to DROP: "
> 	iftable filter -P INPUT DROP && \
> 	    iftable filter -P FORWARD DROP && \
> 	    iftable filter -P OUTPUT DROP && \
> 	    iftable nat -P PREROUTING DROP && \
> 	    iftable nat -P POSTROUTING DROP && \
> 	    iftable nat -P OUTPUT DROP && \
> 	    iftable mangle -P PREROUTING DROP && \
> 	    iftable mangle -P OUTPUT DROP && \
> 	    success $"Changing target policies to DROP" || \
> 	    failure $"Changing target policies to DROP"
> 	echo
>
> first, the above suggests that a policy is assigned, not just
> to a chain, but to a chain/table combination, which comes as a
> surprise to me.

That is correct.   If you do not specify -t nat or -t mangle then the default 
is to apply rules (and policies) to -t filter, however you can (if you like 
living dangerously) set a default policy other than ACCEPT on a mangle table 
or a nat table.

> and second, what's with having a DROP policy on the nat and
> mangle tables anyway?

What is it ?   It's a very bad idea, that's what it is.   I'll agree that if 
you have decided to panic, then you might as well panic thoroughly, but there 
really is no good reason to be doing this on the nat or mangle tables.

> i thought those tables were strictly
> for packet transformation, not filtering.

Again, you are correct.

The 'filter' table is for filtering packets (ie accepting them, dropping them 
or rejecting them, mostly).

The 'nat' table is for changing source or destination addresses, and also for 
mucking about with tcp/ udp port numbers.

The 'mangle' table is for doing weird other things mainly to packet headers 
which most people don't want to know about.

You should be *very* careful about doing any filtering in the nat or mangle 
tables, and you should never set a default policy on nat or mangle (other 
than ACCEPT).

> can anyone explain the above?  or am i just thoroughly
> confused yet again?

You are confused because you do understand what is going on, and you do 
understand what is reasonable practice, and you have found a script which is 
doing something very strange and in my opinion unreasonable.
 

I hope that helps to reassure you :-)
 

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

