From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: ip_conntrack_pptp and inbound PPTP/GRE
Date: Wed, 4 Aug 2004 17:50:28 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0408041734340.21854-100000@e-smith.charlieb.ott.istop.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I've struck a problem with inbound PPTP with CVS pptp conntrack and a 
patched 2.4.18 kernel.

...
gre      47 170 timeout=30, stream_timeout=180 src=64.230.9.110 \
 dst=64.230.132.224 version=1 protocol=0x880b srckey=0x0 dstkey=0x1f21\
 src=64.230.132.224 dst=64.230.9.110 version=1 protocol=0x880b srckey=0x1f21 dstkey=0x0 \
 [ASSURED] use=1
gre      47 566 timeout=600, stream_timeout=432000 src=64.230.132.224 \
  dst=64.230.9.110 version=1 protocol=0x880b srckey=0x0 dstkey=0x0 \
  [UNREPLIED] \
  src=64.230.9.110 dst=64.230.132.224 version=1 protocol=0x880b srckey=0x0 dstkey=0x0 \
  use=1
tcp      6 431968 ESTABLISHED \
  src=64.230.132.224 dst=64.230.9.110 sport=7968 dport=1723 \
  src=64.230.9.110 dst=64.230.132.224 sport=1723 dport=7968 \
  [ASSURED] use=2
...

The problem is that after establishing the connection, I have two gre 
conntrack entries. The first one above sees the tunnel traffic, and the 
timeout value is continually reset. The second one always stays UNREPLIED 
and times out after 10 minutes. After the timeout, new incoming GRE 
packets no longer have state RELATED and are blocked.

Is this a bug, or am I doing something wrong? If nobody is sure, can 
someone advise how I can proceed?  I'm in the process of enabling the 
debugging code in the conntrack module.

Thanks

---
Charlie


