From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: RE: magle, filter & FORWARD
Date: Thu, 3 Jun 2004 09:06:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16575.8774.50608.462899@saint.heaven.net>
References: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
	<Pine.LNX.4.33.0406030956100.10743-100000@blackhole.kfki.hu>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406030956100.10743-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Jozsef Kadlecsik writes:
> On Wed, 2 Jun 2004, Kevin D. White wrote:
> 
> > Netfilter is made up of 5 subsystems, Pre-routing,
> > Input, Forward, Output and Post-routing.  These
> > subsystems are governed by three tables, nat, magle,
> > filter.  The elements of these tables have the
    ...
> Sorry, but the wording used above is incorrect and misleading.
> 
> Netfilter is *not* made of five subsystems and PREROUTING etc are
> definitely not subsystems of netfilter.

Jozsef is correct, of course.  In addition, recent kernels have a
fourth table, the "raw" table, with its own PREROUTING and OUTPUT
chains.  Joszef is the originator of the raw table but apparently is
too modest to mention it.

> Hooks, built-in chains, subsystems and tables are well covered in the
> howtos and the tutorials. Please read them.

I would second that advice.  What Kevin was attempting is already done
well and correctly in the online documentation.  Please don't fill the
list archives with unnecessary explanations - especially incorrect
ones.

--
Dick St.Peters, stpeters@NetHeaven.com 

