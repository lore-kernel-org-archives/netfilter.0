From: Kurt Yoder <ktynetfilter@richard-group.com>
Subject: Re: iptables returns "module is wrong version"
Date: Fri, 28 Jan 2005 14:04:00 -0500
Message-ID: <r02010100-1037-5F0466BA715F11D998C6000A95DF6F1E@[192.168.1.112]>
References: <1106928124.29980.13.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106928124.29980.13.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: netfilter@lists.netfilter.org

> El vie, 28 de 01 de 2005 a las 16:24, Kurt Yoder escribi=C3=B3:
> > How do I figure out which patches were applied to the iptables
module?
> >=20
> > I installed iptables from source with no patches but am still
getting
> > the same error message.
>=20
> You can see what patches (or modules) iptables have compiled looking
> into the /usr/lib/iptables or /usr/local/lib/iptables directory, and
> the kernel ones in
> /lib/modules/<kernel-version>/kernel/net/ipv4/netfilter
>=20
> but the problem it's that the iptables modules and the kernel modules
> must be synced and patched with the same path-o-matic, or it won't
> work properly.
>=20
> Regards.
>=20

Thanks for your help so far!

I understand that I need to compile iptables with the same patches as
the iptables kernel module, but I'm still not sure how to determine
which patches the kernel module has. I see a bunch of files in the
kernel lib directory, and another different set in the iptables lib
directory. Is the different list of files sufficient to tell me which
patches I should apply to iptables?

I've got this:

root@ns2:~# ls
/lib/modules/2.6.8-9-amd64-k8-smp/kernel/net/ipv4/netfilter/
arptable_filter.ko      ip_nat_irc.ko         ipt_conntrack.ko
ipt_mark.ko        ipt_REJECT.ko
arp_tables.ko           ip_nat_snmp_basic.ko  ipt_dscp.ko
ipt_MARK.ko        ipt_SAME.ko
arpt_mangle.ko          ip_nat_tftp.ko        ipt_DSCP.ko
ipt_MASQUERADE.ko  ipt_state.ko
ipchains.ko             ip_queue.ko           ipt_ecn.ko
ipt_multiport.ko   ipt_tcpmss.ko
ip_conntrack_amanda.ko  iptable_filter.ko     ipt_ECN.ko
ipt_NETMAP.ko      ipt_TCPMSS.ko
ip_conntrack_ftp.ko     iptable_mangle.ko     ipt_esp.ko
ipt_NOTRACK.ko     ipt_tos.ko
ip_conntrack_irc.ko     iptable_nat.ko        ipt_helper.ko
ipt_owner.ko       ipt_TOS.ko
ip_conntrack.ko         iptable_raw.ko        ipt_iprange.ko
ipt_physdev.ko     ipt_ttl.ko
ip_conntrack_tftp.ko    ip_tables.ko          ipt_length.ko
ipt_pkttype.ko     ipt_ULOG.ko
ipfwadm.ko              ipt_addrtype.ko       ipt_limit.ko
ipt_realm.ko
ip_nat_amanda.ko        ipt_ah.ko             ipt_LOG.ko
ipt_recent.ko
ip_nat_ftp.ko           ipt_CLASSIFY.ko       ipt_mac.ko
ipt_REDIRECT.ko
root@ns2:~# ls /usr/local/lib/iptables/
libip6t_ah.so          libip6t_MARK.so       libipt_DNAT.so
libipt_MASQUERADE.so  libipt_SNAT.so
libip6t_dst.so         libip6t_multiport.so  libipt_dscp.so
libipt_MIRROR.so      libipt_standard.so
libip6t_esp.so         libip6t_owner.so      libipt_DSCP.so
libipt_multiport.so   libipt_state.so
libip6t_eui64.so       libip6t_rt.so         libipt_ecn.so
libipt_NETMAP.so      libipt_TARPIT.so
libip6t_frag.so        libip6t_standard.so   libipt_ECN.so
libipt_NOTRACK.so     libipt_tcpmss.so
libip6t_hbh.so         libip6t_tcp.so        libipt_esp.so
libipt_owner.so       libipt_TCPMSS.so
libip6t_hl.so          libip6t_TRACE.so      libipt_helper.so
libipt_physdev.so     libipt_tcp.so
libip6t_HL.so          libip6t_udp.so        libipt_icmp.so
libipt_pkttype.so     libipt_tos.so
libip6t_icmpv6.so      libipt_addrtype.so    libipt_iprange.so
libipt_realm.so       libipt_TOS.so
libip6t_ipv6header.so  libipt_ah.so          libipt_length.so
libipt_recent.so      libipt_TRACE.so
libip6t_length.so      libipt_CLASSIFY.so    libipt_limit.so
libipt_REDIRECT.so    libipt_ttl.so
libip6t_limit.so       libipt_connlimit.so   libipt_LOG.so
libipt_REJECT.so      libipt_TTL.so
libip6t_LOG.so         libipt_connmark.so    libipt_mac.so
libipt_rpc.so         libipt_udp.so
libip6t_mac.so         libipt_CONNMARK.so    libipt_mark.so
libipt_SAME.so        libipt_ULOG.so
libip6t_mark.so        libipt_conntrack.so   libipt_MARK.so
libipt_sctp.so        libipt_unclean.so

