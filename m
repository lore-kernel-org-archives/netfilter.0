From: Data Shock <datashock@hotmail.com>
Subject: iptables - Trying to understand "no longer support implicit source
 local NAT"
Date: Thu, 19 Mar 2009 15:43:03 -0400
Message-ID: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org


Hello,

I
have been trying to understand a new error message I've been seeing
since I updated to a new version of Linux.  The message is:  "kernel:
NAT: no longer support implicit source local NAT".  It shows up once in
/var/log/messages, and on my console screen, when the offending rule is
used for the first time.

I've had a heck of a time trying to
find any information at all about this change.  I can't seem to find
any definitive post/thread about the reason for the change and what to
do about the message.  I've searched the mail archives, the
documentation, and googled for hours.

Here is my situation:

My
linux box has a finicky program (let's call it the "Sender") on it that
refuses to send to 127.0.0.1.  However, I have another program running
on that same box that needs to receive the UDP traffic from the
Sender.  We'll call that one the "Receiver".  These two programs must
reside on the same device.

So to get around this software quirk,
the Sender is configured with a bogus destination address.  I then have
the following iptables NAT rules to dnat the UDP packets to the local
address:

*nat
-A POSTROUTING -d 127.0.0.1 -p udp -m udp --dport 1234 -j SNAT --to-sou=
rce 127.0.0.1
-A OUTPUT -p udp -m udp --dport 1234 -j sendtolocal
-A sendtolocal -d 10.1.2.3 -j DNAT --to-destination 127.0.0.1


A few notes:
1)
The "sendtolocal" chain was made for ease of modifying the DNAT rule
programatically since the bogus address can change at any time.  (The
whole chain can be cleared and a new rule added in its place).
2) I am explicitly SNAT-ing the packet to 127.0.0.1 (it gets discarded =
otherwise)
3) The bogus address in this example is 10.1.2.3
4) The communication is one way, so the Sender does not expect replies =
from the Receiver.


This set up worked fine previously, and curiously, still seems to work =
fine despite the error message.

=46rom
what I've read, I'm guessing that iptables complains when the source
address of the original packet doesn't match the address that will be
used to route the packet to its new destination.  That's fine, but I'm
SNAT-ing it myself.  Is it really necessary to spit out a message like
that when no actual error occured?  I'm sure I'm missing something here=
=2E

So the questions are:
1) What the heck was the actual reason and impact of the change?
2) What can I do to stop the error message?
3) Am I actually doing anything wrong with my rules?

I sure hope someone can help me.


Many thanks,

=46rank
_________________________________________________________________
Windows Live=99 Contacts: Organize your contact list.=20
http://windowslive.com/connect/post/marcusatmicrosoft.spaces.live.com-B=
log-cns!503D1D86EBB2B53C!2285.entry?ocid=3DTXT_TAGLM_WL_UGC_Contacts_03=
2009