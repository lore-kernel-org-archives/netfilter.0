From: Thierry ITTY <thierry.itty@besancon.org>
Subject: Re: netfilter configuration for NAT / H323
Date: Wed, 15 Oct 2003 11:08:41
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20031015110841.24bfdf42@s-net-04.besancon.org>
References: <3F8C289A.8040602@msi.unilim.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8C289A.8040602@msi.unilim.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Hubert MERCIER <mercier@msi.unilim.fr>
Cc: netfilter@lists.netfilter.org

Salut Hubert

msn messenger NEEDS an UPNP enabled fw/proxy

get linux-igd (internet gateway device) on sourceforge
(http://linux-igd.sourceforge.net/) and the upnp sdk from intel
(http://download.at.kde.org/opsys/linux/gentoo/distfiles/upnpsdk-1.0.4.tar.g
z). don't use the latest libupnp-1.2.x package, it won't work with igd

install (rebuild) upnp from tarball (take care there's a change to do in
one of the source files, see igd install text)
then build igd from tarball too, this will generate an upnpd executable
that you'll have to lauch as a daemon (write your own rc.d script)
also take care you need a symlink to iptables (read igd install) or it
won't work

begin testing with leaving all ports open on the fw, then rtfm and test
while closing more and more (it's still a bit fuzzy in my head to know
exactly what the strict minimum is to have messenger working...)

if you keep the h323 helpers on your gateway, you might have both yahoo or
ms-netmeeting and msn working together

Bonne Chance

=09




A 18:47 14/10/2003 +0200, vous avez =E9crit :
>Hello.
>
>I know this question has already been posted several times here, but i=20
>didn't find any answer on the archives, despite my long searches.
>
>I have a Linux gateway (Gentoo =3D), and behind this, i sometimes launch=20
>my workstation under windows to chat and use msn messenger for video=20
>chat. But i didn't manage to get it work. I heared about a kernel module=20
>to deal h323 connections, but i don't know if this is relevant for me.=20
>So, in fact, i juste want to get video and voice chat to work in my=20
>Windows box behind my gentoo NATbox (the problem is not the firewall).
>
>If one of you has some clue about it, or (i know im dreaming :p), a=20
>HOWTO, this would be really nice to you to help me solve this problem.=20
>If i can get it to work, i promise to write a HOWTO to help the community.
>
>Thanks in advance !
>
>
>
>

