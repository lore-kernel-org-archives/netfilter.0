From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Thu, 19 Sep 2002 22:55:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209192255.41959.netfilter@newkirk.us>
References: <20020919180021.80821.qmail@web40206.mail.yahoo.com> <20020919193311.UPJU287.mta02-svc.ntlworld.com@there>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919193311.UPJU287.mta02-svc.ntlworld.com@there>
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
To: netfilter@lists.samba.org

On Thursday 19 September 2002 03:33 pm, Antony Stone wrote:
> On Thursday 19 September 2002 7:00 pm, Alok Shukla wrote:
> > Let me say if i am able to sort out the lab in the
> > accordance that i start my ip settings of lab2
> >  like 192.168.9.1-63 for lab 1
> >
> > and next 64 for lab 2 , would that help and how ?
>
> I think it would help a lot, yes.   I would recommend putting machines =
into
> three groups:
> 1. User machines in Lab1
> 2. User machines in Lab2
> 3. System machines such as servers, routers, etc.
>
> Separate the IP addresses for each of these three groups so that you ca=
n
> specify a single group with an easy netmask.

[snip excellent mask explanation, insert quick'n'dirty script excerpts]

# define convenient symbols for the IPTables rules
#
IPTABLES=3D/sbin/iptables
# everything from 0.0 to 0.63 is administrator territory
SERVERS=3D"192.168.0.0/26"
# Lab 1 from 0.64 to 0.127
LAB1=3D"192.168.0.64/26"
#Lab2 from 0.128 to 0.191
LAB2=3D"192.168.0.128/26"
#0.192 to 0.255 unassigned for now
FUTUREEXPANSION=3D"192.168.0.192/26"
#
$IPTABLES -t nat -A POSTROUTING -s $LAB1 -j MASQUERADE
# et cetera

The four address ranges can of course be used in any order, this one mean=
s reconfiguring 54 machines, changing the server addresses would mean rec=
onfiguring all machines.  (Of course, you'll use student labor anyway... =
;^)

You can also create simple scripts to run either manually or on schedule,=
 that do nothing but -A(dd) and -D(elete) the rule for a given lab's addr=
ess range.
like:

#!/bin/sh
# lab1off
/sbin/iptables -t nat -D -s 192.168.0.64/26 -j MASQUERADE



