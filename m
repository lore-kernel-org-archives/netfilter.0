From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Cannot use iptable extensions
Date: Mon, 20 Sep 2004 16:21:27 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <63855.216.239.93.106.1095711687.squirrel@216.239.93.106>
References: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
	<61475.216.239.93.106.1095694129.squirrel@216.239.93.106>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <61475.216.239.93.106.1095694129.squirrel@216.239.93.106>
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
To: popgojp@yahoo.co.jp
Cc: netfilter@lists.netfilter.org

On Mon, September 20, 2004 11:28 am, Samuel Jean said:
> On Mon, September 20, 2004 4:20 am, d l said:
>> Hi,
>> I am using vanilla Fedora Core 2, without configuring
>> firewall in anaconda during initial install.
>>
>
> Custom compiled kernel ?
>
>
>> Simple rules seems to works with built in modules. e.g.
>> iptables -A INPUT -p ICMP -j DROP
>>
>> However when I tried to use extension modules like
>> <connlimit> and <owner>, iptables always gives me error.
>>
>> For <owner>:
>> iptables -m owner --help
>> .......
>> OWNER match v1.2.9 options:
>> [!] --uid-owner userid     Match local uid
>> [!] --gid-owner groupid    Match local gid
>> [!] --pid-owner processid  Match local pid
>> [!] --sid-owner sessionid  Match local sid
>> [!] --cmd-owner name       Match local command name
>>
>
> When you get the help displayed, the dynamic library is properly
> installed.
>
>> # iptables -A INPUT -m owner --cmd-owner mlnet -j test
>> iptables: Invalid argument
>
> That means the dynamic library is using a structure different from the =
one
> used by the module.
>
> If no module was present, you would get the
> "No match/chain/target by that name" error.
>
> So your module is there but at the time of loading the rule, it compare=
s
> the size of structure it uses against the one your dynamic library uses=
.
>
> When there`s something wrong in the checkentry function, iptables simpl=
y
> says "iptables: Invalid arguments"
>
> Most of the time, you have a newer library than your module is.
> Patch applied with pom-ng should take care of fixing your problem
> if you do recompile the iptables userspace as well as the kernel
> netfilter's module.
>

In addition, most of the netfilter's modules are logging via syslog
whenever there`s something wrong while doing their 'checkentry'.

Take a look at /var/log/syslog just in case.

Personally, I've never used/tried that match.  So, could it be that you
are loading it in the wrong chain (not supported by the module) ?

Good luck,

Samuel Jean
CookingLinux.org


