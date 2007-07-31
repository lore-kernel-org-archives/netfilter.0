From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: blocking access to port 22 when INPUT policy is ACCEPT
Date: Tue, 31 Jul 2007 18:40:00 -0500
Message-ID: <46AFC850.5060307@riverviewtech.net>
References: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>	<b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
	<20070731221833.GA589@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070731221833.GA589@outback.rfc2324.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 7/31/2007 5:18 PM, Maximilian Wilhelm wrote:
> You can't.

Yes you can.  Well if you understand the concepts of latter logic used 
when electro-mechanical relays were used to control elevators you can.

> But what's wrong with the two rules?

Nothing.  The old saying "If it isn't broke, don't fix it..." with it's 
third stanza "...optimize it!" comes to mind.

> What you could do if you like is to pass every connection to port 22 
> to a subchain like this:
> 
> iptables -N filter_ssh_access
> iptables -A INPUT -p tcp --dport 22 -j filter_ssh_access

Yes...

> iptables -A filter_ssh_access -s ! a.b.c.d/29 -j REJECT --reject-with 
> icmp-admin-prohibited
> iptables -A filter_ssh_access -s ! e.f.g.h -j REJECT --reject-with 
> icmp-admin-prohibited

Oh, so close.

> You might have noticed that I've changed the "DROP" to "REJECT" with 
> fitting type which will make the live of you and other people easier 
> when debugging anything related to ssh access to this box.

The problem with this is that if you have an IP address of e.f.g.h, the 
first rule will reject the connection.  Negative logic does not work 
quite as you would expect it to.  You have to work with inverted 
positive logic below (invert the result of the entire set of logic).

There is also the fact that fewer and fewer things know how to handle 
error messages like this, or if they do they do not display them to the 
end user.  (Thanks M$!)  You may have better luck with a basic REJECT 
target than one that specifies the ICMP error code unless you know that 
you are working with a client application that can correctly interpret.

Try this on for size.

iptables -N filter_ssh_access
iptables -A INPUT -p tcp --dport 22 -j filter_ssh_access

iptables -A filter_ssh_access -s a.b.c.d/29 -j ACCEPT
iptables -A filter_ssh_access -s e.f.g.h -j ACCEPT
iptables -A filter_ssh_access -j REJECT --reject-with icmp-admin-prohibited

In this case, you are jumping to a sub-chain just like Max suggested. 
However the difference is that you are accepting on known good and then 
rejecting after the list of known good has been exhausted.  This will 
scale compared to rules conflicting with each other, which is what the 
OP and Max had happening.



Grant. . . .

