From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Cannot use iptable extensions
Date: Mon, 20 Sep 2004 11:28:49 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <61475.216.239.93.106.1095694129.squirrel@216.239.93.106>
References: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: d l <popgojp@yahoo.co.jp>
Cc: netfilter@lists.netfilter.org

On Mon, September 20, 2004 4:20 am, d l said:
> Hi,
> I am using vanilla Fedora Core 2, without configuring
> firewall in anaconda during initial install.
>

Custom compiled kernel ?


> Simple rules seems to works with built in modules. e.g.
> iptables -A INPUT -p ICMP -j DROP
>
> However when I tried to use extension modules like
> <connlimit> and <owner>, iptables always gives me error.
>
> For <owner>:
> iptables -m owner --help
> .......
> OWNER match v1.2.9 options:
> [!] --uid-owner userid     Match local uid
> [!] --gid-owner groupid    Match local gid
> [!] --pid-owner processid  Match local pid
> [!] --sid-owner sessionid  Match local sid
> [!] --cmd-owner name       Match local command name
>

When you get the help displayed, the dynamic library is properly installe=
d.

> # iptables -A INPUT -m owner --cmd-owner mlnet -j test
> iptables: Invalid argument

That means the dynamic library is using a structure different from the on=
e
used by the module.

If no module was present, you would get the
"No match/chain/target by that name" error.

So your module is there but at the time of loading the rule, it compares
the size of structure it uses against the one your dynamic library uses.

When there`s something wrong in the checkentry function, iptables simply
says "iptables: Invalid arguments"

Most of the time, you have a newer library than your module is.
Patch applied with pom-ng should take care of fixing your problem
if you do recompile the iptables userspace as well as the kernel
netfilter's module.

>
> Any help is appreciated.
>

HTH,

Samuel Jean
CookingLinux.org

> Regards,
> Dil Lee
>



