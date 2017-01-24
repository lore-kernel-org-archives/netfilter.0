From: Paul Raines <raines@nmr.mgh.harvard.edu>
Subject: client NFS problems through masquerade on 100 node cluster
Date: Tue, 24 Jan 2017 09:43:35 -0500 (EST)
Message-ID: <alpine.LRH.2.20.1701240930170.11410@entry.nmr.mgh.harvard.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I have a 100 node beowulf style cluster with the 100 nodes doing 
NAT/masquerade through a master node to reach the house network. Each node and 
the master are running CentOS 6.8 with kernel 2.6.32-642.3.1.el6.x86_64

Often jobs on the nodes need to NFS mount from storage servers on the house 
network so go through the NAT.  I suspect this is related to massive problems
I am having now with nodes going catatonic and requiring a SysRq-b or
manual power cycle.  When I can get a responsive shell on such catatonic node
there are always nfs mounts in /etc/mtab and df always hangs.  Things like ps
or top usually hang as well.  On most nodes dmesg shows output like:

INFO: task fslmerge:30669 blocked for more than 120 seconds.
       Tainted: G          I-- ------------    2.6.32-642.3.1.el6.x86_64 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
fslmerge      D 0000000000000007     0 30669  15763 0x00000080
  ffff8807d352fc78 0000000000000082 ffff8807d352fbc8 ffffffffa06453ee
  ffff8807d352fbf8 ffffffffa0645c90 ffff880343576400 ffff8807d352fc28
  ffff8803435764b0 ffff8807e64846a0 ffff88081cbbc5f8 ffff8807d352ffd8
Call Trace:
  [<ffffffffa06453ee>] ? rpc_make_runnable+0x7e/0x80 [sunrpc]
  [<ffffffffa0645c90>] ? rpc_execute+0x50/0xa0 [sunrpc]
  [<ffffffff8112e390>] ? sync_page+0x0/0x50
  [<ffffffff81547b33>] io_schedule+0x73/0xc0
  [<ffffffff8112e3cd>] sync_page+0x3d/0x50
  [<ffffffff8154861f>] __wait_on_bit+0x5f/0x90
  [<ffffffff8112e603>] wait_on_page_bit+0x73/0x80
  [<ffffffff810a68c0>] ? wake_bit_function+0x0/0x50
  [<ffffffff81144745>] ? pagevec_lookup_tag+0x25/0x40
  [<ffffffff8112ea2b>] wait_on_page_writeback_range+0xfb/0x190
  [<ffffffff8112ebf8>] filemap_write_and_wait_range+0x78/0x90
  [<ffffffff811cc8ce>] vfs_fsync_range+0x7e/0x100
  [<ffffffff811cc9bd>] vfs_fsync+0x1d/0x20
  [<ffffffffa07379e0>] nfs_file_flush+0x70/0xa0 [nfs]
  [<ffffffff8119679c>] filp_close+0x3c/0x90
  [<ffffffff81196895>] sys_close+0xa5/0x100
  [<ffffffff8100b0d2>] system_call_fastpath+0x16/0x1b

dmesg on the cluster master node doing the iptables masq/NAT has lines
tons of lines like:

NFS: state manager: check lease failed on NFSv4 server bidlin3 with error 13

I suspect with the large number of NFS traffic going through the master
node something is "overloading" in the NAT structures.

I have tried a few tuning things (mostly without not really understanding
but just what I found through googling)

echo 4096  > /proc/sys/sunrpc/max_resvport

net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.tcp_syncookies = 1
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
net.netfilter.nf_conntrack_max = 131072
net.netfilter.nf_conntrack_tcp_timeout_established = 86400

but none of this has helped.

I am hoping someone on this list can give me some direction.

Thanks

---------------------------------------------------------------
Paul Raines                     http://help.nmr.mgh.harvard.edu
MGH/MIT/HMS Athinoula A. Martinos Center for Biomedical Imaging
149 (2301) 13th Street     Charlestown, MA 02129	    USA





The information in this e-mail is intended only for the person to whom it is
addressed. If you believe this e-mail was sent to you in error and the e-mail
contains patient information, please contact the Partners Compliance HelpLine at
http://www.partners.org/complianceline . If the e-mail was sent to you in error
but does not contain patient information, please contact the sender and properly
dispose of the e-mail.

