From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Help - Public Interface seems to go to sleep
Date: Tue, 15 Apr 2003 15:14:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3039c$55922b10$1001a8c0@s3ac>
References: <85256D09.006BAD95.00@nt_domino.mrmc.mcleodhealth.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <85256D09.006BAD95.00@nt_domino.mrmc.mcleodhealth.org>
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
To: 'David Culp' <dculp@mcleodhealth.org>, netfilter@lists.netfilter.org


>      Problem:
>           - Everything works 'most' of the time. However after no
>             activity on the public interface for a while 
> (hours), can not connect.
>             But then later, can connect ??
>            From a tcpdump trace on eth1, the times that it 
> will not connect shows
>            only SYN packets from the other host, no ACK from 
> this server?
> 
>           Have I filtered out too much traffic ?  Should I 
> allow ICMP through the
>           public interface ? Bad ethernet card ?
> 
I experienced this a whiel back. The IF would just stop responding. I
noticed when I pinged from it when logged in locally that would
sometimes start it back up. But it was only down for maybe 5-10 mins at
a time. I chalked the problem up to I think my power management
settings. The system is a server so I removed the APM aspect of it from
the kernel and I think that solved the problem.


