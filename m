From: "Jason Corekin" <jason@corekin.no-ip.com>
Subject: Re: Custom kernel won't load iptables modules
Date: Sun, 16 Feb 2003 15:16:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008601c2d611$6b0764f0$5d01a8c0@jason>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E5@EXCHANGE>
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
To: netfilter@lists.samba.org

    Thanks, it actually was not ipchains which I have worked hard  to remove
all traces of.
Rather it was ipfwadm which had been accidentally hardcoded in, instead of
being removed.
Boy do I feel stupid. :(

Jason Corekin

----- Original Message -----
From: "Khanh Tran" <khanh@slc.edu>
To: "Jason Corekin" <jason@corekin.no-ip.com>; <netfilter@lists.samba.org>
Sent: Sunday, February 16, 2003 12:52 AM
Subject: RE: Custom kernel won't load iptables modules


> Sometimes Linux, especially boxes upgraded from previous RedHat installs,
> hold onto the ipchains modules.  Try:
>
> /sbin/chkconfig --level=2345 ipchains off
> /sbin/rmmod ipchains
>
> Then insert your iptables modules.
>
> Khanh Tran
> Network Operations
> Sarah Lawrence College
>
>
> -----Original Message-----
> From: Jason Corekin [mailto:jason@corekin.no-ip.com]
> Sent: Sunday, February 16, 2003 1:24 AM
> To: netfilter@lists.samba.org
> Subject: Custom kernel won't load iptables modules
>
>
> Does anybody no why I can not get my custom compiled kernel to load it's
> iptables modules?
>
> I am running on RedHat 8.0.  I have everything else working, but iptables
> goes to load I get the messages
>
> Feb 15 20:36:10 corekin iptables: Starting iptables:
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> Feb 15 20:36:10 corekin iptables: Hint: insmod errors can be caused by
> incorrect module parameters, including invalid IO or IRQ parameters.
> Feb 15 20:36:10 corekin iptables: You may find more information in syslog
or
> the output from dmesg
> Feb 15 20:36:10 corekin iptables: init_module: Device or resource busy
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> insmod
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o
> failed
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> insmod ip_tables failed
> Feb 15 20:36:10 corekin iptables: iptables v1.2.6a: can't initialize
> iptables table `filter': iptables who? (do you need to insmod?)
> Feb 15 20:36:10 corekin iptables: Perhaps iptables or your kernel needs to
> be upgraded.
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> Feb 15 20:36:10 corekin iptables: Hint: insmod errors can be caused by
> incorrect module parameters, including invalid IO or IRQ parameters.
> Feb 15 20:36:10 corekin iptables: You may find more information in syslog
or
> the output from dmesg
> Feb 15 20:36:10 corekin iptables: init_module: Device or resource busy
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> insmod
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o
> failed
> Feb 15 20:36:10 corekin iptables:
> /lib/modules/2.4.18-24.8.0custom/kernel/net/ipv4/netfilter/ip_tables.o:
> insmod ip_tables failed
> Feb 15 20:36:10 corekin iptables: iptables-restore v1.2.6a:
> iptables-restore: unable to initializetable 'nat'
> Feb 15 20:36:10 corekin iptables:
> Feb 15 20:36:10 corekin iptables: Try `iptables-restore -h' or
> 'iptables-restore --help' for more information.
> Feb 15 20:36:10 corekin rc: Starting iptables: failed
>
> I have attached my configuration file if that will help.
>
> I explicitly made sure that fast switching was turned off, but beyond that
I
> do not know what else could conflict with iptables.
>
> Thanks in advance
>
> Jason Corekin
>
>
>


