From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Combination of state match and source/destination match problem.
Date: Wed, 4 Aug 2004 13:47:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408041347.36711.Antony@Soft-Solutions.co.uk>
References: <BAY11-F4AkOhw2RlC6a000063d2@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY11-F4AkOhw2RlC6a000063d2@hotmail.com>
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

On Wednesday 04 August 2004 1:26 pm, ctg60 ctg60 wrote:

> Hi all,
>
> Sorry for my English.
>
> I just want to figure out the relation between state match and IP address
> (source and destination ) match of iptables.

This is quite a simple question to answer:

All conditions specified in a rule must match a packet for the target of that 
rule to take effect.   There is no "order" because the different conditions 
are quite independent of each other.

> And my Redhat 9.0 box which has a static IP address of 192.168.220.8 has a
> ssh service runing on tcp port 22.  And my client Linux box with IP address
> 192.168.220.6 try to ssh my RH9 box.
>
> Here is my simple iptables rule on 192.168.220.8.
>
> #iptables -F
> #iptables -F -t nat
> #iptables -F -t mangle
> #iptables -P INPUT DROP
> #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> #iptables -A INPUT -s 192.168.220.6 -j ACCEPT
>
> To my understanding, the INPUT chain of 192.168.220.8 box here deny all the
> external NEW connetions INCLUDING connetions from 192.168.220.6.

I disagree.   The INPUT policy is DROP, therefore any packets which do not 
match a rule will get DROPped.

The first rule in the chain says "ACCEPT any packets which are part of an 
ESTABLISHED connection".   This rule will apply to the second and subsequent 
packets of a connection, but not the first one.

The second rule in the chain says "ACCEPT any packets from 192.168.220.6".   
That means packets of any type, any protocol, any port number.

> And the result is exact what I expected. I can't ssh my RH9 box from
> 192.168.220.6 as well as other boxes.

I wonder why?   What rules do you have for the OUTPUT chain?

> But when I change the iptables to:
> #iptables -F
> #iptables -F -t nat
> #iptables -F -t mangle
> #iptables -P INPUT DROP
> #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> #iptables -A INPUT -d 192.168.220.8 -j ACCEPT

This last rule says "ACCEPT any packet addressed to me", which, in the INPUT 
chain, is a bit pointless, since only packets addressed to the machine itself 
will enter the INPUT chain at all.   The only other address you're going to 
see in INPUT is 127.0.0.1 for loopback packets.

> So my question is what's the relation between state match and
> source/destination match?

There's no relation.   All the conditions specified in a rule must be true for 
the packet to match, and the target to be activated.

Here's an example of a rule for you to think about:

iptables -A INPUT -s 192.168.10.5 -p tcp --dport 22 -m state --state NEW -j 
ACCEPT

This will ACCEPT only packets which are from machine 192.168.10.5 *and* are 
TCP packets going to destination port 22 *and* are NEW packets.   If any one 
(or more) of those three things is not true, the packet will not match, and 
will get tested against the next rule in the chain.

Hope this helps,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


