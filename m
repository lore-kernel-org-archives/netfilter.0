From: Wilfried <wbarnavon@on-fire.net>
Subject: Re: MASQUERADE
Date: Fri, 9 Jul 2004 13:25:11 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.60.0407091319170.545@phoenix.on-fire.net>
References: <f51b72bc040708204912ab0cc7@mail.gmail.com>
 <20040709103513.GA18894@itstud.chalmers.se> <200407091151.01620.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-746934766-1089372311=:545"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407091151.01620.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter <netfilter@lists.netfilter.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-746934766-1089372311=:545
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanx to both of you for these answers.

Here is my goal: install iptables 1.2.11 on Fedora Core 2.
I need new features that are not in original package.

what I don't understand is why I can't compile it on my system.

It says also having problem with /usr/include/linux/autoconf.h which is=20
file from glibc_kernheaders package.
This is up to date !

Well well.
I don't know what to do ! It is not the first time that I compile=20
iptables, even if my previous experiences was with 2.4 kernel.

Wilfried

On Fri, 9 Jul 2004, Antony Stone wrote:

> On Friday 09 July 2004 11:35 am, Erik Wikstr=F6m wrote:
>
>> On Fri, Jul 09, 2004 at 09:19:58AM +0530, Payal Rathod wrote:
>>> Hi,
>>> Is there any different way to do MASQUERADE in kernel 2.6.3-7  with
>>> iptables v1.2.9?
>>> I get,
>>>
>>> # iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>> iptables: Invalid argument
>>>
>>> A quick look at the man page did not suggest anything.
>>> Any ideas to what is missing?
>>
>> First of all I'd like to say that I'm in no way an expert but are you
>> sure that you have the right stuff compiled in kernel or as modules? I=
n
>> 2.6.7 I had to select to compile MASQUERADE in the kernel, same thing
>> with the mangle table if I remember correctly.
>
> I see no reason not to compile everything you need for netfilter into t=
he
> kernel (instead of building as modules).   That way you know all the su=
pport
> is there from bootup, nothing can be removed through forgetfulness or m=
alice,
> and you don't have to worry about whether A depends on B, depends on C,=
 etc..
>
> Sure, if you want to use a new feature you didn't previously build, you=
 need
> to recompile the kernel and do a reboot, but in most cases that should =
be (a)
> infrequent, and (b) pretty simple.
>
> Regards,
>
> Antony.
>
> --
> In Heaven, the police are British, the chefs are Italian, the beer is B=
elgian,
> the mechanics are German, the lovers are French, the entertainment is
> American, and everything is organised by the Swiss.
>
> In Hell, the police are German, the chefs are British, the beer is Amer=
ican,
> the mechanics are French, the lovers are Swiss, the entertainment is Be=
lgian,
> and everything is organised by the Italians.
>
>                                                     Please reply to the=
 list;
>                                                           please don't =
CC me.
>
>
>
--8323328-746934766-1089372311=:545--

