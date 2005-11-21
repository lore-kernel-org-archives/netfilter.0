From: Keith Whyte <keith@media-solutions.ie>
Subject: coming in through the outgoing hole?
Date: Mon, 21 Nov 2005 11:58:50 -0600
Message-ID: <43820ADA.8000206@media-solutions.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

here's a scenario
i have opened outgoing webserver requests and their resposes thus
(output from iptables -v -L)

INPUT
0     0 ACCEPT     tcp  --  eth0   any     anywhere
anywhere           tcp spt:http dpts:1024:65535
OUTPUT
0    0 ACCEPT     tcp  --  any    eth0    anywhere
anywhere           tcp spts:1024:65535 dpt:http

now, it occurs to me that i have opened access to ports 1024 to 65535,
as long as the source port is port 80, correct?
where as I only want it open for connections originating on the local
machine.

I presume the answer here is conntrack, could someone help me with the
command for the INPUT chain?
should it be --state RELATED or ESTABLISHED or both or something like !
NEW (if that can be done)?

as a hypothetical example of the problem:
let's say i run an admin type webserver for some app, listening on a
port above 1024, for example. if someone hacked a web client to use port
80 as the source port for it's connections,  (dunno, would you have to
hack the kernel too, or just be root?) , then they could bypass the
firewall part of the security, right? or with ssh, surely it would be
easy enough to hack an ssh client to use port 80 as it's source port.
ok, so you probably shouldn't run an ssh listener on a port above 1024,
but nevertheless, it's a good hole to close.

thanks!

Keith.




