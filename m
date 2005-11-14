From: mud dog <muddogxp@gmail.com>
Subject: load ip_nat_ftp failed
Date: Mon, 14 Nov 2005 22:36:42 +0800
Message-ID: <24dc5ae90511140636k7a4b1a29p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

I'm sure that all the neccessary dependent modules has been compiled
and installed.
But when i load modules of ip_nat_ftp, it fails.

# modprobe ip_nat_ftp
ASSERT ip_conntrack_core.c:630 &ip_conntrack_lock not readlocked

It seems the conntrack read lock can't be get

