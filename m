From: Dan Cook <dan.cook@illumio.com>
Subject: iptables-restore vmalloc allocation failure
Date: Fri, 5 Dec 2014 23:49:02 +0000
Message-ID: <1417823341888.58153@illumio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


We have a fairly large ipset and iptables fw configuration and we are seeing vmalloc failures trying to restore the firewall. 

There are about 25k rules and iptables-restore fails on machines with less than 3G of RAM.  The machines are all 64bit kernels. This failure is consistent on various flavors of OS (all 64bit) like CentOS 6.11, Ubuntu 14.04, CentOS 7, etc..  The example below is on a CentOS 7 VM with a 1G or RAM running on Fusion.  Why would iptables not be able to vmalloc 10M on this system?

The failures I see in /var/log/messages is something like this:

Dec  5 12:32:01 dcook-centos7 kernel: Killed process 2601 (iptables-restor) total-vm:61256kB, anon-rss:0kB, file-rss:4kB
Dec  5 12:32:01 dcook-centos7 kernel: vmalloc: allocation failure, allocated 9936896 of 10727424 bytes
Dec  5 12:32:01 dcook-centos7 kernel: iptables-restor: page allocation failure: order:0, mode:0xd2
Dec  5 12:32:01 dcook-centos7 kernel: CPU: 0 PID: 2601 Comm: iptables-restor Tainted: GF          O--------------   3.10.0-123.9.3.el7.x86_64 #1
Dec  5 12:32:01 dcook-centos7 kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 05/20/2014
<snip call stack>
Dec  5 12:32:01 dcook-centos7 kernel: active_anon:2 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:1 isolated_file:0
 unevictable:0 dirty:0 writeback:0 unstable:0
 free:2 slab_reclaimable:3892 slab_unreclaimable:11232
 mapped:5 shmem:3 pagetables:1064 bounce:0
 free_cma:0

The system is effectively idle - no other servers are consuming memory, etc...
# free
             total       used       free     shared    buffers     cached
Mem:       1003424     160300     843124       1116          0      29796
-/+ buffers/cache:     130504     872920
Swap:      1048572      54368     994204

And meminfo looks like this:
# cat /proc/meminfo
MemTotal:        1003424 kB
MemFree:          843092 kB
MemAvailable:     809296 kB
Buffers:               0 kB
Cached:            31016 kB
SwapCached:        12040 kB
Active:             4916 kB
Inactive:          41912 kB
Active(anon):        740 kB
Inactive(anon):    16236 kB
Active(file):       4176 kB
Inactive(file):    25676 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:       1048572 kB
SwapFree:         994264 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:          6112 kB
Mapped:             7484 kB
Shmem:              1140 kB
Slab:              60280 kB
SReclaimable:      15176 kB
SUnreclaim:        45104 kB
KernelStack:        3912 kB
PageTables:         4112 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     1550284 kB
Committed_AS:     286808 kB
VmallocTotal:   34359738367 kB
VmallocUsed:      187532 kB
VmallocChunk:   34359531516 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       55168 kB
DirectMap2M:      993280 kB

# uname -a
Linux dcook-centos7 3.10.0-123.9.3.el7.x86_64 #1 SMP Thu Nov 6 15:06:03 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
