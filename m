From: Bill Davidsen <davidsen@tmr.com>
Subject: RE: How to keep record of repeat attackers?
Date: Thu, 13 Mar 2003 14:34:15 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.3.96.1030313142253.32436A-100000@gatekeeper.tmr.com>
References: <PKEJLPJCFBFLJJPHMGPIAEBDCAAA.please.help.me@comcast.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PKEJLPJCFBFLJJPHMGPIAEBDCAAA.please.help.me@comcast.net>
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
To: George Chacon <please.help.me@comcast.net>
Cc: netfilter@newkirk.us, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 12 Mar 2003, George Chacon wrote:

> >>Your first problem is defining "offenders", then "repeat offenders" and
> >>"attackers".  Do you mean simply to track everyone who attempts to
> >>connect to you?  I presume you don't expect much if any legitimate
> >>incoming NEW traffic if this is the intent?
> 
> Thanks for the response Joel.  What I'd like to track are the IP addresses
> that get denied or rejected, and the deny/reject rules that get accessed
> frequently.  In other words, I'd like to track repeated, obvious, malicious
> connections.  I'd like to know if the same person is relentlessly chipping
> away at my firewall, looking for weaknesses.
>
> I'll take a look at http://ntop.org.  That looks pretty good.

It may do, but I would still keep LOG in mind. You can catch just what you
want, put a useful prefix on the message to simplify analysis, and bang on
it with a perl program.

One hint for quick and dirty values is to write as little custom code as
you can. I use perl to identify the offending IPs and dump them to stdout,
then something like:
  perl getIP.pl mylog | sort | uniq -c | sort -n | tail -20

Emits the IP, sorts for uniq, output a count of how many times the IP
showed up, sorts on the count, and displays the top 20 "worst offenders."
Since this isn't something I often do the same way twice, it works for me.

-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.


