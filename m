From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Questions on load-balancing (-j DNAT)
Date: Fri, 21 Sep 2007 14:43:17 -0500
Message-ID: <46F41ED5.7090701@riverviewtech.net>
References: <00b301c7fc73$ba6cf590$b800a8c0@cybergeneration.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00b301c7fc73$ba6cf590$b800a8c0@cybergeneration.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 09/21/07 12:20, Maxime Ducharme wrote:
> Lately we had some problems connecting to the servers behind and we 
> noticed our firewall's conntrack maxed out, we saw these messages 
> appear in system logs :
> 
> kernel: ip_conntrack: table full, dropping packet.

That's no fun at all.

> /proc/sys/net/ipv4/ip_conntrack_max contains 16368,
> 
> we raised server's RAM and raised this value

*nod*

> we are using kinda old iptables, it is iptables 1.2.9 running on a 
> 2.4 kernel
> 
> we plan to have more and more domains hosted in the future and I want 
> to be ready to raise firewall's capacity like 10 times

I think you are going to be hard pressed to get that type of
scaleability with out running in to memory constraints again.  But I
could be wrong.

> would an iptables upgrade help us in this situation ?

Possibly.  I do not know enough about the differences between versions
to help here.

> I was also wondering if guys in here have an idea on how we could 
> load-balance the firewall service itself (conntrack) ?

conntrackd is your friend.

> We thought about placing a zone in our DNS with 2 IPs and round-robin 
> active, and place a second firewall with the same DNAT instructions 

You could probably do this to spread the load across the two systems.
However if you are using conntrackd to share the firewall state
information between the systems, each will know its own and the others,
so this will not do much good for you.  That is unless you have two sets
of redundant firewalls.  I.e. A and B are redundant for each other, as
well as C and D for each other.  Then load balance across the sets A/B
and C/D so that half the load is on A/B and the other half is on C/D.

> The firewall have these kind of instructions :
> 
> DNAT incoming TCP 25 to multiple LAN anti-spam servers (-j DNAT 
> $IP1-$IPN)
> 
> DNAT incoming POP3, IMAP and HTTP to a single Mail Server (-j DNAT 
> $MAILSERVER)

Ok, this is simple enough.

> Our conntrack was filled with incoming TCP 25 sessions (SMTP) caused 
> by spamming botnets, we have an average of 15000 sessions in the day 
> time.

15,000 concurrent sessions?

> Any other ideas ?

Yes.

Do not use DNAT to redirect your packets.  Rather look in to using Linux
Virtual Server, probably in Direct Routing (LVS-DR) mode, to spread the
load across your multiple servers.  I think (read:  hope) the LVS
Director will completely bypass the connection tracking table that is
your limitation.  (I do not have any experience in this so I can not say
for sure.)  The idea is to use something other than DNAT which uses
connection tracking which is your limitation.

The LVS-DR Directory will receive packets destined to the IP address of
the virtual server (virtual IP (VIP)) and alter the destination MAC
address and pass the packet on to the internal real server.  The real
server(s) will then process the packets and return them to the client(s).

As far as firewalling, run a similarly configured firewall on all the
real back end servers.

Another advantage of LVS is that it can monitor the state of the back
end servers and remove them from the redirection pool if they go down or
add new ones as you need to for load.

You can even have the LVS Director be redundant so there is no single
point of failure.

Here is an ASCII rendering of a single director.
------------------------------------------------
                                 +--------+   +-----------------+
                                 | --->   +---+ Processing Node |
                                 |   <--- |   +-----------------+
                                 | --->   |
---+                            |   <--- |   +-----------------+
    |                            | --->   +---+ Processing Node |
---+   +--------------------+   |   <--- |   +-----------------+
    +---+ VIP / LVS Director +---+ Switch |
---+   +--------------------+   | --->   |   +-----------------+
    |                            |   <--- |---+ Processing Node |
---+                            | --->   |   +-----------------+
                                 |   <--- |
                                 | --->   |   +-----------------+
                                 |   <--- +---+ Processing Node |
                                 +--------+   +-----------------+

Here is an ASCII rendering of a redundant director.
---------------------------------------------------
                                 +--------+   +-----------------+
                                 | --->   +---+ Processing Node |
                                 |   <--- |   +-----------------+
                                 | --->   |
---+   +--------------------+   |   <--- |   +-----------------+
    +---+ VIP / LVS Director +---+ --->   +---+ Processing Node |
---+   +--------------------+   |   <--- |   +-----------------+
    |                            | Switch |
---+   +--------------------+   | --->   |   +-----------------+
    +---+ VIP / LVS Director +---+   <--- |---+ Processing Node |
---+   +--------------------+   | --->   |   +-----------------+
                                 |   <--- |
                                 | --->   |   +-----------------+
                                 |   <--- +---+ Processing Node |
                                 +--------+   +-----------------+

With the redundant director, you will use VRRPd or the likes to have one
director be "active" at a time.  If the active one fails, the backup one
will take over.

> Thanks in advance and have a nice day

You are welcome.



Grant. . . .

