From: George Chacon <please.help.me@comcast.net>
Subject: RE: How to keep record of repeat attackers?
Date: Thu, 13 Mar 2003 00:50:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PKEJLPJCFBFLJJPHMGPIEEBECAAA.please.help.me@comcast.net>
References: <200303130240.27139.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200303130240.27139.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, Netfilter Mailing List <netfilter@lists.netfilter.org>

Wow!  I'm guessing you've been using iptables for a while.  I thank you for
the thorough response.  I'll take it and slowly examine it a line and word
at a time - and do further research on some of the terms.  I'll also take a
look at http://ntop.org.  It does look pretty nice.

Thanks again Joel,

George



-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Wednesday, March 12, 2003 11:40 PM
To: George Chacon; Netfilter Mailing List
Subject: Re: How to keep record of repeat attackers?


On Thursday 13 March 2003 02:19 am, George Chacon wrote:
> >>Your first problem is defining "offenders", then "repeat offenders"
> >> and "attackers".  Do you mean simply to track everyone who attempts
> >> to connect to you?  I presume you don't expect much if any
> >> legitimate incoming NEW traffic if this is the intent?
>
> Thanks for the response Joel.  What I'd like to track are the IP
> addresses that get denied or rejected, and the deny/reject rules that
> get accessed frequently.  In other words, I'd like to track repeated,
> obvious, malicious connections.  I'd like to know if the same person
> is relentlessly chipping away at my firewall, looking for weaknesses.

For that you can use a combination of "iptables -L -v -n" (List, verbose
to list counts, numeric instead of trying to resolve IPs) to list the
rules with packet and byte counts that have matched each, and the LOG
target just before the DROP (same rule with "-j LOG" instead of "-j
DROP") to log more detailed info, like IPs, portnums, TTL and packet
size.

The list (if you have many rules) could be done with "iptables -L -v -n |
grep DROP" to show only DROP rules.

The LOG target logs via syslog as a kernel message, so it usually goes to
/var/log/messages.  That gets a little cluttered.  It's easier if you
edit /etc/syslog.conf and add something like "kern.=debug
/var/log/firewall" near the top, then restart syslog with "service
syslogd restart" as root.  Now kernel messages of level "debug" (level
7) will go to that log file instead of the default.  (unless you're
debugging your kernel that stream's pretty quiet)  The final key is to
add the option "--log-level 7" after the LOG target.  You can also add
'--log-prefix "LOGCOMMENT"' as well, and all the log entries for that
rule will have LOGCOMMENT prefixed before the info.  This makes for
easier sorting and identification in the log file.

> I'll take a look at http://ntop.org.  That looks pretty good.

Actually it seems very nice, but AFAIK it is unable to see anything that
is DROPped or REJECTed...  Still poking about with it.

j




