From: Tim Evans <tkevans@tkevans.com>
Subject: MASQUERADE: Route sent us somewhere else.
Date: Sun, 3 Apr 2005 09:39:28 -0400 (EDT)
Message-ID: <200504031339.j33DdR2X003262@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: nQ1B8/s75ZlYfpSmzC5wHg==
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Since upgrading to RedHat Enterprise Version 4, I've been having goofy routing 
problems and iptables has been logging this message regularly:

Apr  3 04:15:01 kestrel kernel: MASQUERADE: Route sent us somewhere else.

My immediate ISP is Comcast, but my main domain is hosted at another ISP.

By "goofy routing problems," I mean I have trouble accessing my *own domain* at 
my ISP for POP-ing down e-mail and *all* other connections.  There are periods 
of anywhere from a few minutes to an hour or longer where all connections to the 
domain simply time out.  At the same time, I *can* connect to other domains, 
including others that belong to me on the same ISP.

During these incidents, traceroutes to my main domain hang at the very first hop 
(Comcast's first router); if I run a traceroute to any other site in a different 
window at the very same time, it proceeds all the way to its destination 
virtually instantly.

The above error consistently corresponds with a cron job that runs fetchmail to 
POP my e-mail down from the ISP.

I have the following lines in my iptables script that reference masquerading:

/sbin/modprobe ipt_MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE

I have not changed the iptables script since upgrading to RHEL 4; I did not see 
any such problems with RHEL 3.

What's doubly goofy about these problems is they're intermittent.  After a spell 
of being unable to connect (again, ranging from just a few minutes to an hour or 
more), it'll suddenly begin working.

And, to repeat, this only affects my primary domain; no other connections to any 
other domain I try see these failures. 
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


