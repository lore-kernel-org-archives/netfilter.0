From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Connlimit problem
Date: Wed, 26 Jan 2005 10:42:14 -0500 (EST)
Message-ID: <25214.142.169.215.10.1106754134.squirrel@142.169.215.10>
References: <001801c503b3$115416c0$910010ac@coco>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001801c503b3$115416c0$910010ac@coco>
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
Content-Type: text/plain; charset="us-ascii"
To: Omar Garcia <omar.garcia@fractalia.biz>
Cc: netfilter@lists.netfilter.org

On Wed, January 26, 2005 9:26 am, Omar Garcia said:
> Hi list,

Hi Omar!

> [...]
> If i tried in two steps, i confirm that the module connlimit is install=
ed:
>
> BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
>     iptables v1.2.11: You must specify `--connlimit-above'
>     Try `iptables -h' or 'iptables --help' for more information.

This doesn't confirm that it is. This only tests the iptables 'module'
which I will call, an extension library.

>
>
>  BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
> --connlimit-above 12 -j DROP
>      iptables: No chain/target/match by that name

This means the kernel module (called ipt_connlimit) is not loadable or
compiled at all.

> Any idea????

Yes, patch your kernel or enable this module.

If unsure:

lsmod | grep ipt_connlimit

No result? Then 'modprobe ipt_connlimit'

It works ? Then make sure it properly registered against netfilter:

cat /proc/net/ip_tables_matches | grep connlimit

>
> Thanks in advange.
>
> Regards
>

HTH,

Samuel


