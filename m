From: =?ISO-8859-1?Q?Cilli=E8_Burger?= <security@sadomain.co.za>
Subject: Memory problem
Date: Thu, 03 Jul 2003 09:53:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F03FD0F.5070509@sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Everyone

I was wondering if anyone has a solution to this problem.

I have a the following box that sits between our router and switch:

Pentium 200, 64 Mbyte RAM, Linux version 2.4.18-3=20
(bhcompile@stripples.devel.redhat.com)
(gcc version 2.96 20000731 (Red Hat Linux 7.3 2.96-110)), iptables v1.2.5

I almost never reboot this box, but lately I have noticed a dramatic=20
increase in memory consumption.

I start out on bootup with about 40 MB or so free and in a weeks time=20
its down to about 800KB.
When iptables is restarted and the rules flushed and reloaded I reclaim=20
about 6024 KB, which then gradually
decreases back to about a meg in a 16 hour period.

I run about 400 rules on this box and ipt_conntrack_max is set at 4096.


I do want to add more memory to the box, but i have this strange feeling=20
that it will just consume all of that aswell until
it reaches some kind of lower limit on allowable free memory.

Unfortunately I am not sure of how to count the number of simultaneous=20
connection
but since we run a few mail and web-servers and also a few busy dns servers.
I estimate that there are about 300 connections per second.

My questions, if anyone has payed attention thus far :)

Why does iptables consume so much memory ?
Why does iptables appear to loose so much memory ? When regarding this=20
question, consider the following:

On reboot and before loading of rules there is about 40 MB free ram.=20
After loading the rules, and about two weeks uptime
there is about 800KB of free memory. After flushing the rules, theres=20
only 6024 KB free.
Is there a slight possibility that this may be due to a memory leak of=20
some sort ?

Thanks in advance for your help. Keep up the good work Netfilter .

Regards,

Cillii=E8 Burger
SA-DOMAIN Internet Services












