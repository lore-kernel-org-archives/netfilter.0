From: Pierre Ossman <drzeus@drzeus.cx>
Subject: Conntrack full, but not really
Date: Wed, 24 Mar 2004 22:13:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4061FA01.4050604@drzeus.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi!

I'm having the standard problem of the connection tracker running out of 
space, but this time with a twist. If I check how many connections it is 
currently tracking it is nowhere near the upper limit. I've searched 
through the archives and haven't found anything like this.

The machine is a P-2 333 MHz with 96 MB of RAM doing nothing but 
routing. It's running Red Hat 9 with kernel 2.4.20-28.9 (although the 
problem exists with other Red Hat kernels). The problem appears after 
about a month of uptime. After that the machine needs to be rebooted to 
recover (flushing out the connection tracker might work aswell but that 
doesn't really make the problem less severe).

What happens is that it starts complaining that the connection tracking 
table is full:
"ip_conntrack: table full, dropping packet."
But when I check /proc/net/ip_conntrack there are only about 120 tracked 
connections (out of about 6000). Something really weird is going on.
To make things worse it's not really out of memory. Large portions of 
the memory is occupied by the cache so it could kick stuff out if it 
wants to. If I kill of some processes to get some free memory *and* 
write a new number to ip_max_track (any number whatsoever will suffice) 
the system works again. At least for a while.

I have no idea how to diagnose this thing. I thought the connection 
tracker allocated the memory it needed when it was loaded, not dynamically.

The machine was recently rebooted so there's probably not much I can 
check that can help right now. But please give me some tips on what I 
should check the next time it starts acting up.

Rgds
Pierre Ossman

PS. Please cc me, I'm not a subsriber.


