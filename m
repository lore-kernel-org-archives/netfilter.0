From: "StaX" <stax@in-line.ru>
Subject: icmp fragmentation
Date: Tue, 21 May 2002 17:00:40 +0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <002a01c200c7$85ca1320$480a12ac@rrc.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

hi 2 all

introduction:
my box (RedHat 7.0 with patches etc) was actively fllooded by big ICMP
packets
wthout last fragments.
ok, well, i had tryed to log them by using  iptables -f -j LOG rule
but no logs were generated! nevertheless, tcpdump was duly reporting
fragmented icmp traffic.

problem:
i think that due to ip_conntrack module all fragmented packets
needs to be defragmented. but in my case, when there are no last fragments,
the packets could not be defragmented and thus will never pass through
ip_conntrack module.
so it's impossible to log or filter such packets.
am i right ?

and if it is,
is there any way to log fragments with ip_conntrack loaded ?

StaX
Inline Technologies, SATD

...there are no wonders in our life...
...there is no life without wonders...
so
...there is no life at all...



