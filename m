From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Memory problem
Date: Thu, 3 Jul 2003 09:10:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DE8@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Filip Sneppe <filip.sneppe@cronos.be>, =?iso-8859-1?Q?Cilli=E8_Burger?= <security@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

Speaking of missing memory, I am having a fun time trying to find where =
I am loosing memory. It seems like a progressive leak, but I am not sure =
that it isn't just some internal caching mechanism.. What you all think?

#cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  195235840 190230528  5005312        0  1622016 16596992
Swap: 3224289280  8986624 3215302656
MemTotal:       190660 kB
MemFree:          4888 kB
MemShared:           0 kB
Buffers:          1584 kB
Cached:          12944 kB
SwapCached:       3264 kB
Active:          11844 kB
ActiveAnon:       3812 kB
ActiveCache:      8032 kB
Inact_dirty:         0 kB
Inact_laundry:    3756 kB
Inact_clean:      2508 kB
Inact_target:     3620 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:       190660 kB
LowFree:          4888 kB
SwapTotal:     3148720 kB
SwapFree:      3139944 kB

# cat /proc/slabinfo=20
slabinfo - version: 1.1
kmem_cache            66     70    108    2    2    1
ip_fib_hash           55    112     32    1    1    1
urb_priv               1     58     64    1    1    1
journal_head         111   5775     48    2   75    1
revoke_table           2    250     12    1    1    1
revoke_record          0    224     32    0    2    1
clip_arp_cache         0      0    128    0    0    1
ip_conntrack         480   1740    384   86  174    1
ip_mrt_cache           0      0    128    0    0    1
tcp_tw_bucket         52    780    128    2   26    1
tcp_bind_bucket       14    112     32    1    1    1
tcp_open_request       0     30    128    0    1    1
inet_peer_cache       23   7830     64    1  135    1
ip_dst_cache         367   6975    256   25  465    1
arp_cache             32    270    128    2    9    1
blkdev_requests     1472   1500    128   50   50    1
dnotify_cache          0      0     20    0    0    1
file_lock_cache        3     41     92    1    1    1
fasync_cache           0      0     16    0    0    1
uid_cache              4    112     32    1    1    1
skbuff_head_cache    230    465    256   25   31    1
sock                  92    117   1280   32   39    1
sigqueue               0     29    132    0    1    1
kiobuf                 0      0     64    0    0    1
cdev_cache            10   2494     64    1   43    1
bdev_cache             5     58     64    1    1    1
mnt_cache             13     58     64    1    1    1
inode_cache          543    679    512   97   97    1
dentry_cache         514   1350    128   45   45    1
dquot                  0      0    128    0    0    1
filp                1270   1290    128   43   43    1
names_cache            0     21   4096    0   21    1
buffer_head         1532  38048     92   95  928    1
mm_struct          34802  34845    256 2322 2323    1
vm_area_struct      1476   6000    128   67  200    1
fs_cache              27    174     64    1    3    1
files_cache           27    119    512    8   17    1
signal_cache          41    174     64    2    3    1
sighand_cache         33    132   1408    5   12    4
task_struct            0      0   1792    0    0    1
pte_chain            527   9570    128   23  319    1
size-131072(DMA)       0      0 131072    0    0   32
size-131072            0      0 131072    0    0   32
size-65536(DMA)        0      0  65536    0    0   16
size-65536             1      3  65536    1    3   16
size-32768(DMA)        0      0  32768    0    0    8
size-32768             0      4  32768    0    4    8
size-16384(DMA)        0      0  16384    0    0    4
size-16384             0      1  16384    0    1    4
size-8192(DMA)         0      0   8192    0    0    2
size-8192              7     24   8192    7   24    2
size-4096(DMA)         0      0   4096    0    0    1
size-4096             54     92   4096   54   92    1
size-2048(DMA)         0      0   2048    0    0    1
size-2048            153    442   2048   77  221    1
size-1024(DMA)         0      0   1024    0    0    1
size-1024             51     76   1024   14   19    1
size-512(DMA)          0      0    512    0    0    1
size-512              56    160    512    8   20    1
size-256(DMA)          0      0    256    0    0    1
size-256              21    945    256    2   63    1
size-128(DMA)          1     30    128    1    1    1
size-128            1155   1230    128   40   41    1
size-64(DMA)           0      0    128    0    0    1
size-64              223    630    128    9   21    1
size-32(DMA)          18     58     64    1    1    1
size-32              292    754     64    8   13    1

-----Original Message-----
From: Filip Sneppe [mailto:filip.sneppe@cronos.be]=20
Sent: Thursday, July 03, 2003 7:42 AM
To: Cilli=E8 Burger
Cc: netfilter@lists.netfilter.org
Subject: Re: Memory problem

Hi Cilli=E8,

On Thu, 2003-07-03 at 17:04, Cilli=E8 Burger wrote:

> Here are the details you requested.
>=20
>  cat /proc/meminfo
>          total:    used:    free:  shared: buffers:  cached:
> Mem:  63598592 62529536  1069056        0 23306240 19935232
> Swap: 200237056  3911680 196325376
> MemTotal:        62108 kB
> MemFree:          1044 kB
> MemShared:           0 kB
> Buffers:         22760 kB
> Cached:          19192 kB
> SwapCached:        276 kB
> Active:          26476 kB
> Inact_dirty:     14428 kB
> Inact_clean:      2428 kB
> Inact_target:     8664 kB
> HighTotal:           0 kB
> HighFree:            0 kB
> LowTotal:        62108 kB
> LowFree:          1044 kB
> SwapTotal:      195544 kB
> SwapFree:       191724 kB
> Committed_AS:     6052 kB
>=20
> ------------------------------------------------------------
>=20
>=20
>  cat /proc/slabinfo
> slabinfo - version: 1.1
> kmem_cache            61     70    112    2    2    1
> ip_conntrack        1193   1628    352  127  148    1
...
> inode_cache        17328  19976    496 2497 2497    1
> dentry_cache       17522  23275    112  665  665    1
...
> buffer_head         9797  12040     96  272  301    1
...

>=20
> wc -l /proc/net/ip_conntrack
>    1107 /proc/net/ip_conntrack
>=20

See, ip_conntrack is only using 1193 * 352 bytes per connection,=20
and the number of connections tracked is quite reasonable.

You can also see that a fair amount of RAM is simply used
for caching of filesytem operations (see cached: entry
of meminfo output and the inode_cache and dentry_cache
in slabinfo output).

So I wouldn't worry about any memory leaks in netfilter
connection tracking. The numbers you provided look quite normal.

Regards,
Filip



