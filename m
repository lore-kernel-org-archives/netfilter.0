From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: /proc/net/ip_conntrack problem
Date: Fri, 6 Feb 2004 11:48:15 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Ap4T1-001Yez-EL@alf1.lmb.internal>
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

I'm trying to set up a crude connection logger to record the 
connection details (and disconnection times) for SNAT'd traffic
outgoing from our network. I need to be able to reconcile
traffic emanating from the NAT box with the originating host,
but using the -j LOG option on the SNAT rule doesnt give me the
pre-SNAT'd data for the host.

What I am doing is simply to read /proc/net/ip_conntrack every
second with a perl script. This script builds a table of connection
data such that every *new* entry it sees is added to the table and
becomes the logged 'connection' time, and whenever an entry currently
in the table is no longer seen in the ip_conntrack data, it is assumed
to have disconnected. This becomes the logged 'disconnect' time and
the entry is then removed from the perl list.

OK, very crude, but it seems to do the trick, apart from one snag:
Occasionally, the output from /proc/net/ip_conntrack seems to get truncated,
and hence my prog thinks that all the missing hosts have disconnected.
The next time /proc/net/ip_conntrack is read, the full data is collected
and the missing hosts are then re-logged as 'connected' again.

What could be happening here? What happens if the /proc/net/ip_conntrack
data is in the process of being modified by the netfilter code at the
same instant as I read it with my perl script - is there the possibility
of some race condition which might pollute the output?

Cheers,

Terry.


