From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: Trouble with PPTP
Date: Wed, 22 Oct 2003 16:16:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066850242.3919.32.camel@ranjeet-pc2.zultys.com>
References: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
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
To: Andrzej Kozak <kozak@manager.ae.wroc.pl>
Cc: kernel@linuxace.com, netfilter@lists.netfilter.org

On Wed, 2003-10-22 at 09:38, Andrzej Kozak wrote:
> Thanks Phil,
> Is better but not excellent.
> After when I :
> Patched kernel (pptp-conntrack-nat from p-o-m)
> Recompiled iptables v 1.2.8
> Recompiled kernel
> i get the same message: iptables: Invalid argument
> but only if firewall script is automated executing from
> /etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is
> booting or rebooting.
> If I log into system and executing this script manually is everything
> OK !
> What is wrong ? 
>  
> best regards
> Andrew Kozak
>  
>  
> > Rebuild iptables userspace using the patched kernel for the headers.
> >
> > Phil Oester
> >
> > On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:
> > > Hello!
> > > When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and
> -SNAT
> is broken if I use iptables with -t nat
> > > I get message: iptables: Invalid argument
> > > Iptables v. 1.2.8
> > > I need establish connect from my security network to outside VPN
> server.
> > >
> > > best regards
> > >
> > > Andrew Kozak

1. make sure your /usr/src/linux link points to the correct linux kernel
source. I dont think this is the problem, just verify this.

2. it sounds like you've got iptables installed in 2 seperate locations.
the older version (compiled against old kernel) is hardcoded or picked
up by the init scripts but when you log in, your $PATH picks up the
newer one (compiled against correct kernel).

I think this is what your problem is.

"locate iptables | grep bin" should identify this problem very quickly.
If not, then you need to dig into the /etc/init.d script that is used on
botup and see where its picking up its iptables from. "which iptables"
should tell you where your login copy is coming from.

HTH,

-- 

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



