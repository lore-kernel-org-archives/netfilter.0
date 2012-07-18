From: Arturo Borrero <aborrero@cica.es>
Subject: Gathering netfilter-related usage information
Date: Wed, 18 Jul 2012 19:58:45 +0200
Message-ID: <CAPfcJat8-b2sYOCzPjAAbZgLPM4Edz6MuusS1EXUVnn7KghvYA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there!

I'm looking for some tool or hints at gathering netfilter-related
usage data, such as:
=B7 Mem usage
=B7 kernel config
=B7 cpu load/usage
=46or:
=B7 ip[6]tables
=B7 ipset
=B7 conntrack
=B7 modules

=46or some high-loaded firewalls with huge rulesets it's handy to gathe=
r
all netfilter-related usage and config information.

I don't found any preestablished way of doing that. Nor a tool or a
single spot in /proc or whatever, so here is what I have at the
moment:

-- Rules (ip[6]tables usage) mem usage could be obtained by:
grep x_tables /proc/vmallocinfo
and summing 2=BA col, ie:

root@rasca:~# grep x_tables /proc/vmallocinfo
0xfa983000-0xfa9a2000  126976 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D30 vmalloc
0xfa9a2000-0xfa9c1000  126976 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D30 vmalloc
0xfa9c1000-0xfa9e0000  126976 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D30 vmalloc
0xfa9e0000-0xfa9ff000  126976 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D30 vmalloc
0xfc5db000-0xfc5f5000  106496 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D25 vmalloc
0xfc5f5000-0xfc60f000  106496 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D25 vmalloc
0xfc60f000-0xfc629000  106496 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D25 vmalloc
0xfc629000-0xfc643000  106496 xt_alloc_table_info+0x57/0x87 [x_tables]
pages=3D25 vmalloc


-- Conntrackd kernel config could be obtained in:
/prco sys/net/netfilter/*

-- Conntrackd cpu with a simple ps aux or [h]top

-- There are some data related to connection tracking mem usage at
/proc/slabinfo
grep conntrack /proc/slabinfo
But don't know exactly how to interpret it (what cols to sum or
multiply), also if all lines are of interest, i.e:

root@rasca:~# head -n 2 /proc/slabinfo ; grep conntrack /proc/slabinfo
slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab>
<pagesperslab> : tunables <limit> <batchcount> <sharedfactor> :
slabdata <active_slabs> <num_slabs> <sharedavail>
nf_conntrack_expect      0      0    176   22    1 : tunables  120
60    8 : slabdata      0      0      0
nf_conntrack_c1507640     18     64    240   16    1 : tunables  120
60    8 : slabdata      4      4      0


-- modules mem usage with something like:
lsmod | egrep "ip_set"\|"ipt_"\|"xt_"\|"nf_"\|"ip6t_"
and summing 2=BA col, i.e:
root@rasca:~# lsmod | head -n 1 ; lsmod | egrep
"ip_set"\|"ipt_"\|"xt_"\|"nf_"\|"ip6t_"
Module                  Size  Used by
ip_set_list_set        12844  4
ipt_LOG                12533  5
xt_multiport           12492  156
xt_set                 12853  32
xt_comment             12395  2
nf_nat                 17924  1 iptable_nat
nf_conntrack_ipv4      13726  335 nf_nat,iptable_nat
nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
ip_set_hash_ip         22324  22
ip_set                 22129  3 ip_set_hash_ip,xt_set,ip_set_list_set
ip6t_LOG               12537  5
xt_pkttype             12395  6
xt_tcpudp              12506  625
nf_conntrack_ipv6      13124  327
nf_defrag_ipv6         12684  1 nf_conntrack_ipv6
xt_state               12455  659
ip6_tables             17185  2 ip6table_filter,ip6t_LOG
x_tables               18121  13
ip_tables,iptable_filter,ip6_tables,ip6table_filter,xt_state,xt_tcpudp,=
xt_pkttype,ip6t_LOG,iptable_nat,xt_comment,xt_set,xt_multiport,ipt_LOG
nf_conntrack_netlink    22601  0
nf_conntrack           43121  6
nf_conntrack_netlink,xt_state,nf_conntrack_ipv6,nf_conntrack_ipv4,nf_na=
t,iptable_nat
nfnetlink              12786  8 nf_conntrack_netlink,ip_set




I don't know how to collect:

=B7 Data about ipset memory usage (kernel pages, bytes or whatever)
=B7 Data about cpu load due to filtering/nating (rules) operations

Any hint? Any idea?

If it doesn't exist, I would like to write a small script that shows
all this data (and maybe other statistics as well) in a nicely
formated way, i.e:

root@rasca:~# ./statstool
# Number of ip[6]tables rules: 837
# Netfilter rules memory usage: 933888 Bytes
# Netfilter sets memory usage: ~ Bytes
# Netfilter modules memory usage: 341178 Bytes
# Total memory usage: ~ Bytes
#
# Conntrackd cpu usage: x%
# Conntrack max connections: 450000
[...]

Best regards.



--
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Informatico Cientifico de Andalucia (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa
