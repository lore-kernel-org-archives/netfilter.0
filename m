From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to keep record of repeat attackers?
Date: Thu, 13 Mar 2003 02:40:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303130240.27139.netfilter@newkirk.us>
References: <PKEJLPJCFBFLJJPHMGPIAEBDCAAA.please.help.me@comcast.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: George Chacon <please.help.me@comcast.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

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

For that you can use a combination of "iptables -L -v -n" (List, verbose=20
to list counts, numeric instead of trying to resolve IPs) to list the=20
rules with packet and byte counts that have matched each, and the LOG=20
target just before the DROP (same rule with "-j LOG" instead of "-j=20
DROP") to log more detailed info, like IPs, portnums, TTL and packet=20
size.

The list (if you have many rules) could be done with "iptables -L -v -n |=
=20
grep DROP" to show only DROP rules.

The LOG target logs via syslog as a kernel message, so it usually goes to=
=20
/var/log/messages.  That gets a little cluttered.  It's easier if you=20
edit /etc/syslog.conf and add something like "kern.=3Ddebug=09=09=09
/var/log/firewall" near the top, then restart syslog with "service=20
syslogd restart" as root.  Now kernel messages of level "debug" (level=20
7) will go to that log file instead of the default.  (unless you're=20
debugging your kernel that stream's pretty quiet)  The final key is to=20
add the option "--log-level 7" after the LOG target.  You can also add=20
'--log-prefix "LOGCOMMENT"' as well, and all the log entries for that=20
rule will have LOGCOMMENT prefixed before the info.  This makes for=20
easier sorting and identification in the log file.

> I'll take a look at http://ntop.org.  That looks pretty good.

Actually it seems very nice, but AFAIK it is unable to see anything that=20
is DROPped or REJECTed...  Still poking about with it.

j



