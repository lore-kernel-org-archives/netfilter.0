From: Josh Logan <josh@wcug.wwu.edu>
Subject: multiple pptp clients behind one machine
Date: Tue, 8 Mar 2005 14:47:09 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0503081436210.29834@sloth.wcug.wwu.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have compiled a 2.6.9 kernel with the pptp patches.  When I try out the
new modules GRE is blocked on the firewall.

Shorewall:net2all:DROP:IN=eth0 OUT=
MAC=00:a0:cc:56:b8:5c:00:10:67:00:1f:04:08:00 SRC=x.x.48.2
DST=x.x.116.164 LEN=61 TOS=0x00 PREC=0x00 TTL=52 ID=36900 DF PROTO=47

I'm running debian unstable.  I patched and installed the new version of
iptables.  I'm using the patch-o-matic-ng-20050307.tar.bz2 and most recent
iptables source.

The modules load OK:
root@router-jl:~# lsmod
Module                  Size  Used by
ip_nat_proto_gre        3264  0
ip_nat_pptp             4512  0
ip_conntrack_pptp       6336  1 ip_nat_pptp
ip_conntrack_proto_gre     5632  2 ip_nat_pptp,ip_conntrack_pptp


Do you have any ideas, or need more information that I can provide?

Thanks.

							Later, JOSH


