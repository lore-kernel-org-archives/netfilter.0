From: <tsh@mrc-lmb.cam.ac.uk>
Subject: tcpdump query
Date: Wed, 10 Sep 2003 11:38:42 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309101038.h8AAcgb440892@alf1.lmb.internal>
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

Apologies if this seems off-topic, but it is at least
being used to investigate an iptables problem.

The man page on tcpdump says that the -e option will
cause tcpdump to print out the link-level header, which
for ethernet will contain the source and destination
addresses. However, it only seems to print either
the source *or* the destination, and gives 0:0:0:0:0:0
or 0:0:0:0:0:1 for the other item. e.g.:

eth0 > 0:0:0:0:0:0 0:4:76:e6:63:59 arp 42: arp reply fw1.mrc-lmb.cam.ac.uk (0:4:76:e6:63:59) is-at 0:4:76:e6:63:59 (8:0:2b:86:97:88)
eth0 < 8:0:2b:86:97:88 0:0:0:0:0:1 ip 98: ag4.mrc-lmb.cam.ac.uk > fw1.mrc-lmb.cam.ac.uk: icmp: echo request
eth2 > 0:0:0:0:0:0 0:4:75:e2:92:3a ip 98: ag4.mrc-lmb.cam.ac.uk > fw1.mrc-lmb.cam.ac.uk: icmp: echo request
eth2 B 0:10:5a:30:f6:18 Broadcast arp 60: arp who-has ag4.mrc-lmb.cam.ac.uk tell fw1.mrc-lmb.cam.ac.uk
eth2 > 0:0:0:0:0:0 0:4:75:e2:92:3a arp 42: arp reply ag4.mrc-lmb.cam.ac.uk (0:4:75:e2:92:3a) is-at 0:4:75:e2:92:3a (0:10:5a:30:f6:18)

Any ideas how I can get it you cough up both?

Cheers,
Terry.



Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)
I.T. Manager
Medical Research Council
Lab of Molecular Biology
Hills Road
CAMBRIDGE CB2 2QH
U.K.
Phone:	+44 (0)1223 248011
Fax:	+44 (0)1223 213556


