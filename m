From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: lifecycle of a packet
Date: Thu, 9 Jan 2003 19:47:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301091947.09864.netfilter@newkirk.us>
References: <1042152892.3e1dfdbc6f5d1@webmail.enfusion-group.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042152892.3e1dfdbc6f5d1@webmail.enfusion-group.com>
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
To: Tony Clayton <tony-netfilter@enfusion-group.com>, netfilter@lists.netfilter.org

On Thursday 09 January 2003 05:54 pm, Tony Clayton wrote:
> I've been reading the various docs linked to from netfilter.org,
> hoping to figure out the exact order in which a packet traverses the
> various tables and chains as it passes through the network stack.
>
> Unfortunately, I couldn't find a definative resource that contained
> this information, so I decided to figure it out myself.

Oskar's tutorial at http://iptables-tutorial.frozentux.net covers it=20
pretty nicely, although his main diagrams and tables don't clarify the=20
single-hit nature of the NAT chains.  (he covers this elsewhere)

> I build a quick script to insert LOG rules into every chain of every
> table, so that I could log the order in which the tables and chains
> are traversed.

That's the best solution anyway.  Until you do it yourself you can't=20
/really/ know it, and IIRC some earlier versions traversals were=20
slightly different.  (All through my childhood my mom had a sign in one=20
room "I hear and I forget, I see and I remember, I do and I understand"=20
which seems pretty accurate usually :^)

> Here are my findings, using the three test cases below:

[snipped]

> This is quite interesting, and not at all what I was expecting based
> on what I'd read.

One you missed, which threw me when I first discovered it:  Firewall box=20
to itself.  This one bypasses nat PREROUTING entirely...  I guess since=20
it's inbound on interface lo then there is only one rational destination=20
anyway, so that chain would be pretty much useless.  If you want to DNAT=20
a localhost connection you do it in nat OUTPUT.

> I have a list of questions about this behaviour, keeping in mind that
> I'm fairly new to iptables/netfilter:
>
> 1. Why does only the first packet for a TCP/IP connection seem to pass
> through the nat table?  Does connection tracking take over if the
> packet is (ESTABLISHED,RELATED) and work some magic under the covers?

Precisely, plus some.  Even if you don't have an 'EST/REL' rule,=20
conntrack's still there under the hood.  (check "lsmod | grep ip" and=20
you'll see that ip_conntrack is a dependancy for iptable_nat)  This is=20
how netfilter knows that return traffic IS return traffic, and what IP=20
to forward it back to when unSNATting packets.

> 2. Why do both OUTPUT and POSTROUTING chains get traversed for packets
> that the firewall sends out?  Is this useful at all?

As an example, you can DNAT in nat OUTPUT, (but not POSTROUTING - the=20
routing decision has already been made) to allow you to change=20
destination without the local process knowing or needing to know.  You=20
can SNAT in nat POSTROUTING but not OUTPUT.  You can change TTL in=20
mangle POSTROUTING for all packets, whether OUTPUT or FORWARD fed them=20
in, so that for example they are all the same, (a few ISP's apparently=20
look for differing TTL's when policing for 'hidden' machines that they=20
want to charge connection fees for) and you can change TOS or mark in=20
mangle OUTPUT so that routing can be based on those, which again has=20
already been decided before the packet reaches any POSTROUTING chains.

> 3. Most of the documents I looked at were fairly old.  Is there a
> somewhat recent document that perhaps might benefit from including
> these tests?

Oskar Andreasson's tutorial is updated and tweaked frequently, I believe=20
he announced the latest update on this list Dec 19.  The only references=20
I've EVER used for iptables are his tutorial and the main documentation. =
=20
He also recommends setting up log rules the way you did to double-check=20
that traversal works the way you believe it does.

> thanks,
>
> Tony

j


