From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: icmp messages to spoofed address accepted by -m conntrack --ctstate ESTABLISHED,RELATED
Date: Thu, 18 Mar 2004 17:35:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040318223551.GA1128@salty>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>

Hello,

I added a rule with this matching pattern to
the iptables firewall on my machine.

-m conntrack --ctstate ESTABLISHED,RELATED

I am logging the matches,
the only packets matching are
icmp destination unreachable packets
that are responses to -
a udp packet
sent to dest ports 1026 or 1027
that has the source IP of my machine.

My first concern was to see if my
machine was infected with some malware.

I have now done parallel tcpdump tracing,
(among other tests)
and I now think the
original udp packets do not come from me,
but rather that
someone is spoofing my IP address.

So, I have come here to try to confirm
that this match is either a misuse of
the conntrack module by me (surely possible),
or else a bug in connection tracking.

I have split the rule, and I am getting
matches on both ESTABLISHED and RELATED.
I do not see in /proc/net/ip_conntrack
any entry that I think should match.
These icmp packets are at a low frequency,
a few a day.

I can solve the immediate issue by ignoring it,
but I thought I should report the problem,
and see what I can learn.

I have looked at the netfilter mailing lists
with great interest, and I have learned
a great deal, but I do not see any easy
way to search them systematically for this issue.

I started looking for help here:

http://www.linuxquestions.org/questions/showthread.php?threadid=158226

and there are sample log entries there, if if matters.
But it seemed as if this list was the next place to go.

Regards,

Jim Laurino

