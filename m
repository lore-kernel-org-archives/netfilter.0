From: Alex McCubbin <amccubbin@chancery.com>
Subject: RE: iptables wishes
Date: Wed, 2 Apr 2003 08:54:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <611156563715AB469D2812B37DA02681029C6044@exchange>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

My wish would be for the --proto to allow for multiple protocols being set
at the same time.

As an example...

$IPTABLES --table filter --append log_and_drop --proto ! tcp,udp,icmp --jump
LOG --log-level 5 --log-prefix "OTHER Drop "

I want to log explicitly log tcp, udp and icmp as specific logs and then
catch all others with a different log message hence the OTHER log command
you see above.  I can think of other situations as well...

Maybe this has already been addressed since I last brought it up last
September and I missed it, but I don't think so...

Cheers, Alex.

-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us] 
Sent: Tuesday, April 01, 2003 12:42 AM
To: netfilter@lists.netfilter.org
Subject: iptables wishes


I haven't started a new thread here in ages, and this is something I've 
been toying with for a while.  With the recent announcement of a 
feature-freeze on iptables 1.2.8, this seemed a reasonable time to start 
this thread.  (targeting later releases, obviously, and hoping to spark 
some constructive discussion :^)

I was curious to hear what people might have as a 'wishlist' for 
iptables/netfilter capabilities.  Every once in a while something comes 
up here that simply doesn't seem to have a good solution.

My hope is that many of our personal wishes may already be possible, and 
by voicing them someone who has a solution may post it.  And for any 
that don't presently have an answer, perhaps someone will be inspired to 
create one.

Personally I have four:

1 - revamped LOG entry format, especially cleaning up MAC.

2 - completely separate netfilter logging from kernel log streams.  (not 
just redirecting infrequently-used kernel streams, but actual dedicated 
netfilter streams)

3 - Ability to match "original DestinationIP" of a DNATted packet in 
subsequent chains.  Useful with a single physical interface but multiple 
IPs bound to it.

4 - addition of support for a REM field in rules.  Would do nothing 
whatsoever except print the specified REMark text at the end of the rule 
in -L listings.  Something like:
iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j ACCEPT -REM JoelSSH So
that a -L listing could be easier & quicker to decipher sometimes.  It 
would also allow "iptables -L -v -n | grep Joel" to list only rules, in 
all chains, with "Joel" in the comment.


j



