From: Marcus Schopen <marcus.schopen@uni-bielefeld.de>
Subject: H.323 and 2.4.18 kernel problem
Date: Tue, 09 Jul 2002 16:50:40 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2AF840.E4674BFA@uni-bielefeld.de>
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

Hi,

to get the H.323 module working with kernel 2.4.18, I installed the
following patches with p-o-m (CVS version):

  1. arptables
  2. congig-cleanup
  3. conntrack+helper-unregister
  4. ip_conntrack_protocol_destroy
  5. ip_conntrack_protocol_unregister
  6. macro-trailing-semicolon-fix
  7. nat-export_symbols
  8. netfilter-arp
  9. REJECT-dont_fragment

  after that:

  10. 0-newnat13
  11. pptp_conntrack_nat
  12. h323_conntack_nat

All patches were installed cleanly. Did I forget a patch, because I get
the following error:

In file included from ip_conntrack_proto_gre.c:39:
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_inlist':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49: (Each
undeclared identifier is reported only once
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49: for each
function it appears in.)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_append':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:70:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_prepend':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:78:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_named_insert':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:104:
`ip_ct_gre_lock' undeclared (first use in this function)
ip_conntrack_proto_gre.c: At top level:
ip_conntrack_proto_gre.c:70: `ip_ct_gre_lock' used prior to declaration
make[2]: *** [ip_conntrack_proto_gre.o] Error 1
make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/net'
make: *** [_mod_net] Error 2

Thanks
Marcus


-- 

| Marcus Schopen      (0>     http://www.dzug.org |
| P.O. Box 10 25 25   //\     http://www.zope.org |
| D-33525 Bielefeld   V_/_  http://www.python.org |
|      *** Live as variously as possible ***      |


