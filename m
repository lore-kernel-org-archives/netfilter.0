From: ulmo@sonic.net
Subject: Re: How to route per process?
Date: Sun, 21 Jun 2009 11:37:02 -0700 (PDT)
Message-ID: <d60b94da34ce14b486a17d961ed5039d.squirrel@webmail.sonic.net>
References: <3cda010470e818a0d5c1c025716ded6e.squirrel@webmail.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3cda010470e818a0d5c1c025716ded6e.squirrel@webmail.sonic.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@vger.kernel.org, ulmo@sonic.net

Correction:

I wrote:

> How do I route per process?  I found
> <http://blog.sebastien.raveau.name/2009/04/per-process-routing.html>, but
> when the packets come back, the local process gets them.
                                                ^^^^^^^^^

I was tired (I tried for a long time before coming here).  This is what I
MEANT to write:

"but when the packets come back, the local process DOES NOT get them."

I continued:

> I think the
> problem is that "netstat -an" shows the packets in the hostwide default
> address, but the packets coming back are for the correct new [IP] #.

Ok, in case that isn't clear, let me repeat:  the packets go out on the
alternate interface with that interface's proper address as source
address, but when the remote side responds, those response packets, with
the correct "to" ip# of the alternate interface get to the alternate
interface just fine (as shown by tcpdump on the target machine and
interface), but then the process never gets them.  "netstat -an" for a
sample tcp connection attempt shows the local address as the non-alternate
interface, i.e., the main default interface.  I think the problem is
there.  I tried a lot of things to get around that, but haven't found
anything.  Has anybody figured this out?

>
> I've tried a bunch of things, but none of them work.  How do I further
> diagnose this, and does anybody know how to do it?
>
> The goal is analagous to getting a second computer and running the process
> in that computer with a seperate interface as desired, but the difference
> between the analogy and what I'm trying to accomplish is sans the actual
> second computer:  i.e., to do it virtually.  I definately do not want to
> use vmware, since there are all sorts of overhead inefficiencies with
> that.
>
> The software in question has the capability to bind to specified
> addresses, but not to send packets out over specified interfaces, which is
> necessary.
>
> Here's a copy of the script I have run which doesn't work (numbers
> anonymized):
>
> dev=eth3
> ifaceaddr=$(ip a s dev $dev |egrep 75|sed -e 's%.* inet \([^/]*\)/.*%\1%')
> if [ "$ifaceaddr" = "" ];then ifaceaddr=75.1.2.3;fi
> gw=75.1.1.1
>
> iptables -t mangle -A OUTPUT -m owner --uid-owner asterisk -j MARK
> --set-mark 42 &&
> iptables -t nat -A POSTROUTING -o $dev -m mark --mark 42 -j SNAT
> --to-source $ifaceaddr &&
> ip rule add fwmark 42 table 42 &&
> ip route add default via $gw dev $dev table 42
>
> To wit, all the above works, except that when the packets come back, the
> process in question doesn't receive them.  tcpdump shows everything
> working as desired up to that point:  the packets go out, they get
> responses which come back.  The disconnect is somewhere between the return
> packets coming back and them being put into the process's connection as
> desired inside the OS, I'm pretty sure.  tcpdump is being run in the local
> machine on the interface in question (eth3), so yes, "coming back" means
> it reaches the right computer and gets inside it to the point tcpdump sees
> it clear as day, with the destination address = the source address, as
> modified to use that interface, obviously (else how would it get there).
>
> Debugging tools desired could be to see what SNAT is doing to the return
> packets, and/or to see what packet to process debugging could be done.  I
> don't know about those types of tools.
>


