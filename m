From: "david" <david@aid.inf.cu>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 16:44:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <024901c22432$8885a5a0$8703000a@aid.inf.cu>
References: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com> <20020705191417.UWDG4119.mta06-svc.ntlworld.com@there> <020c01c2242b$8c9565b0$8703000a@aid.inf.cu> <20020705201118.DFBE4626.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Tony:

When I write these rules in the command line all is OK and  the rules works
fine.
But if I put the same rules in a script :

#!/bin/bash
# Standard default policies
iptables -P INPUT DROP


iptables -P FORWARD DROP
iptables -P OUTPUT DROP

I got these errors

iptables :Bad police name
iptables :Bad police name
iptables :Bad police name


Then what?

david

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Friday, July 05, 2002 10:11 PM
Subject: Re: I need help , please


> On Friday 05 July 2002 2:54 pm, david wrote:
>
> > Yes Antony ,but I do not know what to do with these rules
>
> Simple.   Put them in a script, on their own, and run it.   See if it does
> what you want.
>
> > .I put these in the
> > /etc/rc.d/init.d/iptables script , in  the start section of the script
and
> > then what i do is :
> >
> > service iptables save
> > /etc/rc.d/init.d/iptables restart
>
> I cannot comment on this because I don't do that on my system.   Why do
you
> do that on yours ?
>
> > and I got all those errors message.
> >
> > Maybe I am doing something wrong with putting these rules in the script.
>
> Is there something else in the script which could be causing the problems
?
>
>
>
> Antony.


