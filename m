From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Allow active and passive FTP connections
Date: Fri, 18 Jun 2004 21:16:40 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406182109490.25875-100000@blackhole.kfki.hu>
References: <20040618171424.37671.qmail@web14728.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040618171424.37671.qmail@web14728.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Fri, 18 Jun 2004, Sagara Wijetunga wrote:

> Today I upgraded the Linux kernel to 2.6.7.
>
> Applied following patches of the
> patch-o-matic-ng-20040302:
> init_conntrack-optimize NETMAP SAME TTL connlimit
> fuzzy iprange ipv4options mport raw CLASSIFY addrtype
> childlevel owner-socketlookup
>
> Compiled in all netfiter options to the kernel.

Could you post the output of

grep IP_NF_ .config

running it in the source tree of linux-2.6.7?

> After the server is booted with the new kernel, I
> recompiled and reinstalled the iptables.
>
> But my problem is still the same. The =93-m state
> --state ESTABLISHED=94 works well, but the =93-m state
> --state RELATED=94 does not work at all for FTP data
> connections. What have I missed?

You should post the complete list of your rules in all of the tables.

There is something definitely wrong in your configuration.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary




