From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Re: Connlimit problem
Date: Wed, 26 Jan 2005 16:59:02 +0100
Message-ID: <008801c503bf$f49109f0$910010ac@coco>
References: <001801c503b3$115416c0$910010ac@coco>
	<25214.142.169.215.10.1106754134.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all!!

Thanks.!!
Now I know that the module isn=B4t compiled. (cat /proc/net/......)
I had patched kernel source with POMng but for any reason the connlimit
patch didn=B4t apply. I am recompiling a new kernel and patched it from zer=
o.

Thanks, I`ll post my advances.
Regards.


----- Original Message -----=20
From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
To: "Omar Garcia" <omar.garcia@fractalia.biz>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 26, 2005 4:42 PM
Subject: Re: Connlimit problem


> On Wed, January 26, 2005 9:26 am, Omar Garcia said:
> > Hi list,
>
> Hi Omar!
>
> > [...]
> > If i tried in two steps, i confirm that the module connlimit is
installed:
> >
> > BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
> >     iptables v1.2.11: You must specify `--connlimit-above'
> >     Try `iptables -h' or 'iptables --help' for more information.
>
> This doesn't confirm that it is. This only tests the iptables 'module'
> which I will call, an extension library.
>
> >
> >
> >  BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
> > --connlimit-above 12 -j DROP
> >      iptables: No chain/target/match by that name
>
> This means the kernel module (called ipt_connlimit) is not loadable or
> compiled at all.
>
> > Any idea????
>
> Yes, patch your kernel or enable this module.
>
> If unsure:
>
> lsmod | grep ipt_connlimit
>
> No result? Then 'modprobe ipt_connlimit'
>
> It works ? Then make sure it properly registered against netfilter:
>
> cat /proc/net/ip_tables_matches | grep connlimit
>
> >
> > Thanks in advange.
> >
> > Regards
> >
>
> HTH,
>
> Samuel
>
>



