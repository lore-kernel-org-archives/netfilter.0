From: "hare ram" <hareram@sol.net.in>
Subject: Re: Time Patch on 1.2.6a
Date: Sat, 14 Dec 2002 13:08:18 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040601c2a343$c56593a0$13fcc5cb@nextto>
References: <F8au7JJi2Fu6JX8dE520000db97@hotmail.com>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Huw Dixon <huwdixon@hotmail.com>, fabrice@netfilter.org, netfilter@lists.netfilter.org

Yes

DownLoad P-O-M or get new 1.2.7a tar file from netfilter site
since i have same version, i could not able to re-compile kernel after
patching with time, quote patch
so i removed RPM, bought latest 1.2.7a patched to the kernal

now its working fine

best of luck

hare
----- Original Message -----
From: "Huw Dixon" <huwdixon@hotmail.com>
To: <fabrice@netfilter.org>; <netfilter@lists.netfilter.org>
Sent: Saturday, December 14, 2002 11:14 AM
Subject: Re: Time Patch on 1.2.6a


> Thx - i did have rpm iptables installed. I've removed the iptables
package.
> Since I've already went the the 'pending-patches' step and the TIME match
> option does show in my kernel .config, can I simply do a kernel compile
from
> make dep to make modules_install, reboot and install iptables 1.2.6a?
>
> Huw
>
>
> >
> >You need to recompile & install iptables after that your kernel has been
> >patched.
> >Since you run RH, make sure also that iptables RPM package is not
> >installed.
> >
> ># rpm -q iptables
> >package iptables is not installed
> >
> >If it is, just remove it, and re-compile & reinstall iptables.
> >
> >Have a nice day,
> >
> >Fabrice.
> >--
> >Fabrice MARIE
> >
> >"Silly hacker, root is for administrators"
> >        -Unknown
>
>
> _________________________________________________________________
> Help STOP SPAM with the new MSN 8 and get 2 months FREE*
> http://join.msn.com/?page=features/junkmail
>
>
>


