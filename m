From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: real-time monitor question
Date: Tue, 5 Aug 2003 11:44:26 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192DB@wardrive.citadelcomputer.com.au>
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
To: "Jeffrey D. Brower" <jeff@pointhere.net>
Cc: netfilter@lists.netfilter.org

Why not put all DROP rules into a -N DROPFILTER chain and then all DROP =
rules created jump to this table.
This way it's easier to get a view of any changes.

Then what you'd have to do is write a simple program which talks to your =
parallel port and lists the DROPFILTER chain and compares it's values to =
the previous set of values gathered and do something when it sees a =
change. easier said than done but if it's not too critical for time =
(every second it checks for changes) then it's possible even with =
scripting.

C++ code is best for this as it's smaller and faster than say running a =
PHP script like I do at the moment to create my MRTG graphs based on =
what rules have as a byte count..
eg.
Title[smtp-link]: Traffic Analysis for Incomming SMTP
Target[smtp-link]: `/bin/mysql-iptables.php --ifin eth1 --prot tcp =
--dport 25;/bin/mysql-iptables.php --ifout eth1 --prot tcp --dport 25`

This is getting off topic really as it's not really an iptables problem =
as such..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Jeffrey D. Brower [mailto:jeff@pointhere.net]
Sent: Tuesday, August 05, 2003 11:32 AM
To: George Vieira
Cc: netfilter@lists.netfilter.org
Subject: Re: real-time monitor question


Hi George!

Right now I would be happy if I could just make the led blink when a =
packet
is ACCEPTed or DENYed!    ;-)

Seriously, thinking about it in those terms, if I knew once every second =
(or
some fraction of a second preferably) that X packets were allowed and Y
packets were denied on interface Z I could then "semi-real-time" fake it =
to
the interface with the same results over the period.   I am not really
interested in the number of bytes (right now) just in packets.  I was
thinking 100% real-time originally, but I am concerned about the =
overhead
that would introduce.  If I could get to 100% real-time, it would be =
great -
but your question makes me reconsider if that is even reasonable (or any
more valuable, actually).

    Jeff

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Jeffrey D. Brower" <jeff@pointhere.net>
Sent: Monday, August 04, 2003 5:59 PM
Subject: RE: real-time monitor question


> what kind of output did you expect? bytes dropped, packets
dropped,etc.etc..?
>
> Does it matter if it's 100% realtime or read the data every
second..etc.etc..?
>
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>
>
> -----Original Message-----
> From: Jeffrey D. Brower [mailto:jeff@pointhere.net]
> Sent: Tuesday, August 05, 2003 3:31 AM
> To: netfilter@lists.netfilter.org
> Subject: real-time monitor question
>
>
> Greetings All,
>
> I need to get something that I think is probably quite simple from the
> firewall - but I don't have a clue how to exactly accomplish this.  If =
you
> can help, please do!
>
> I have a circuit board (hooked up to a box running netfilter/iptables)
which
> counts and displays the data sent to it via the parallel port.  The =
object
> is to display, in real-time, the packets on each interface that are
accepted
> and denied on a packet by packet basis.
>
> I trust netfilter and I don't want to interfere with its operation in =
any
> way and try to duplicate it's logic anywhere and it looks like the
userspace
> options might force me to do this to get what I need, but I don't =
really
> know if it will or even if this is an option.  I am not eager to =
actually
> queue packets myself - since I am sure to not be nearly as efficient.
>
> I found a gnumonks.org project called ulogd that seems like it _could_ =
be
a
> solution for me but I know nothing about it, including if I can get =
ACCEPT
> and DENY, by interface, by packet, buffered from it.
>
> It seemed to me that I can jump to tables for ACCEPT1 - ACCEPTn and =
the
same
> for DENY1 - DENYn for each of the interfaces and use the log function =
in
> some way - but using the log for each packet seems nightmarish to me.
>
> It occurs to me that there might be something I can do with the /proc
files.
>
> It also seems to me that any program I write that gets the info from =
the
> firewall might have to do a sleep to await the logic in the board to
process
> and so I might have to buffer the information from the firewall to =
avoid
> slowing it down or do some kind of round-robin sort of stack as long =
as
the
> stack is larger than the potential input flood.  It may be that I do =
not
> need to actually keep track of every single solitary ACCEPT but I =
surely
> need every DENY.
>
> I learn best by example, and I can not find any examples of this
anywhere -
> but I know people do monitoring.  I have been in the Docs and I have
looked
> in the archives of this list (but they are not searchable).  If you =
can
help
> me understand what I need to do - please help!
>
>
>      Jeff
>


