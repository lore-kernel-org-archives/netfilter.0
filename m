From: Harald Welte <laforge@gnumonks.org>
Subject: Re: FYI: QUEUE & ipqmpd bugs
Date: Fri, 5 Jul 2002 21:15:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <ag4rc0$pf3$2@main.gmane.org>
References: <003301c2242d$7fca2e40$0689cb8a@etbx180>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <003301c2242d$7fca2e40$0689cb8a@etbx180>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Michel Hemstedt <jean-michel.hemstedt@alcatel.be>
Cc: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

On Fri, Jul 05, 2002 at 04:08:54PM +0200, Jean-Michel Hemstedt wrote:
> FYI,
> 
> I upgraded to iptables-1.2.6a (user & kernel-2.4.18 patches)
> and got the following (maybe known) problems:
> 
> - QUEUE target is NOK with kernel compiled with CONFIG_IP_NF_QUEUE=m
>   => the packets are queued, but ipq_create_handle() returns 
>      "can't create netlink socket"
>      "ERROR: Unable to create netlink socket: Connection refused"
>     (problem with exported symbols?)
>   =>quick fix: compile kernel with CONFIG_IP_NF_QUEUE=y

I think james should be able to answer that.

> - ipqmpd-0.3: default verdict NF_ACCEPT is not applied when no
>   process has attached to it. In fact ipqmpd starts, but it seems
>   that it never receives any packet (in ipq_inp). When one process
>   attaches to it, with a mark different from the queued packet, then
>   the default NF_ACCEPT is applied correctly. When all processes have
>   detached from ipqmpd, the default NF_ACCEPT continues to be applied
>   correctly.

ever looked at the CVS repository? 
http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ipqmpd/

None of that code has been touched since 22 months... I wrote ipqmpd for
fun, and nobody really seemed to use it.  Feel free to submit patches or
take over maintainership of ipqmpd :)

> kr,
> -jmhe-               He who expects nothing shall never be disappointed

-- 
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
============================================================================
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M- 
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)

