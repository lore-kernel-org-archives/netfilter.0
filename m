From: Fernando Barrocal <fbarrocal@uol.com.br>
Subject: Re: Trouble with PPTP
Date: Wed, 22 Oct 2003 16:22:46 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20031022162210.01b67a50@pop3.uol.com.br>
References: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_498772847==.ALT"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
References: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Andrzej Kozak <kozak@manager.ae.wroc.pl>, kernel@linuxace.com
Cc: netfilter@lists.netfilter.org

--=====================_498772847==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed


You will need to compile iptables after the kernel then reboot

--
F.Barrocal

At 14:38 22/10/2003, Andrzej Kozak wrote:
>Thanks Phil,
>Is better but not excellent.
>After when I :
>Patched kernel (pptp-conntrack-nat from p-o-m)
>Recompiled iptables v 1.2.8
>Recompiled kernel
>i get the same message: iptables: Invalid argument
>but only if firewall script is automated executing from 
>/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is 
>booting or rebooting.
>If I log into system and executing this script manually is everything OK !
>What is wrong ?
>
>best regards
>Andrew Kozak
>
>
> > Rebuild iptables userspace using the patched kernel for the headers.
> >
> > Phil Oester
> >
> > On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:
> > > Hello!
> > > When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and -SNAT
>is broken if I use iptables with -t nat
> > > I get message: iptables: Invalid argument
> > > Iptables v. 1.2.8
> > > I need establish connect from my security network to outside VPN server.
> > >
> > > best regards
> > >
> > > Andrew Kozak


--=====================_498772847==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
<br>
You will need to compile iptables after the kernel then reboot<br><br>
--<br>
F.Barrocal<br><br>
At 14:38 22/10/2003, Andrzej Kozak wrote:<br>
<blockquote type=cite class=cite cite><font size=2>Thanks Phil,<br>
Is better but not excellent.<br>
After when I :<br>
Patched kernel (pptp-conntrack-nat from p-o-m)<br>
Recompiled iptables v 1.2.8<br>
Recompiled kernel<br>
i get the same message: iptables: Invalid argument<br>
but only if firewall script is automated executing from
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is
booting or rebooting.<br>
If I log into system and executing this script manually is everything OK
!<br>
What is wrong ?</font> <br>
&nbsp;<br>
<font size=2>best regards<br>
Andrew Kozak<br>
</font>&nbsp;<br>
&nbsp;<br>
&gt; Rebuild iptables userspace using the patched kernel for the
headers.<br>
&gt;<br>
&gt; Phil Oester<br>
&gt;<br>
&gt; On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:<br>
&gt; &gt; Hello!<br>
&gt; &gt; When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT
and -SNAT<br>
is broken if I use iptables with -t nat<br>
&gt; &gt; I get message: iptables: Invalid argument<br>
&gt; &gt; Iptables v. 1.2.8<br>
&gt; &gt; I need establish connect from my security network to outside
VPN server.<br>
&gt; &gt;<br>
&gt; &gt; best regards<br>
&gt; &gt;<br>
&gt; &gt; Andrew Kozak</blockquote></body>
<br>
</html>

--=====================_498772847==.ALT--


