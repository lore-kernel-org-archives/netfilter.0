From: Steve Mickeler <steve@warning.ca>
Subject: SNAT interfering with source IP of a DNAT
Date: Tue, 4 Mar 2003 21:18:01 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303042109030.29516@gypsy>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I've been beating my head against the table for the past couple of hours
trying to get this working properly.

I'm doing a PREROUTING DNAT that will send any traffic destined to
10.10.10.8 and DNAT it to 192.168.32.12

The DNAT works, but what keeps happening is the POSTROUTING rules further
down the chain is changing the source IP to 192.168.32.6 instead of
retaining the original source IP.

What I need is the POSTROUTING SNAT rule to -ONLY- take place when an
attempt to access 192.168.32.12 is established from anything else except
the PREROUTING DNAT.

here are the 2 PREROUTING and POSTROUTING entries:

$IPT -t nat -A PREROUTING -d 10.10.10.8 -j DNAT --to 192.168.32.12

...skip a bunch of other rules.

$IPT -t nat -A POSTROUTING -s 172.17.0.0/19 -d 192.168.32.0/24 -j SNAT
--to-source 192.168.32.6

Right now, when I ssh to 10.10.10.8 it changes my source IP to
192.168.32.6 because I'm coming from 172.17.3.24, but I'd like to avoid
that unless I'm ssh'ing to 192.168.32.12 directly.

The easiest thing to do would be to avoid the POSTROUTING SNAT but its a
requirement I have to make sure anything going to 192.168.32.0/24 gets
nat'ed to 192.168.32.6

Any ideas of how to get around this ?

Thanks.


