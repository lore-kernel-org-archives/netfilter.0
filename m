From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: libnftnl 1.1.3 release
Date: Mon, 27 May 2019 14:03:46 +0200
Message-ID: <20190527120346.gz2dlmx2gstgkyld@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="2qu4b5sux64qwnql"
Return-path: <netfilter-announce-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/options/netfilter-announce>, 
 <mailto:netfilter-announce-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter-announce/>
List-Post: <mailto:netfilter-announce@lists.netfilter.org>
List-Help: <mailto:netfilter-announce-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-announce>, 
 <mailto:netfilter-announce-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-announce-bounces@lists.netfilter.org
Sender: "netfilter-announce" <netfilter-announce-bounces@lists.netfilter.org>
To: netfilter-devel@vger.kernel.org
Cc: lwn@lwn.net, netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org


--2qu4b5sux64qwnql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.3

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem. The
library libnftnl has been previously known as libnftables. This
library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
ftp://ftp.netfilter.org/pub/libnftnl/

Happy firewalling.


--2qu4b5sux64qwnql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnftnl-1.1.3.txt"

Fernando Fernandez Mancera (1):
      expr: osf: add version option support

Florian Westphal (2):
      set_elem: close a padding hole
      src: libnftnl: export genid functions again

Laura Garcia Liebana (2):
      Revert "expr: add map lookups for numgen statements"
      Revert "expr: add map lookups for hash statements"

Pablo Neira Ayuso (2):
      udata: add NFTNL_UDATA_* definitions
      build: libnftnl 1.1.3 release

Phil Sutter (12):
      chain: Support per chain rules list
      chain: Add lookup functions for chain list and rules in chain
      chain: Hash chain list by name
      object: Avoid obj_ops array overrun
      flowtable: Add missing break
      flowtable: Fix use after free in two spots
      flowtable: Fix memleak in nftnl_flowtable_parse_devs()
      flowtable: Fix for reading garbage
      src: chain: Add missing nftnl_chain_rule_del()
      src: chain: Fix nftnl_chain_rule_insert_at()
      src: rule: Support NFTA_RULE_POSITION_ID attribute
      include: Remove redundant declaration of nftnl_gen_nlmsg_parse()


--2qu4b5sux64qwnql--

