From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: [REPOST] PPTP+NAT+MASQ anyone?
Date: Mon, 23 Dec 2002 12:02:47 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212231149540.19524-100000@localhost.localdomain>
References: <200212231415.09766.roy@karlsbakk.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212231415.09766.roy@karlsbakk.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>


Are you using the CVS repository from netfilter.org or some package based
on it?  The code from CVS worked fine for me.  The runme script should
print a message

   Examining kernel in /usr/src/Pol/linux-2.4.20

The PPTP kernel patch from CVS

  http://cvs.netfilter.org/cgi-bin/cvsweb/netfilter/patch-o-matic/extra/

fails to rewrite the replies from the remote PPTP server.  Check the
netfilter-devel thread with the fix offered by Philip Craig,

http://lists.netfilter.org/pipermail/netfilter-devel/2002-November/009902.html
http://lists.netfilter.org/pipermail/netfilter-devel/2002-December/009913.html

I've uploaded the cumulative PPTP patch against Linux 2.4.20 to

http://sourceforge.net/tracker/index.php?func=detail&aid=654010&group_id=44827&atid=441005

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117

On Mon, 23 Dec 2002, Roy Sigurd Karlsbakk wrote:

> hi all
>
> still trying to patch up my kernel to allow for PPTP NATing, but patch-o-matic
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
> Testing... ip_conntrack_protocol_destroy.patch NOT APPLIED (6 rejects out of 6
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
> Testing... tcp-window-tracking.patch NOT APPLIED (29 rejects out of 32 hunks)
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
>


