From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: magle, filter & FORWARD
Date: Thu, 3 Jun 2004 10:02:42 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406030956100.10743-100000@blackhole.kfki.hu>
References: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
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
To: "Kevin D. White" <web_crawlz@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Jun 2004, Kevin D. White wrote:

> Netfilter is made up of 5 subsystems, Pre-routing,
> Input, Forward, Output and Post-routing.  These
> subsystems are governed by three tables, nat, magle,
> filter.  The elements of these tables have the
> following characteristics.  First there is a 'hook' or
> subsystem identifier (i.e. PREROUTING, INPUT, FORWARD,
> etc), then there is a condition and finally there is
> an Action/Target.  All received packets begin in the
> Pre-routing subsystem, the Pre-routing subsystem
> accesses the nat table and looks for all it's hooks
> (all elements with PREROUTING).  Then the same is done
> with the mangle table.  A routing decision is made,
> and the packet would either move into the Input
> subsystem or the Forward subsystem were the tables for
> those subsytems would be accessed and so on.  All
> packets end up in the Post-routing subsystem before
> leaving an interface.

Sorry, but the wording used above is incorrect and misleading.

Netfilter is *not* made of five subsystems and PREROUTING etc are
definitely not subsystems of netfilter.

> I am intentionally ignoring user created hooks.

Just consider if you not ignore user created chains (not hooks): were
they also netfilter "subsystems"?

Hooks, built-in chains, subsystems and tables are well covered in the
howtos and the tutorials. Please read them.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


