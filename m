From: Sergey Alexanov <freak@volia.net>
Subject: ip_conntrack hashsize problem
Date: Tue, 06 Feb 2007 17:33:41 +0200
Message-ID: <45C89FD5.4020508@volia.net>
Reply-To: freak@volia.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

can anybody suggest me in the following issue:

# grep ip_conntrack /etc/modprobe.conf
options ip_conntrack hashsize=2097152

# modprobe ip_conntrack
# lsmod | grep ip_conntrack
ip_conntrack           53924  0

# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
16777216
# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
2097152

looking fine..

but if i try to insert above 16000 rules with connection tracking i 
getting an error:

# iptables-restore < ./firewall.sav
iptables-restore: line 16386 failed

# wc -l ./firewall.sav
16387 ./firewall.sav

but with the less set of rules:
# wc -l ./firewall.sav
4099 ./firewall.sav

applying ruleset:
# iptables-restore < ./firewall.sav
and checking by
#iptables -t mangle -L -n
ewerything is fine

firewall.sav filled by something like that:
# cat ./firewall.sav | less
*mangle
-A POSTROUTING -d xx.yy.240.0 -m layer7 --l7proto openft -j MARK 
--set-mark 0x4d7bf000b
-A POSTROUTING -s xx.yy.240.0 -m layer7 --l7proto openft -j MARK 
--set-mark 0x4d7bf000b
-A POSTROUTING -d xx.yy.240.0 -m layer7 --l7proto gnutella -j MARK 
--set-mark 0x4d7bf0008

[.skipped.]

-A POSTROUTING -d xx.yy.241.255 -m layer7 --l7proto edonkey -j MARK 
--set-mark 0x4d7bf1ff2
-A POSTROUTING -s xx.yy.241.255 -m layer7 --l7proto edonkey -j MARK 
--set-mark 0x4d7bf1ff2
-A POSTROUTING -d xx.yy.241.255 -j MARK --set-mark 0x4d7bf1ff9
-A POSTROUTING -s xx.yy.241.255 -j MARK --set-mark 0x4d7bf1ff9
COMMIT

just 32 rules foreach ip address in xx.yy.240/23 cidr block.

additional info:

# cat /proc/meminfo
MemTotal:      1035276 kB
MemFree:         32848 kB
Buffers:         32428 kB
Cached:         899432 kB
SwapCached:          0 kB
Active:         614192 kB
Inactive:       326368 kB
HighTotal:      130752 kB
HighFree:         1404 kB
LowTotal:       904524 kB
LowFree:         31444 kB
SwapTotal:     2072344 kB
SwapFree:      2072344 kB
Dirty:               0 kB
Writeback:           0 kB
AnonPages:        8716 kB
Mapped:           4668 kB
Slab:            36892 kB
SReclaimable:    27720 kB
SUnreclaim:       9172 kB
PageTables:        840 kB
NFS_Unstable:        0 kB
Bounce:              0 kB
CommitLimit:   2589980 kB
Committed_AS:    31660 kB
VmallocTotal:   118776 kB
VmallocUsed:     18516 kB
VmallocChunk:   100096 kB
HugePages_Total:     0
HugePages_Free:      0
HugePages_Rsvd:      0
Hugepagesize:     2048 kB

# uname -srp
Linux 2.6.19.2 i686

# lsmod
Module                  Size  Used by
ipt_layer7             13060  3840
ip_conntrack           53924  1 ipt_layer7
iptable_mangle          3328  1
ip_tables              13528  1 iptable_mangle
autofs4                22148  2
dm_mod                 59668  0
video                  16260  0
button                  7056  0
battery                10500  0
asus_acpi              16152  0
ac                      5508  0
shpchp                 39852  0
i2c_i801                8588  0
8139too                27904  0
e100                   36744  0
mii                     6272  2 8139too,e100
sk98lin               160736  0
floppy                 60892  0
ext3                  138248  1
jbd                    60072  1 ext3
ata_piix               15880  2
sd_mod                 21888  3

im very appreciate if anybody help or suggest me with this problem
thanks.

-- 
Sergey Alexanov
SA1215-RIPE
freak@volia.net


