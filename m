From: <Josh.Berry@compucom.com>
Subject: 39_ip_conntrack-proc Patch
Date: Mon, 11 Aug 2003 15:31:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0116BED0@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I tried to apply the 39_ip_conntrack-proc patch by putting the patch
file at the root of the kernel source and using patch -p1 <
39_ip_conntrack-proc.patch and received this error:

1 out of 4 hunks FAILED -- saving rejects to file
net/ipv4/netfilter/ip_conntrack_core.c.rej

I am not much of a programmer so this does not mean much to me.  The
.rej file contains:


***************
*** 1465,1489 ****
  	for (i =3D 0; i < ip_conntrack_htable_size; i++)
  		INIT_LIST_HEAD(&ip_conntrack_hash[i]);
 =20
- /* This is fucking braindead.  There is NO WAY of doing this without
-    the CONFIG_SYSCTL unless you don't want to detect errors.
-    Grrr... --RR */
- #ifdef CONFIG_SYSCTL
- 	ip_conntrack_sysctl_header
- 		=3D register_sysctl_table(ip_conntrack_root_table, 0);
- 	if (ip_conntrack_sysctl_header =3D=3D NULL) {
- 		goto err_free_ct_cachep;
- 	}
- #endif /*CONFIG_SYSCTL*/
-=20
  	/* For use by ipt_REJECT */
  	ip_ct_attach =3D ip_conntrack_attach;
  	return ret;
 =20
- #ifdef CONFIG_SYSCTL
- err_free_ct_cachep:
- 	kmem_cache_destroy(ip_conntrack_cachep);
- #endif /*CONFIG_SYSCTL*/
  err_free_hash:
  	vfree(ip_conntrack_hash);
  err_unreg_sockopt:
--- 1439,1448 ----
  	for (i =3D 0; i < ip_conntrack_htable_size; i++)
  		INIT_LIST_HEAD(&ip_conntrack_hash[i]);
 =20
  	/* For use by ipt_REJECT */
  	ip_ct_attach =3D ip_conntrack_attach;
  	return ret;
 =20
  err_free_hash:
  	vfree(ip_conntrack_hash);
  err_unreg_sockopt:



Josh Berry
Information Security Group
972-856-5402


