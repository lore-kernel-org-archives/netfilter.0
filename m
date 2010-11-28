From: "Secure-SIP-Server" <info@secure-sip-server.net>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Sun, 28 Nov 2010 22:31:24 +0100
Message-ID: <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org

@ Pascal Hambourg

> > I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP por=
t
> > 5060,
> > getting more then 70 REGISTER requests per second since yesterday. =
All
> > comming from the Japanese IP 59.146.75.111:5088.
> [...]
> > How can this requests (UDP) be from a ESTABLISHED connection??? The=
y
> > passed
> > the firewall in the first two examples and therefore they must be
> > ESTABLISHED!?!
>
> UDP being connectionless by nature, the notion of "UDP connection" is
> rather loose. Therefore a continuous flow of packets with the same po=
rts
> and addresses can be considered as one sigle connection even if they =
are
> actually unrelated requests.

Yes, looks like. I discovered that this only happens if I add the FW-ru=
le
later then the first connection of the attacker to my SIP-server happen=
ed.
When I install the rule to DROP this requests behind
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
I must reboot the server before it works. If I don't want to reboot I m=
ust
put the DROP rule before this rule.

> > Is there a way to tell iptables to lock only a specific IP:PORT for=
 a
> > while
> > if this IP transmits more then 50 requests per second? If so, how?
>
> Check the "recent" match. Be sure you read carefully the man page abo=
ut
> its default limits.

Thanks for this!!! But ...
The author of "recent" writes:
"If the '--update' rule is before this check for ! NEW,INVALID packets =
then
ESTABLISHED connection or those in the process of becoming ESTABLISHED =
could
be disrupted by a malicious person who can modify his/her source addres=
s."
So in his opinion my
iptables -A INPUT -p udp --dport 5060 -m recent --update --seconds
1 --hitcount 20 -j DROP
must come behind
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
and this leads me to the problem from above. This ACCEPT rule lets pass=
 all
packages, because the first 19 packets in the first second are accepted=
 and
therefore the FW considers the continuous flow of packets with the same=
 port
and address as a single connection - and let them pass here.

Is there a way to tell the FW that this continuous flow of packets is n=
ot to
be considered a ESTABLISHED connection?


----------
@marcos

> i had the same  trouble in the past , and beyond  the  rules for your=
 FW
> on
> itself there  is " other consideration"  to get on mind  , all people=
 that
> are trying to steal  Voip   deploy you "brute force attack"  first tr=
ying
> with  few packets,  then  if they were not blocked , the real attacks
> begins
> later .  because don't have any sense keep attack to a blocked server=
,
> thay
> are  bad no dummies . so  the speed with  you blocks  these tries are=
 so
> critical and will defines to your  intruder how  effective is the def=
ense
> that you have.
>
> So will be so helpfull install some script that inspect your logs to
> detect
> the intrusion attack , i have very well result with   FAIL2BABN, [...=
]

Thank you for this idea and your other considerations!!!


Regards

Detlef Pilzecker
Weitlahnerstra=DFe 8
D - 83209 Prien am Chiemsee

