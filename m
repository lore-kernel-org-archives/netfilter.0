From: Duncan Sands <duncan.sands@math.u-psud.fr>
Subject: masquerade_check: size 24 != 20
Date: Fri, 3 Oct 2003 14:46:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310031446.18321.duncan.sands@math.u-psud.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Cc: Tom Eastep <teastep@shorewall.net>

With 2.4.23-pre and 2.5/6 kernels my firewall setup fails at this line:

iptables -t nat -A atm0_masq -s 192.168.58.0/24 -d 0.0.0.0/0 -j MASQUERADE

(the kernel returns -EINVAL).  On the other hand it works with 2.4.20+gentoo patches
with the same .config.

The command gets as far as the checkentry call into ipt_MASQUERADE.c
(i.e. masquerade_check), at which point it bails out because the size of
the ip_nat_multi_range type (20) differs from the target_size (24) passed
to it:

translate_table: size 1112
Finished chain 0
Finished chain 3
Finished chain 4
find_inlist: loading `ipt_MASQUERADE'.
masquerade_check: size 24 != 20.
ip_tables: check failed for `MASQUERADE'.

The check in question is:

        if (targinfosize != IPT_ALIGN(sizeof(*mr))) {
                DEBUGP("masquerade_check: size %u != %u.\n",
                       targinfosize, sizeof(*mr));
                return 0;
        }

All this suggests to me that the size of some kernel structure has
changed.  Now Tom Eastep tried with the same kernel and didn't
get this, which is kind of informative: it suggests a different compiler
version padding things differently (my gcc version is 3.2.3), or some
config setting I have quietly changing the size of some object.  Before
rummaging around further, I thought I'd ask here if anyone has any
ideas.

Thanks for any help,

Duncan.

