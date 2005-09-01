From: "Keith" <keith@acsinc.net>
Subject: problem with connlimit module compile
Date: Thu, 1 Sep 2005 14:58:23 -0400
Message-ID: <006101c5af27$2087e750$dd8069d8@html>
Reply-To: keith@acsinc.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I'm using kernel 2.6.13 and iptables 1.3.2 and=20
patch-o-matic ng-20040621

I'm getting an error when I try to patch and compile to use=20
connlimit from the patch-o-matic base. the errors look like this:

In function count_them:
struct ip_conntrack_tuple_hash has no member named ctrack

And sure enough I find the ctrack pointer was removed here:
http://lists.netfilter.org/pipermail/netfilter-devel/2005-January/018147.=
htm
l


I started digging into the source and find it non-trivial
Any suggestions on a work around?

=20


