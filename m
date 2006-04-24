From: "Toby DiPasquale" <codeslinger@gmail.com>
Subject: Re: one rule to create per IP connlimits?
Date: Mon, 24 Apr 2006 09:20:31 -0400
Message-ID: <876ef97a0604240620y66c868bfk6fc51c8e03704882@mail.gmail.com>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
	<006201c665f5$00205670$0e01050a@CyberAdmin>
	<876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
	<444C2CBC.7010804@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444C2CBC.7010804@gmx.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc: robee <mlody@elpec.com>, netfilter@lists.netfilter.org

On 4/23/06, Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net> wrot=
e:
> Do you have any plans to change that?

OK, so apparently I was wrong. I just checked the source code and this
is fact what connlimit does now. It keeps a hash of conntrack entries
and counts them up when it gets fired. Therefore, the original rule
proposed by robee would in fact work as rabbtux thought:

iptables -A FORWARD -p tcp --syn -s 10.10.2.96/27 -m connlimit
--connlimit-above 20 -j REJECT

What this is really saying is: If the IP is between 10.10.2.97 and
10.10.2.126 and we find more than 20 connections from this IP right
now in our internal table, jump to the REJECT target.

You can specify the --connlimit-mask option to tell it to limit based
on something more than a /32, but if you don't specify, /32 is the
default. The rule should still probably be used with "-j REJECT
--reject-with tcp-reset", though.

Here's the information on the usage of the rule from netfilter.org:

<snip>
This adds an iptables match which allows you to restrict the
number of parallel TCP connections to a server per client IP address
(or address block).

Examples:

# allow 2 telnet connections per client host
iptables -p tcp --syn --dport 23 -m connlimit --connlimit-above 2 -j REJECT

# you can also match the other way around:
iptables -p tcp --syn --dport 23 -m connlimit ! --connlimit-above 2 -j ACCE=
PT

# limit the nr of parallel http requests to 16 per class C sized
# network (24 bit netmask)
iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 16 \
=09--connlimit-mask 24 -j REJECT
</snip>

> I'd like a combination of hashlimit and connlimit which also works
> for UDP so I can limit the number of simultaneous connections per
> IP to avoid overflowing the conntrack table of upstream firewalls.

connlimit was designed with TCP in mind and will refuse to be loaded
with anything other than -p tcp. This is because it wants to make sure
you're using --syn to only operate on the first packet of a
connection, and also b/c it will dump some conntrack entries in its
hashtable if the TCP state indicates that the connection is
terminated.

As well, I'm not so sure the combination of the two would be a good
idea. I think you'd want the connlimit rules fronting for the
hashlimit rules. Having both in one module makes changes to the
ruleset more coarse-grained, which could potentially lead to requiring
bigger changes to do what you want to do later on down the road.

Sorry about my initial confusion on this whole thing: I was thinking
of a different, older *limit rule.

--
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d

