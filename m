From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: /proc/net/ip_conntrack problem
Date: Fri, 6 Feb 2004 17:28:51 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Ap9md-000c35-CG@alf1.lmb.internal>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I need to maintain a log of SNAT'd connections/disconnections
which contain the source/dest ip/port of the host before
SNAT'ing. As discussed on this list before, the POSTROUTING -j LOG
target doesnt provide this information, so I've written a crude
logger of my own.

This logger is a perl script which does the following:

Every second:

. Reads the content of /proc/net/ip_conntrack.

. Searches for entries in the ip_conntrack data which it
  doesnt have in its own list, adds them to its own
  list and logs a 'connect' for that entry.

. Searches for entries in its own list which no longer
  appear in the ip_conntrack data, removes them from
  its own list and logs a 'disconnect' for that entry.


This seems to work OK apart from one thing. From time
to time, the output from /proc/net/ip_conntrack seems
to get truncated. This means that I erroneously flag
all the missing items as 'disconnected', and then next
time I read ip_conntrack (this time without truncation)
all the previously missing entries reapper and then get
flagged as 'connected' again.
I can also experience the truncation if I repeatedly grep
for a known src= + dst= line in ip_conntrack. Occasionally
grep doesnt find it.

What happens if the ip_conntrack data is being updated
at the instant /proc/net/ip_conntrack is being read?
Is there the possibility of a race condition here which
might explain what I'm seeing? Any suggestions welcome.

Cheers,
Terry.


