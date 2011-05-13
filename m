From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: manually update iptables
Date: Fri, 13 May 2011 10:57:42 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105131042530.8753@obet.zrqbmnf.qr>
References: <41501.87.139.33.146.1305264533.squirrel@mx2bln1.prossl.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <41501.87.139.33.146.1305264533.squirrel@mx2bln1.prossl.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bm@it41.de
Cc: netfilter@vger.kernel.org

On Friday 2011-05-13 07:28, bm@it41.de wrote:

>First of all the default installation of iptables was version 1.3.5. which
>seemed to have an issue regarding the connlimit module, cause i got that
>weird errors.

The weird number error was only finally fixed in v1.4.3.

>testserver1:/# iptables -A INPUT -p tcp --dport 80 -m connlimit
>--connlimit-above 3 -j REJECT
>iptables: Unknown error 18446744073709551615
>-----------------------------------------------

>So i tried to manually install 1.3.8 (just some minor releases up to
>prevent huge conflicts) against the kernel source. That actually worked.

You are misled - iptables version numbers do not indicate anything at 
this time (other than providing an ordering relation).

>But i missed something, it seems that i need to update the kernel
>netfilters aswell
>----------------------------------------------
>testserver1:/usr/src/iptables-1.3.8# iptables -m connlimit --help
>iptables: match `connlimit' v1.3.5 (I'm v1.3.8).
>----------------------------------------------

iptables looks in the plugin directory and finds 1.3.5's plugins there, 
which means you have not installed the new ones.
If you want to run iptables from the source directory, you will need to 
use something like ./configure --with-xtlibdir=$PWD/extensions
and of course a recent package.

>As you may have noticed i am not a kernel expert and never tried to
>install iptables from source before, i would be very happy about any
>advice, hint, link or whatever you could give to me.

Use distro-provided packages preferably. If it does not get you a 
reasonable version, maybe you have to consider that choosing a
5-year-old-stack-shipping distro is not the ideal target when trying to 
create/operate a firewall.
