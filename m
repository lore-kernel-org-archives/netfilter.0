From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: Memory problem
Date: 03 Jul 2003 16:42:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057243325.458.166.camel@xbox>
References: <3F03FD0F.5070509@sadomain.co.za>
	<1057223745.457.40.camel@xbox>  <3F044612.8020903@sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F044612.8020903@sadomain.co.za>
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
To: =?ISO-8859-1?Q?Cilli=E8?= Burger <security@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

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


