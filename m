From: "Diego Sarasua" <debian@sarasuasys.com.ar>
Subject: Re: [REPOST] PPTP+NAT+MASQ anyone? (!!!!!!!!!!!!!!!!!! SORRY BAD LINK !!!!!!!!!!!!!!!!!)
Date: Thu, 26 Dec 2002 20:10:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009a01c2ad34$023927c0$6400a8c0@diego>
References: <200212091226.23888.roy@karlsbakk.net> <1039624902.20562.91.camel@tux> <200212111754.46937.roy@karlsbakk.net> <200212231415.09766.roy@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, Netfilter mailinglist <netfilter@lists.netfilter.org>

http://roeder.goe.net/~koepi/newnat.html
this is the newnat patch link
sorry again
Diego

----- Original Message -----
From: "Roy Sigurd Karlsbakk" <roy@karlsbakk.net>
To: "Netfilter mailinglist" <netfilter@lists.netfilter.org>
Sent: Monday, December 23, 2002 10:15 AM
Subject: [REPOST] PPTP+NAT+MASQ anyone?


> hi all
>
> still trying to patch up my kernel to allow for PPTP NATing, but
patch-o-matic
> simply fails. This is with kernel 2.4.20 (from kernel.org) and latest
> patch-o-matic from cvs.
>
> Can someone _please_ help me here? I'm doing exactly as the doc says!
>
> # pwd
> /usr/src
> # mkdir Pom
> # tar xjf packed/linux-2.4.20.tar.bz2 -C Pom
> ./runme pending
> Testing... ip_conntrack_protocol_destroy.patch NOT APPLIED (6 rejects out
of 6
> hunks)
> Testing... remove_no_version.patch NOT APPLIED (4 rejects out of 4 hunks)
> Testing... newnat-udp-helper.patch NOT APPLIED (8 rejects out of 8 hunks)
>
> # KERNEL_DIR=/usr/src/Pom/linux-2.4.20 ./runme base
> ...
> Testing... IPV4OPTSSTRIP.patch NOT APPLIED ( 1 missing files)
> Testing... NETLINK.patch NOT APPLIED ( 2 missing files)
> Testing... NETMAP.patch NOT APPLIED ( 1 missing files)
> Testing... REJECT.patch.ipv6 NOT APPLIED ( 1 missing files)
> Testing... SAME.patch NOT APPLIED ( 2 missing files)
> Testing... TTL.patch NOT APPLIED ( 2 missing files)
> Testing... ahesp6.patch.ipv6 NOT APPLIED ( 4 missing files)
> Testing... frag6.patch.ipv6 NOT APPLIED ( 2 missing files)
> Testing... fuzzy.patch NOT APPLIED ( 2 missing files)
> Testing... iplimit.patch NOT APPLIED ( 2 missing files)
> Testing... ipt_unclean-ubit.patch NOT APPLIED (1 rejects out of 1 hunks)
> Testing... ipv4options.patch NOT APPLIED ( 2 missing files)
> Testing... ipv6header.patch.ipv6 NOT APPLIED ( 2 missing files)
> Testing... mport.patch NOT APPLIED ( 2 missing files)
> Testing... nth.patch NOT APPLIED ( 2 missing files)
> Testing... opts6.patch.ipv6 NOT APPLIED ( 3 missing files)
> Testing... pool.patch NOT APPLIED ( 5 missing files)
> Testing... psd.patch NOT APPLIED ( 2 missing files)
> Testing... quota.patch NOT APPLIED ( 2 missing files)
> Testing... random.patch NOT APPLIED ( 2 missing files)
> Testing... realm.patch NOT APPLIED ( 2 missing files)
> Testing... route6.patch.ipv6 NOT APPLIED ( 2 missing files)
> Testing... time.patch NOT APPLIED ( 2 missing files)
>
> # KERNEL_DIR=/usr/src/Pom/linux-2.4.20 ./runme extra
> ...
> Testing... CONNMARK.patch NOT APPLIED ( 4 missing files)
> Testing... ROUTE.patch NOT APPLIED ( 2 missing files)
> Testing... amanda-conntrack-nat.patch NOT APPLIED ( 3 missing files)
> Testing... condition.patch NOT APPLIED ( 2 missing files)
> Testing... eggdrop-conntrack.patch NOT APPLIED ( 1 missing files)
> Testing... h323-conntrack-nat.patch NOT APPLIED ( 3 missing files)
> Testing... ip_conntrack-timeouts.patch NOT APPLIED ( 1 missing files)
> Testing... ip_tables-proc.patch NOT APPLIED (5 rejects out of 5 hunks)
> Testing... ipt_TARPIT.patch NOT APPLIED ( 1 missing files)
> Testing... mms-conntrack-nat.patch NOT APPLIED ( 3 missing files)
> Testing... nfnetlink-ctnetlink-0.11.patch NOT APPLIED ( 4 missing files)
> Testing... pptp-conntrack-nat.patch NOT APPLIED ( 8 missing files)
> Testing... quake3-conntrack.patch NOT APPLIED ( 3 missing files)
> Testing... recent.patch NOT APPLIED ( 2 missing files)
> Testing... rsh.patch NOT APPLIED ( 2 missing files)
> Testing... string.patch NOT APPLIED ( 2 missing files)
> Testing... talk-conntrack-nat.patch NOT APPLIED ( 3 missing files)
> Testing... tcp-window-tracking.patch NOT APPLIED (29 rejects out of 32
hunks)
> Testing... tftp-conntrack-nat.patch NOT APPLIED ( 3 missing files)
>
>
>
> --
> Roy Sigurd Karlsbakk, Datavaktmester
> ProntoTV AS - http://www.pronto.tv/
> Tel: +47 9801 3356
>
> Computers are like air conditioners.
> They stop working when you open Windows.
>
>
>



