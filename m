From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: Re: h323-conntrack-nat.patch problem
Date: Wed, 18 Sep 2002 18:06:38 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918180638.5de4a630.arc_of_descent@gmx.net>
References: <DGEFLNBBHJDEGJNHJIEMGEELCEAA.ludovic.ducros@isep.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DGEFLNBBHJDEGJNHJIEMGEELCEAA.ludovic.ducros@isep.fr>
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
To: netfilter@lists.netfilter.org

Ludovic Ducros <ludovic.ducros@isep.fr> thus wrote:

>    I have a very big problem to install the h323-conntrack-nat.patch.
> I have a Linux Red Hat 7.3 with a 2.4.18-3 kernel : that's my gateway to
> access the Internet.
> I would like to use netmeeting on a computer with Win2000 connected to this
> gateway.
> Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
> Testing patch newnat/h323-conntrack-nat.patch...
>    Placed new Config.in line
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
> TEST FAILED: patch NOT applied.


Hi, I hope the following helps you. I had faced the exact 
similar problem, and  a few more, but i got it resolved :-)

I used linux-2.4.18.tar.bz2, iptables-1.2.7a.tar.bz2
and patch-o-matic-20020825.tar.bz2

o First untar the linux source tree
o Apply custom patches which u require.
	Me can't do w/o the htb patch :-)
o untar patch-o-matic-20020825.tar.bz2
o in the pom directory, $ ./runme extra
o When prompted for the KERNEL_DIR,
	enter the full path to the directory
	where the new linux source tree is
o I used the following patches of pom
        ahesp-static.patch
        arptables.patch
        config-cleanup.patch
        conntrack+nat-helper-unregister.patch
        conntrack.patch
        dscp.patch
        DSCP.patch
        ecn.patch
        ECN.patch
        helper.patch
        ip_conntrack_protocol_destroy.patch
        ip_conntrack_protocol_unregister.patch
        local-nat.patch
        macro-trailing-semicolon-fix.patch
        nat-export_symbols.patch
        nat-memoryleak-fix.patch
        netfilter-arp.patch
        z-newnat16.patch
        eggdrop-conntrack.patch
        h323-conntrack-nat.patch
        pptp-conntrack-nat.patch

	I expereinced problems with the z-newnat16.patch,
	but the above sequence works fine with me.
	Most important, remember "not" to apply the connmark patch
	I don't know why, maybe somebody can clarify this.
o Now do make xconfig or menuconfig,
	and check options which u want like H323, etc
o Compile the kernel.
o untar iptables-1.2.7a.tar.bz2
o remember to uninstall the previous installation of iptables
o make with KERNEL_DIR set to the linux source tree

HTH

--
arc_of_descent

