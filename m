From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 11:47:32 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406211143360.31871-100000@blackhole.kfki.hu>
References: <20040619042619.46385.qmail@web14704.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040619042619.46385.qmail@web14704.mail.yahoo.com>
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
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Fri, 18 Jun 2004, Sagara Wijetunga wrote:

> > > Today I upgraded the Linux kernel to 2.6.7.
> > >
> > > Applied following patches of the
> > > patch-o-matic-ng-20040302:
> > > init_conntrack-optimize NETMAP SAME TTL connlimit
> > > fuzzy iprange ipv4options mport raw CLASSIFY
> > addrtype
> > > childlevel owner-socketlookup
> > >
> > > Compiled in all netfiter options to the kernel.
> >
> > Could you post the output of
> >
> > grep IP_NF_ .config
> >
> cd /usr/src/linux-2.6.7
> grep IP_NF_ .config
>
> CONFIG_IP_NF_CONNTRACK=y
> CONFIG_IP_NF_FTP=y

OK.

> The iptables-1.2.10 was compiled and installed as

Are you sure, you run the kernel indicated?

How did you compile iptables-1.2.10? There was a bug introduced in
linux-2.6.7, which prevented anyone to compile the iptables source
using linux-2.6.7.

> > You should post the complete list of your rules in
> > all of the tables.
> >
> 	/sbin/iptables -P INPUT DROP
> 	/sbin/iptables -P FORWARD DROP
> 	/sbin/iptables -P OUTPUT DROP

What about the nat/mangle/raw tables?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary




