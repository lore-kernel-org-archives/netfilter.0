From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: iptables - Trying to understand "no longer support implicit source
 local NAT"
Date: Mon, 06 Apr 2009 12:41:34 -0700
Message-ID: <49DA5AEE.5010902@mailinator.com>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl> <49C2A535.1040700@kis.keele.ac.uk>    <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>   <BLU149-W19F71A94268C5665748337A3910@phx.gbl>  <BLU149-W50503F474EE1377D0A838A3840@phx.gbl> <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Data Shock <datashock@hotmail.com>
Cc: netfilter@vger.kernel.org

Data Shock wrote:
>> * bump *
>>
>> There must be someone out there who knows why this message is writte=
n out. Have I sent this inquiry to the correct list? Should I send this=
 to the devel list instead?
>>
>> Perhaps I should submit this as a bug.
> =20
> =20
> My apologies.  It would appear that I either goofed my e-mail somehow=
 or threads don't survive the transition from one month to the next (th=
is question is 2.5 weeks old now).
> =20
> Here is the content of my original question:
> =20
> =20
> -----
> List:       netfilter
> Subject:    iptables - Trying to understand "no longer support implic=
it source
> From:       Data Shock=20
> Date:       2009-03-19 19:43:03
> Message-ID: BLU149-W20F12BA9B98E9D4E82C7CBA3960 () phx ! gbl
> -----
> =20
> Hello,
> =20
> I have been trying to understand a new error message I've been seeing
> since I updated to a new version of Linux.  The message is:  "kernel:
> NAT: no longer support implicit source local NAT".  It shows up once =
in
> /var/log/messages, and on my console screen, when the offending rule =
is
> used for the first time.
> =20
> I've had a heck of a time trying to
> find any information at all about this change.  I can't seem to find
> any definitive post/thread about the reason for the change and what t=
o
> do about the message.  I've searched the mail archives, the
> documentation, and googled for hours.
> =20
> Here is my situation:
> =20
> My linux box has a finicky program (let's call it the "Sender") on it=
 that
> refuses to send to 127.0.0.1.  However, I have another program runnin=
g
> on that same box that needs to receive the UDP traffic from the
> Sender.  We'll call that one the "Receiver".  These two programs must
> reside on the same device.
> =20
> So to get around this software quirk,
> the Sender is configured with a bogus destination address.  I then ha=
ve
> the following iptables NAT rules to dnat the UDP packets to the local
> address:
> =20
> *nat
> -A POSTROUTING -d 127.0.0.1 -p udp -m udp --dport 1234 -j SNAT --to-s=
ource 127.0.0.1
> -A OUTPUT -p udp -m udp --dport 1234 -j sendtolocal
> -A sendtolocal -d 10.1.2.3 -j DNAT --to-destination 127.0.0.1
>

Hi Frank,

I'm not certain about the meaning of "implicit source local NAT" but th=
e=20
second rule may be the culprit.  Rather than imply 127.1 perhaps the=20
rule needs to specifically mention the source IP:  e.g.

-A OUTPUT -s 127.0.0.1 -p udp -mudp --dport 1234 -j sendtolocal

Out of curiosity, does the following work and not produce an error?

*nat
-A PREROUTING -p udp --dport 1234 -j DNAT --to-destination 127.0.0.1
-A POSTROUTING -p udp --sport 1234 -j SNAT --to-source 10.1.2.3

Please reply on list.  My subscribed email address is a throw-away.

:m)

> =20
> A few notes:
> 1) The "sendtolocal" chain was made for ease of modifying the DNAT ru=
le
> programatically since the bogus address can change at any time.  (The
> whole chain can be cleared and a new rule added in its place).
> 2) I am explicitly SNAT-ing the packet to 127.0.0.1 (it gets discarde=
d otherwise)
> 3) The bogus address in this example is 10.1.2.3
> 4) The communication is one way, so the Sender does not expect replie=
s from the Receiver.
> =20
> =20
> This set up worked fine previously, and curiously, still seems to wor=
k fine despite the error message.
> =20
>>From what I've read, I'm guessing that iptables complains when the so=
urce
> address of the original packet doesn't match the address that will be
> used to route the packet to its new destination.  That's fine, but I'=
m
> SNAT-ing it myself.  Is it really necessary to spit out a message lik=
e
> that when no actual error occured?  I'm sure I'm missing something he=
re.
> =20
> So the questions are:
> 1) What the heck was the actual reason and impact of the change?
> 2) What can I do to stop the error message?
> 3) Am I actually doing anything wrong with my rules?
> =20
> I sure hope someone can help me.
> =20
> =20
> Many thanks,
> =20
> Frank
> _________________________________________________________________
> Rediscover Hotmail=AE: Now available on your iPhone or BlackBerry
> http://windowslive.com/RediscoverHotmail?ocid=3DTXT_TAGLM_WL_HM_Redis=
cover_Mobile1_042009--
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

