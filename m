From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Efficient 1-to-1 DNAT of range of ports
Date: Fri, 29 Apr 2005 16:23:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0504291552080.5988@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


The semantics of:

iptables  -t nat --append PREROUTING -p udp --dport nn:mm -j DNAT \
  --to-destination a.b.c.d:pp-qq

I find somewhat surprising. It appears to be an efficient way to forward a 
range of ports. But it doesn't work that way. To forward a range of ports 
it seems to that one needs to do:

s=nn
d=pp
while [ $d -ge $s ]
do
  iptables  -t nat --append PREROUTING -p udp --dport $s -j DNAT \
     --to-destination a.b.c.d:$d
  s=$(expr $s + 1)
  d=$(expr $d + 1)
done

This certainly isn't efficient, and can be rather slow. Presumably it can 
cause large tables to be built in the kernel.

Is there a better way to do it? Has anyone built a module to do 1-to-1 NAT 
of a port range? Are the current semantics of a range to range DNAT 
useful? If not, how hard would it be to change?

Thanks

---
Charlie

