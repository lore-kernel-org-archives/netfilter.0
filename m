From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding GnomeMeeting to internal network
Date: Wed, 12 Nov 2003 10:43:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311121043.hACAhVj18353@agate.rockstone.co.uk>
References: <Pine.LNX.4.58.0311111558160.8003@fhynpb.envafyvqr.arg> <Pine.LNX.4.33.0311120009030.26051-100000@blackhole.kfki.hu> <20031112102230.M85506@tripnotik.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031112102230.M85506@tripnotik.dyndns.org>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wednesday 12 November 2003 10:35 am, Julien Didron wrote:

> Hello list,
>
> I wish to use GnomeMeeting, for which I assume the only port that needs
> opening is 1720.
> Now, how can I forward all incoming traffic to port 1720 on the router, to
> one machine on the network that doesn't have a fixed IP (DHCP), but has
> name on the domain thanks to DDNS (ex : abox.mydomain.net).

netfilter can only redirect packets to known IP addresses.

> Another question regarding ip_conntrack. After 5 days of use, I get the
> following error in syslog : "ip_conntrack table full, dropping packet.". I
> then increased the value in /proc/sys/net/ipv4/ip_conntrack_max, from 3048
> to 8192, but I think this is a quick fix that won't get me too far ...

Several thousand active connections is a *lot*.   Unless you have a very 
large network (maybe you do?), this would suggest something sinister, such as 
a worm-infected machine attempting to connect to other machines out on the 
Internet and leaving lots of half-open connections in the conntrack table.

Look at the entries in the conntrack table and identify what the problem is 
instead of simply making the table larger and allowing the problem to get 
bigger.

> Is there a mean of flushing that table ? If not, how can I lower the TCP
> connection timeouts ?

Again, not really the right solution.   Find out what machine/s is/are 
filling upyour conntrack tableand fix them so that they don't.   A healthy 
network in normal operation doesn't fill up a conntrack table.

Antony.

-- 

When do you expect the official release of the 2.6.0 kernel?

Rusty Russell: From previous releases, a pattern has emerged: exactly 6 
months before it's ready.
                                                     Please reply to the list;
                                                           please don't CC me.

