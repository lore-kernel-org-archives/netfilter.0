From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Re[2]: Interesting problems
Date: Tue, 5 Aug 2003 13:09:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3610@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Peteris Krumins <newsgroups@lf.lv>, Chris Wilson <chris@netservers.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

I think there is a POM module that gives timeout access to the userspace
from /proc... Let me see...

I believe it is: '39_ip_conntrack-proc'

This would allow you to shrink timeouts to whatever time period you
desire.

-----Original Message-----
From: Peteris Krumins [mailto:newsgroups@lf.lv]=20
Sent: Tuesday, August 05, 2003 12:54 PM
To: Chris Wilson
Cc: Netfilter
Subject: Re[2]: Interesting problems

Tuesday, August 5, 2003, 12:38:13 PM, Chris Wilson wrote:

CW> Hi Peteris,

>>   - there is a computer PII 266, now with 192mb ram, it's running
[...]
>>     `wc -l /proc/net/ip_conntrack' shows around 20000 entries.
>>     A reboot helps.

CW> This does not surprise me at all. You have a very old computer
handling an=20
CW> enormous amount of traffic and you complain that it's slow? =3D)

266 isnt that slow, that's only connection tracking, is it (too slow)?

CW> For reference, we have a 350MHz Cyrix machine handling iptables with
CW> stateful inspection for a medium-loaded 2Mb line with maybe 50
users/boxes
CW> behind it, and it has about 3000 connections right now and a load of
0.04. =20
CW> 50% of CPU time is used by the System, indicating netfilter.
Perhaps your
CW> users are very busy?

Simple internet users, some are lazy and just downloading stuff from
different edonkies and emules. Some just use net for google.

Most of the entries taking up conntrack table are:
tcp 6 419547 ESTABLISHED src=3DX dst=3DY sport=3DA dport=3DB [UNREPLIED] =
src=3DY
dst=3DX sport=3DB dport=3DA use=3D1 mark=3D0

They would expire only after 419547 secs that is 4 days, but during
those 4
days the table grows 5 times that much entries..

Is there some trick to kill UNREPLIED tcp conntrack entires if there
is no reply after NN seconds.
Also could it be done in software w/o much trouble? Monitoring
conntrack table and removing dead entries like these.
If it's not much trouble i can instruct our programmers instantly to
work on such tool.

CW> When `wc -l /proc/net/ip_conntrack' shows around 20000 entries, and
you=20
CW> have set the max to 20000, then no more connections can be added and
the=20
CW> kernel prints the warning you saw.

Yes, i know.

>>     The question is what could i do to avoid the growthy of
connection
>>     tracking entries? I guess the entries taking up space are already
>>     established tcp connections which were not properly terminated,
so
>>     they are there to timeout.

CW> Terminate some of your users, or tell them not to use the Internet
so=20
CW> much!

:)

CW> But a better solution would be to get a real powerful box or not use
CW> stateful inspection (or maybe run nf-hipac or BSD's ipf instead of=20
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



