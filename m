From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Iptables efficiency
Date: Tue, 11 Mar 2003 09:31:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303110931.23730.netfilter@newkirk.us>
References: <007b01c2e72f$76712180$0200a8c0@rinse>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007b01c2e72f$76712180$0200a8c0@rinse>
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
To: Rinse Kloek <rinse@solcon.nl>, netfilter@lists.netfilter.org

On Monday 10 March 2003 01:04 pm, Rinse Kloek wrote:
> We use a RedHat 7.3 machine as bridge on a P3 1.8 Ghz with 2 64 bits
> Gigabit interfaces. On the machine we have a lot of iptables rules
> like : all  --  213.134.x.0        0.0.0.0/0
>             all  --  0.0.0.0/0            213.134.x.0
> TOS    all  --  213.134.x.4        0.0.0.0/0          TOS set 0x08
>             all  --  0.0.0.0/0            213.134.x.4
>
> We have about 3200 iptables rules on our bridge. I've tested today to
> remove 1000 of these rules. The load dropped from about 40% to 25%. So
> I think the iptables rule take up the most of the CPU load. Do you
> think this is a problem of ineffeciency of iptables or just a
> 'limitation' in the TCP/IP stack of linux ?
>
> regards Rinse

What is the traffic load like?

What types of matches are you performing?  IP and port,  TOS, state,=20
string?  Are most of your rules 'test and drop' or 'test and accept', or=20
are you performing extensive modifications like the TOS set above? =20
These are big factors in the cost of getting a packet through.

What is the structure of the ruleset?  Is it 'flat' where a given packet=20
could potentially be tested against a large percentage of these rules?

If you haven't done so, try organizing your rules as a tree, using custom=
=20
chains.  IE, instead of having 2000 rules in a row in FORWARD that test=20
"-s a.b.c.d" try having rules that test "-s a.b.c.n/24" "-s a.b.d.n/24"=20
"a.b.e.n/24" etc and jump to user-defined chains, one for each of the=20
main rules.  This will immediately reduce the maximum number of tests=20
for a given packet from ~2000 to ~260. (max now would be 253 for all=20
legal values of the last octet, plus the number of rules in the main=20
chain) You can further reduce by breaking that last octet down into,=20
say, 16 chains of 16 IPs each, and then your second-level chains will=20
contain rules that test "-s a.b.c.0/28" "-s a.b.c.16/28" "-s=20
a.b.c.32/28" etc and jump to even more detailed chains.  Now you've=20
reduced your maximum from ~2000 tests to ~40.  (16+16+mainchain - .0 and=20
=2E255 only shorten two of these third-level chains)

Has removal of those rules increased the throughput, or just the CPU load=
=20
on the bridge?

j


