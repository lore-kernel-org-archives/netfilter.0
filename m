From: Thierry ITTY <thierry.itty@besancon.org>
Subject: Re: H323 gateway? HELP
Date: Thu, 25 Sep 2003 07:59:07
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20030925075907.36c74c56@s-net-04.besancon.org>
References: <5.2.0.9.0.20030924160315.00bb9008@mail.network.com.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030924160315.00bb9008@mail.network.com.pt>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Carlos Santos <csantos@csantos.net>
Cc: netfilter@lists.netfilter.org

>Can anyone please tell me if there is a difference between the ways that=20
>Yahoo Messenger and MSN Messenger handle audio/video connections ? I have a=
=20
>linux box (netfilter/iptables...) handling my connections (from my private=
=20
>network) to the Internet and the kernel supports H323. The problem is that=
=20
>I can connect to anyone using my webcam in Yahoo Messenger with great audio=
=20
>and video but I'm having a hard time with MSN. I though they both used the=
=20
>same method.... Do I have to have a different set of rules for each one ?

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

good luck


			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE

