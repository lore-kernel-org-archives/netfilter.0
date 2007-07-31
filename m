From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: blocking access to port 22 when INPUT policy is ACCEPT
Date: Wed, 1 Aug 2007 00:18:34 +0200
Message-ID: <20070731221833.GA589@outback.rfc2324.org>
References: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>
	<b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Wednesday, den  1 August hub Maxim Veksler folgendes in die Tasten:

Hi!

> I have my machine configured to allow all traffic in INPUT table, but
> I would like to block access to port tcp22 from all besides several
> ip's.

> The following rules as the basic of what I'm trying to achieve:
 
> /sbin/iptables -A INPUT -s ! a.b.c.d/29 -p tcp --dport 22 -j DROP
> /sbin/iptables -A INPUT -s ! e.f.g.h -p tcp --dport 22 -j DROP

> How can I do a "AND" between them as in
>  if (-s ! a.b.c.d/29 AND -s ! e.f.g.h) then -j DROP ?

You can't.

But what's wrong with the two rules?

What you could do if you like is to pass every connection to port 22
to a subchain like this:

iptables -N filter_ssh_access
iptables -A INPUT -p tcp --dport 22 -j filter_ssh_access

iptables -A filter_ssh_access -s ! a.b.c.d/29 -j REJECT --reject-with icmp-admin-prohibited
iptables -A filter_ssh_access -s ! e.f.g.h -j REJECT --reject-with icmp-admin-prohibited

You might have noticed that I've changed the "DROP" to "REJECT" with
fitting type which will make the live of you and other people easier
when debugging anything related to ssh access to this box.

HTH
Ciao
Max
-- 
	Follow the white penguin.

