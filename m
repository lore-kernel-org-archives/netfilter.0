From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: (no subject)
Date: Mon, 7 Feb 2005 09:27:09 -0500 (EST)
Message-ID: <45847.142.169.215.10.1107786429.squirrel@142.169.215.10>
References: <Pine.LNX.4.44.0502062232200.13062-100000@localhost.localdomain>
	<Pine.LNX.4.44.0502070009450.13062-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.44.0502070009450.13062-100000@localhost.localdomain>
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
To: Dean Anderson <dean@av8.com>
Cc: netfilter@lists.netfilter.org

On Mon, February 7, 2005 12:24 am, Dean Anderson said:
> Ok, I fixed the openwrt problem. Turned out they had some of their own
> netfilter patches. I turned those off, and used only the patch-o-matic-=
ng
> patchs, and things worked.

Official package means clean patches (not always true).

>
> These patches were distributed by openwrt to be applied against the
> linksys kernel:  The first one is pretty substantial.
>
> wc 100-revert_netfilter.patch
>    5834   22128  179845 100-revert_netfilter.patch
> wc 110-conntrack_setting.patch
>      20      67     715 110-conntrack_setting.patch

Those are not from patch-o-matic, aren't they ?

Those are patches i've never heard of. They aren't part of netfilter
(I guess) and obviously no warranty they will apply cleanly.

Some official patches don't, so I guess it's normal 3rd party's one don't
too.

>
> I'm not sure what the openwrt folks and/or linksys was thinking with
> these...  They worked on earlier versions of the linksys kernel... I
> suspect a distribution/versioning problem caused by the netfilter group=
.

Because of the constant evolution with netfilter, the only things they ca=
re
are :

o Keep compatibility with iptables userspace
o Keep in-kernel modules synced with new netfilter behaviour.
o And once this is done, some start syncing Patch-O-Matic patches,
  which aren't official to Linux but official to Netfilter.

There's no precaution to keep compatibility with 3rd parties.

> There is very little documentation on the netfilter site about how the
> netfilter kernel modules should get updated.

Official netfilter kernel modules are part of the linux kernel itself.
That means, no kernel update, no netfilter update.

If you are talking about 'unofficial' patches, then patching your kernel
source is done with Patch-O-Matic.

>
> Clearly, someone was very confused with these patches. It might be that
> linksys was confused earlier, and the openwrt folks were taking that ou=
t
> with their patches. Or maybe it is the other way around.  I don't know.=
 It
> sure left me confused, and wondering wtf.

I'm wondering wtf too about those patches. What are they, why are they...

>
> Seems like there should be a better way to distribute kernel modules.  =
I
> didn't intend to become a netfilter internals expert.

Again, Netfilter Linux kernel modules are distributed with Linux kernel.
KIM, netfilter is a total part of the Linux kernel.

>
> 		--Dean
>

Have a good day,
Samuel



