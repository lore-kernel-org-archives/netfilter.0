From: Data Shock <datashock@hotmail.com>
Subject: RE: iptables - Trying to understand "no longer support implicit
 source local NAT"
Date: Mon, 6 Apr 2009 14:58:08 -0400
Message-ID: <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
 <49C2A535.1040700@kis.keele.ac.uk> 
   <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl> 
  <BLU149-W19F71A94268C5665748337A3910@phx.gbl> 
 <BLU149-W50503F474EE1377D0A838A3840@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W50503F474EE1377D0A838A3840@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


> * bump *
>
> There must be someone out there who knows why this message is written=
 out. Have I sent this inquiry to the correct list? Should I send this =
to the devel list instead?
>
> Perhaps I should submit this as a bug.
=20
=20
My apologies.  It would appear that I either goofed my e-mail somehow o=
r threads don't survive the transition from one month to the next (this=
 question is 2.5 weeks old now).
=20
Here is the content of my original question:
=20
=20
-----
List:       netfilter
Subject:    iptables - Trying to understand "no longer support implicit=
 source
=46rom:       Data Shock=20
Date:       2009-03-19 19:43:03
Message-ID: BLU149-W20F12BA9B98E9D4E82C7CBA3960 () phx ! gbl
-----
=20
Hello,
=20
I have been trying to understand a new error message I've been seeing
since I updated to a new version of Linux.  The message is:  "kernel:
NAT: no longer support implicit source local NAT".  It shows up once in
/var/log/messages, and on my console screen, when the offending rule is
used for the first time.
=20
I've had a heck of a time trying to
find any information at all about this change.  I can't seem to find
any definitive post/thread about the reason for the change and what to
do about the message.  I've searched the mail archives, the
documentation, and googled for hours.
=20
Here is my situation:
=20
My linux box has a finicky program (let's call it the "Sender") on it t=
hat
refuses to send to 127.0.0.1.  However, I have another program running
on that same box that needs to receive the UDP traffic from the
Sender.  We'll call that one the "Receiver".  These two programs must
reside on the same device.
=20
So to get around this software quirk,
the Sender is configured with a bogus destination address.  I then have
the following iptables NAT rules to dnat the UDP packets to the local
address:
=20
*nat
-A POSTROUTING -d 127.0.0.1 -p udp -m udp --dport 1234 -j SNAT --to-sou=
rce 127.0.0.1
-A OUTPUT -p udp -m udp --dport 1234 -j sendtolocal
-A sendtolocal -d 10.1.2.3 -j DNAT --to-destination 127.0.0.1
=20
=20
A few notes:
1) The "sendtolocal" chain was made for ease of modifying the DNAT rule
programatically since the bogus address can change at any time.  (The
whole chain can be cleared and a new rule added in its place).
2) I am explicitly SNAT-ing the packet to 127.0.0.1 (it gets discarded =
otherwise)
3) The bogus address in this example is 10.1.2.3
4) The communication is one way, so the Sender does not expect replies =
from the Receiver.
=20
=20
This set up worked fine previously, and curiously, still seems to work =
fine despite the error message.
=20
=46rom what I've read, I'm guessing that iptables complains when the so=
urce
address of the original packet doesn't match the address that will be
used to route the packet to its new destination.  That's fine, but I'm
SNAT-ing it myself.  Is it really necessary to spit out a message like
that when no actual error occured?  I'm sure I'm missing something here=
=2E
=20
So the questions are:
1) What the heck was the actual reason and impact of the change?
2) What can I do to stop the error message?
3) Am I actually doing anything wrong with my rules?
=20
I sure hope someone can help me.
=20
=20
Many thanks,
=20
=46rank
_________________________________________________________________
Rediscover Hotmail=AE: Now available on your iPhone or BlackBerry
http://windowslive.com/RediscoverHotmail?ocid=3DTXT_TAGLM_WL_HM_Redisco=
ver_Mobile1_042009