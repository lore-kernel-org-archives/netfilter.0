From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables State Table
Date: Thu, 7 Jul 2011 18:52:28 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107071840240.3659@frira.zrqbmnf.qr>
References: <41268.1309529522@princeton.edu> <1310050556.12710.2149230885@webmail.messagingengine.com> <4E15CCDF.7010704@abpni.co.uk> <1310055574.13240.2149268161@webmail.messagingengine.com> <4E15DFD4.8090805@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E15DFD4.8090805@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org, netfilter@buglecreek.com


On Thursday 2011-07-07 18:33, Jonathan Tripathy wrote:
>>> netfilter@buglecreek">netfilter@buglecreek.com wrote:
>>>> Given the following simplified rules:
>>>> iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
>>>> iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Use -m conntrack.

>>>> When the system boots, various daemons create persistent connections
>>>> that stay established indefinitely to authentication servers like the
>>>> following:
>>>> clientSytem:44444 ----->  authServer:389
>>>> This creates an entry in the iptables state table which works fine.

Nope, it creates an entry in nf_conntrack's connection tracking table,
besides also creating a TCB in each of the connections endpoints.

>>>> Once that happens the
>>>> established connection is still there, but when the authServer sends a
>>>> packet back to the clientSystem the packet is viewed as new and
>>>> eventually gets dropped since their is nothing in the state table.

(Slight nitpick.) If there is no entry in the CT table, there is no
room to store a state like NEW.

>>>> The only way I can think of allowing for this is to create a rule that
>>>> allows new connections from the authServer:389 to the clientSystem:any. Is
>>>> there a better way?

NFCT has a sysctl net.netfilter.nf_conntrack_tcp_be_liberal that, if set
to 1, can pick up TCP connections from something else than a SYN.

>>> Shouldn't the software in question detect a connection drop and then
>>> re-attempt to connect to the server?

Yes, though it may take a longer time for the TCB timeout to expire.
If it is a local network service, sending RSTs, i.e. letting extraneous
packets run into a reject-type rule, is thus preferred.

>> The connection never drops.  Netstat shows the connection as
>> ESTABLISHED

Use ss(8). netstat is of the same type of unmaintained buggy tools like
ifconfig-it's a pest.

>> but the iptables state table does not have the connection
>> since it was cleared.  So, if there were no iptables running the

(iptables always runs unless you unload the kernel module.)

>> connection would carry on normal comms. Since there are rules that only
>> allow established connections the packet gets dropped due to the
>> clearing of the state table. Hope that makes sense.

So make sure that the NFCT entry does not expire. Normally, it
should follow the TCB lifetime, which is like, 5 days.

> What I am confused about though is why netstat is showing the state as still
> ESTABLISHED.

ss/netstat shows the TCB state, *not* the NFCT state!

> Most good firewalls (not just iptables) include a feature to reset the state
> table.

Which is `conntrack -F` on Linux.


[And for God's sake, don't strip the Cc list.]
