From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: deleting a conntrack record
Date: Thu, 17 Jun 2004 16:20:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171620.24232.Antony@Soft-Solutions.co.uk>
References: <876ef97a0406170807663b89e0@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <876ef97a0406170807663b89e0@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 17 June 2004 4:07 pm, Tobias DiPasquale wrote:

> Hello all,
>
> I have a module that exports a /proc entry which takes a string with 4
> args in it (src IP/port and dst IP/port) and then attempts to delete
> the conntrack entry for the TCP connection associated with those
> arguments.
>
> The problem is as follows:
>
> There is a userspace script that runs from cron every 5 minutes. It
> looks through the /proc/net/ip_conntrack listing to see if any
> connections are "stale" (i.e. haven't seen a packet from them in
> some amount of time). It then feeds their connection information
> into my module's /proc entry so that those conntrack records can
> be destroyed.

Why not just use the built-in timeouts to delete stale entries from the 
conntrack table?

You can adjust the timeout settings using entries in 
/proc/sys/net/ipv4/netfilter and I believe there may be a p-o-m update to 
give even further fine-grained control.

Regards,

Antony.

-- 
I own three Windows books, published by O'Reilly.   They are "Windows 
Annoyances", "Office 97 Annoyances" and "Windows 98 Annoyances".   That 
pretty much sums it up for me.

                                                     Please reply to the list;
                                                           please don't CC me.


