From: "lux" <netfilter@iotti.biz>
Subject: Openswan compiling problem with pom-ng ipsec patches
Date: Mon, 7 Mar 2005 07:59:11 +0100
Message-ID: <NCBBJCDIGFAINBLFEHILMENBGMAA.netfilter@iotti.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I just added to my kernel (Fedora 3) the ipsec patches from
patch-o-matic-ng.
This introduces a problem in compiling klips (openswan 2.3.0) with errors
about #defines being redefined:

In file included from
/usr/src/redhat/BUILD/openswan-2.3.0/BUILD.i386/ipsec_init.c:97:
/usr/src/redhat/BUILD/openswan-2.3.0/linux/include/pfkeyv2.h:39:1: warning:
"SADB_X_NAT_T_NEW_MAPPING" redefined
In file included from include/net/xfrm.h:10,
                 from include/linux/netfilter_ipv4.h:93,
                 from include/net/ip.h:34,
                 from
/usr/src/redhat/BUILD/openswan-2.3.0/BUILD.i386/ipsec_init.c:63:
include/linux/pfkeyv2.h:243:1: warning: this is the location of the previous
definition
...
The same thing about SADB_EXT_MAX, SADB_SATYPE_MAX,... lots of constants in
pfkeyv2.h.

The problem arises because the pom-ng patches #include netfilter_ipv4.h in
ip.h , which in turn includes xfrm.h which includes pfkeyv2.h from the
current kernel, hence the conflict with openswan's own pfkeyv2.h.
It would be fairly trivial to eliminate the problem, testing in either
pfkeyv2.h if the other was already included.
What looks a problem to me is that the two pfkeyv2.h are fairly different,
and I don't know what is the right one.
Someone has a solution for this issue, allowing me to use openswan's klips
and to have the pom-ng's ipsec patches installed?
Maybe this issue should be posted on the dev ML?


