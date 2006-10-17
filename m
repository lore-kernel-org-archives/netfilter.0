From: "Wilson, Richard E" <richard.wilson@eds.com>
Subject: Ip_conntrack enhancement idea
Date: Tue, 17 Oct 2006 16:46:54 -0500
Message-ID: <F1B471B6CE5CFA458DFED6C7669D039706C21D75@usplm234.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

All,

I am having some issues with servers that run caching DNS and iptables
-- the ip_conntrack table overflows resulting in dropped packets.  I am
wondering what the value is in tracking connections whose source and
destination are both 127.0.0.1 -- would it be possible to flag such
packets so that no ip_conntrack table entry gets created for them at
all?  For my servers this can represent a third of the total tracked
connections (ip_conntrack_max is set at 65536 on systems with 2GB of
RAM).

I know this can be addressed other ways -- I am working to get the
server upgraded from its current kernel (2.4.21) to something newer so
that I can change the default ip_conntrack timeout value (I don't really
want to increase the ip_conntrack_max), but thought I should bring this
up.  Perhaps in other situations it's desirable to track localhost
connections, but I can't think of a good reason why.

Thanks,

Richard Wilson

richard dot wilson at eds dot com


