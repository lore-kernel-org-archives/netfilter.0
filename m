From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: Interesting problems
Date: Tue, 5 Aug 2003 22:54:28 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16160478015.20030805225428@lf.lv>
References: <Pine.LNX.4.44.0308051025320.21531-100000@localhost>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0308051025320.21531-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

Tuesday, August 5, 2003, 12:38:13 PM, Chris Wilson wrote:

CW> Hi Peteris,

>>   - there is a computer PII 266, now with 192mb ram, it's running
[...]
>>     `wc -l /proc/net/ip_conntrack' shows around 20000 entries.
>>     A reboot helps.

CW> This does not surprise me at all. You have a very old computer handling an 
CW> enormous amount of traffic and you complain that it's slow? =)

266 isnt that slow, that's only connection tracking, is it (too slow)?

CW> For reference, we have a 350MHz Cyrix machine handling iptables with
CW> stateful inspection for a medium-loaded 2Mb line with maybe 50 users/boxes
CW> behind it, and it has about 3000 connections right now and a load of 0.04.  
CW> 50% of CPU time is used by the System, indicating netfilter.  Perhaps your
CW> users are very busy?

Simple internet users, some are lazy and just downloading stuff from
different edonkies and emules. Some just use net for google.

Most of the entries taking up conntrack table are:
tcp 6 419547 ESTABLISHED src=X dst=Y sport=A dport=B [UNREPLIED] src=Y
dst=X sport=B dport=A use=1 mark=0

They would expire only after 419547 secs that is 4 days, but during those 4
days the table grows 5 times that much entries..

Is there some trick to kill UNREPLIED tcp conntrack entires if there
is no reply after NN seconds.
Also could it be done in software w/o much trouble? Monitoring
conntrack table and removing dead entries like these.
If it's not much trouble i can instruct our programmers instantly to
work on such tool.

CW> When `wc -l /proc/net/ip_conntrack' shows around 20000 entries, and you 
CW> have set the max to 20000, then no more connections can be added and the 
CW> kernel prints the warning you saw.

Yes, i know.

>>     The question is what could i do to avoid the growthy of connection
>>     tracking entries? I guess the entries taking up space are already
>>     established tcp connections which were not properly terminated, so
>>     they are there to timeout.

CW> Terminate some of your users, or tell them not to use the Internet so 
CW> much!

:)

CW> But a better solution would be to get a real powerful box or not use
CW> stateful inspection (or maybe run nf-hipac or BSD's ipf instead of 
CW> iptables, as apparently both are faster).

Stateful inspection is needed to allow only outbound connections. and
inbound only ESTABLISHED,RELATED.

Unfortunately the software using iptables and Linux is being programmed
for half a year. 3 months left to finish the product. Can't change the
platform.

I can instruct our programmers (I am the team leader) to do some work
on iptables connection tracking code and after improvments i could
send it as a patch for current iptables. So connection tracking would
be as efficient as possible. I just need someone to tell me exactly
what is inefficient in conntrack code.


P.Krumins


