From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: abusing ipset and ulog for tcpdump-like functions?
Date: Fri, 27 Jan 2006 00:09:14 +0100
Message-ID: <43D9569A.4070609@gmx.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

in the process of trying to get CPU usage on my router to saner
levels, I noticed that tcpdump instances were consuming about
30% of the total cpu load. Since that is a bit too much for my
taste, I decided to try to implement a solution for my problem
with ipset and ulog.

Problem:
For a given set A of IPs, I want to log the first packet per
IP to userspace with full headers. Further packets shall only
be logged if their MAC address differs from the MAC address of
the first logged packet. After the first packet with a differing
MAC address has been logged for a given IP, log only packets
for this IP which don't have either the first or the second MAC.
The general pattern is that I want to log each MAC used by a
few IPs I have to keep a look on.

Now you could say that this is exactly what arpwatch does.
Well, mostly. And arpwatch doesn't scale to gigabit throughput
on the interface it is watching.

I have a userspace script which does exactly that with tcpdump
and it works fine except that the tcpdump instances spawned by
it consume too much CPU in the af_packet module.

My idea was to use an ipmap (level0) from ipset to match set A.
If a packet is matched by level0, it is checked against a
macipmap (level1). If doesn't match level1, log the packet and
add it to level1. If it can't be added to level1 (because
another packet with the same IP has already been added to level1)
add it to another macipmap table level2. And so on.

Can I add one IP with multiple MACs to a given macipmap table?
(That would give me the easiest solution.) If so, will this
affect performance very much? If this impossible, what other
options do I have? Will --matchunset help?


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

