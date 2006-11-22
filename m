From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: What happened to ipt_physdev.c ?
Date: Wed, 22 Nov 2006 12:24:45 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0611221223100.4043@localhost.localdomain>
References: <1164206481.456461916ec06@mail.third-rock.net>
	<45648336.1010003@andyfurniss.entadsl.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45648336.1010003@andyfurniss.entadsl.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Furniss <lists@andyfurniss.entadsl.com>
Cc: netfilter@lists.netfilter.org

On Wed, 22 Nov 2006, Andy Furniss wrote:

> Paul Reilly wrote:
> > In recent kernels, 2.6.16.x   there is no longer any
> >
> > net/ipv4/netfilter/ipt_physdev.c
> >
> > and no option in kernel config to enable CONFIG_NETFILTER_XT_MATCH_PHYSDEV
> > So I have no physdev in /proc/net/ip_tables_matches
> > and my rules which include a -m physdev fail with:
> >
> > iptables: No chain/target/match by that name
> >
> > Has PHYSDEV been moved somewhere else?
> > How do I enable it?
> >
> > Paul
> >
> >
>
> It's there in 17 & 19 somewhere :-)
>
> grep -i phy /boot/config-2.6.19-rc6
> ...
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
> ...

if you have a kernel source tree, just pop into "make menuconfig" and
do a search for any matching options:

/physdev

Symbol: NETFILTER_XT_MATCH_PHYSDEV [=m]
Prompt: "physdev" match support
  Defined at net/netfilter/Kconfig:368
  Depends on: NET && NETFILTER && NETFILTER_XTABLES && BRIDGE &&

... etc etc ...

rday

