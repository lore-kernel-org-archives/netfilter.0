From: Jason Opperisano <opie@817west.com>
Subject: Re: Re: Route traffic per protocol - it is possible?
Date: Tue, 14 Jun 2005 14:47:42 -0400
Message-ID: <20050614184742.GA19709@bender.817west.com>
References: <41345.200.40.212.129.1118250147.squirrel@webmail.prolinux.net.uy>
	<20050614182859.47598.qmail@web54307.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050614182859.47598.qmail@web54307.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jun 14, 2005 at 11:28:58AM -0700, Scott wrote:
> Hi, I tried with the -p tcp and then with -p tcp -m
> tcp options and to no avail, but with a new error:
> 
> iptables: No chain/target/match by that name
> 
> I have gone through every bit of the command:
> 
> iptables -t mangle -A PREROUTING -p tcp -m tcp --dport
> 22 -j ROUTE --gw 1.2.3.4
> 
> ..to no avail!!  even if I change PREROUTING to INPUT,
> OUTPUT, FORWARD or POSTROUTING it's the same error..
> surely someone must know why, I'm out of answers...

you don't have support for the ROUTE target in your kernel.  if you have
a modular kernel:

  ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_ROUTE*

if you do not have a modular kernel:

  grep ROUTE /proc/net/ip_tables_targets

if neither command produces positive output, patch and recompile your
kernel with support for the ROUTE target.

-j

--
"Peter: We could always go to purgatory like we did last year.
 Lois: This isn't bad. It's not good, but it's not bad.
 Brian: So so.
 Peter: More or less."
        --Family Guy

