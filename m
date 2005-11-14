From: Jaanus Kivistik <jaanus@no.spam.ee>
Subject: DNAT breakdown
Date: Mon, 14 Nov 2005 21:29:05 +0200
Message-ID: <20051114192905.GA25428@no.spam.ee>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

Few days ago I had a wierd case of DNAT translation failing for
an hour while running okay for few weeks before and some days after.
I'm not sure if this is the fault of my setup, netfilter bug or 
something else.

My setup somewhat simplified:


192.168.1.0/24  <->    linux-netfilter-gw <-> 192.168.5.0/24

On gw box I have DNAT rules like:

iptables -A PREROUTING -s 192.168.1.0/255.255.0.0 -d 192.168.10.11 -j DNAT --to-destination 192.168.5.31
iptables -A PREROUTING -s 192.168.1.0/255.255.0.0 -d 192.168.10.12 -j DNAT --to-destination 192.168.5.32
iptables -A PREROUTING -s 192.168.1.0/255.255.0.0 -d 192.168.10.13 -j DNAT --to-destination 192.168.5.33


This was running fine for weeks until few days ago, when 192.168.1.41
couldn't reach 192.168.10.11 anymore. 10.12/10.13 were okay and at the same
time 192.168.1.42 could reach 10.11 and (.12/.13). So only one ip-mapping
pair was affected.

When I pinged 192.168.10.11 from 192.168.1.41 I got replies, but from
192.168.5.31 directly! Seems like reverse translation went awry somehow.
Checked /proc/net/ip_conntrack on gw box, connections from 1.41 were
"[UNREPLIED]". Nothing interesting in dmesg and kernel logs. This situation
lasted for about an hour, afterwards everything has been ok again.

Kernel I'm running is vanilla 2.4.29 on Debian woody.

Any ideas what the problem might be or how to troubleshoot it better?


Thanks,
Jaanus Kivistik

