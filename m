From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Combination of state match and source/destination match problem.
Date: Wed, 4 Aug 2004 08:49:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051230@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> I just want to figure out the relation between state match and IP =
address
> (source and destination ) match of iptables.  And my Redhat 9.0 box =
which
> has a static IP address of 192.168.220.8 has a ssh service runing on =
tcp
> port 22.  And my client Linux box with
> IP address 192.168.220.6 try to ssh my RH9 box.
>
> Here is my simple iptables rule on 192.168.220.8.
>
> #iptables -F
> #iptables -F -t nat
> #iptables -F -t mangle

Flushes the filter, nat and mangle tables.  Note that flushing does not =
reset the POLICY setting of any chain.

> #iptables -P INPUT DROP

Sets the POLICY of the INPUT chain to DROP, meaning:  if a packet goes =
through this chain and never matches any rule, it will be dropped.

> #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

Any packet that is part of an ESTABLISHED conenction will be accepted.

> #iptables -A INPUT -s 192.168.220.6 -j ACCEPT

Any packet with a source IP of 192.168.220.6 will be accepted.

> To my understanding, the INPUT chain of 192.168.220.8 box here deny =
all the
> external NEW connetions INCLUDING connetions from 192.168.220.6. And =
the
> result is exact what
> I expected. I can't ssh my RH9 box from 192.168.220.6 as well as other
> boxes.

Not really--the rules you have specified should allow 192.168.220.6 to =
initiate a connection to any port on any IP address local to any =
interface of the netfilter machine.  The fact that it's not working =
would lead me to believe that there's something else going on in your =
OUTPUT chain, or the source of your connection is not actually =
192.168.220.6.  Remember--just because you allow a packet in--doesn't =
necessarily mean that it has a way out.

> But when I change the iptables to:
> #iptables -F
> #iptables -F -t nat
> #iptables -F -t mangle
> #iptables -P INPUT DROP
> #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> #iptables -A INPUT -d 192.168.220.8 -j ACCEPT
>
> This time it works, I can ssh 192.168.220.8 from 192.168.220.6. Even =
when I
> replace the last rule with
> #iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> it also works.

This would lead me to believe that somehow--the source IP of your SSH =
packets are not actually 192.168.220.6.  If they were the previous =
ruleset should have worked too.  So it probably does not have anything =
to do with the OUTPUT chain.

> So this time it means INPUT chain of 192.168.220.8 box here deny all =
the
> external NEW connetions EXCEPT connetions to 192.168.220.8 OR =
destination
> port 22.
> But this conflicts with previous one. According to the previous =
example this
> doesn't work.
>
> So my question is what's the relation between state match and
> source/destination match?
> Or maybe which one comes first or who's seting overwrite the other?

The relation is this:  the rules for each chain are process in order, =
one by one, first match wins.  If no rule matches--the chain POLICY is =
enforced.

-j

