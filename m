From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Wed, 14 Jul 2004 06:48:04 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e504071320487c04cd2b@mail.gmail.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90511B9@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90511B9@asimail2.alphanumeric.com>
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

I had somehow a similar problem, but it didn't involved any tunnel,
the problem were some ESTABLISHED connections which remained hanged in
ip_conntrack for a long time (5 days is the default).
So I tryed to decrease the default.
I have these for sysctl:
net/ipv4/tcp_keepalive_time=300
this means the state of connection is rechecked after 300 seconds,
this usually means that the TTL from ip_conntrack will go to maximum
again (that 5 days thingy)
I also changed this:
net/ipv4/netfilter/ip_conntrack_tcp_timeout_established=400
this is what before was 5 days
You may want to check if somewhere between you and the other side has
some bad configurations, maybe changing tcp_keep_alive_time to
something much lower than 60, would help out (the kernel sends some
sort of packets for checking) but try to tune these on both sides, a
statefull firewall somewhere may forget the connections after 60
seconds, maybe an low ip_conntrack_tcp_timeout_established
I hope this may help you

> -----Original Message-----
> From: Real Cucumber [mailto:monkcucumber@yahoo.com]
> Sent: Tuesday, July 13, 2004 12:51 PM
> To: netfilter@lists.netfilter.org
> Subject: SSH Connections Lost After 1 minute idle
> 
> I have a fedora firewall/router using iptables to
> forward incoming SSH packets to an internal server and
> it works great....however, only if the user does not
> remain idle for 1 minute.  If they idle for 1 minute,
> the connection "freezes" in the sense that it drops
> the connection but its not a proper "connectoin
> closed" from the server as if it is a timelimit, but
> rather just a connectoin loss like you've unplugged
> your cable in the middle of a connection.
> 
> If the user is connecting from within the network,
> they can remain idle for an unlimited amount of time
> without being disconnected.  It is only ones
> connecting from outside hte network going through the
> iptables firewall that have this idle problem.
> 
> I am only allowing TCP and UDP for SSH to be
> forwarded.
> 
> Do I need any ICMP or any other special connection
> timeout rules on the iptables side to fix this
> problem?
> 
> Any help appreciated!
> 
> __________________________________
> Do you Yahoo!?
> New and Improved Yahoo! Mail - 100MB free storage!
> http://promotions.yahoo.com/new_mail
> 
>

