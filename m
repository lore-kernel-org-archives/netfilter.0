From: "SISINT BA" <INFO@SISINT.COM.AR>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Sun, 28 Nov 2010 22:20:56 -0300
Message-ID: <00a501cb8f63$acbf8d00$3202a8c0@p4w2000>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Secure-SIP-Server <info@secure-sip-server.net>, netfilter@vger.kernel.org

dear friends here again :

Sorry about misstyping.   the script name  well typed is

 FAIL2BAN .

 it's so easy to configure  and use ,  just a few steps to put it to wo=
rk.

need to define  a rule to detect  Fails in the  log file  ( ie   choose=
 what
log inspect  asterisk.log o, or syslog, or messages. and so on  )  for
looking  some reg expressions inside them  ( like " wrong password " , =
=2E. an
son on )   and to define   an action to take when an attack was detecte=
d (
ie add  iptables rule ) and Voil=E1!,  that is it!!.  That's all!!!.  y=
ou will
find examples there with the script

take a look here
http://www.voip-info.org/wiki/view/Fail2Ban+%28with+iptables%29+And+Ast=
erisk
 this may guide quickly  to setup on asterisk


This script  will  work fine with other services too,     vsftp, httpd,
SSH,  or any user log that you got
you can define how many fails will be assumed like attack and  how many=
 time
leave EACH  host banned ,
also can  send a mail to any address using the mta  to  NOTIFY EVENTS ,
included start and stop  the defense ,
this   so helpfull to larm when  rebooting,,,,,, power failrudes ,,,,


Believe me , You will find this script so  helpfull.
i really hope that this may help you too.

Join together  to keep bad people banned!!!!    :-)

Think about this :
This schema  keep in sight to detetct intruders a neturalize your actio=
n
quickly , and no matters  to dive into the nature of the networks. beca=
use
of for the thieves  it's more easy to steal any  people that don't have=
 any
"alarm"  that fight against  guys that were alerted and armed !!! and t=
hey
just  will leave us alone when they had seen that were dsicovered. .


Good luck, ....and ....... "That the force be with You!" .......or bett=
er
=2E...... with "Us"

marcos





----- Original Message -----
=46rom: "Secure-SIP-Server" <info@secure-sip-server.net>
To: <netfilter@vger.kernel.org>
Sent: Sunday, November 28, 2010 6:31 PM
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)


> @ Pascal Hambourg
>
> > > I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP p=
ort
> > > 5060,
> > > getting more then 70 REGISTER requests per second since yesterday=
=2E All
> > > comming from the Japanese IP 59.146.75.111:5088.
> > [...]
> > > How can this requests (UDP) be from a ESTABLISHED connection??? T=
hey
> > > passed
> > > the firewall in the first two examples and therefore they must be
> > > ESTABLISHED!?!
> >
> > UDP being connectionless by nature, the notion of "UDP connection" =
is
> > rather loose. Therefore a continuous flow of packets with the same =
ports
> > and addresses can be considered as one sigle connection even if the=
y are
> > actually unrelated requests.
>
> Yes, looks like. I discovered that this only happens if I add the FW-=
rule
> later then the first connection of the attacker to my SIP-server happ=
ened.
> When I install the rule to DROP this requests behind
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> I must reboot the server before it works. If I don't want to reboot I=
 must
> put the DROP rule before this rule.
>
> > > Is there a way to tell iptables to lock only a specific IP:PORT f=
or a
> > > while
> > > if this IP transmits more then 50 requests per second? If so, how=
?
> >
> > Check the "recent" match. Be sure you read carefully the man page a=
bout
> > its default limits.
>
> Thanks for this!!! But ...
> The author of "recent" writes:
> "If the '--update' rule is before this check for ! NEW,INVALID packet=
s
then
> ESTABLISHED connection or those in the process of becoming ESTABLISHE=
D
could
> be disrupted by a malicious person who can modify his/her source addr=
ess."
> So in his opinion my
> iptables -A INPUT -p udp --dport 5060 -m recent --update --seconds
> 1 --hitcount 20 -j DROP
> must come behind
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> and this leads me to the problem from above. This ACCEPT rule lets pa=
ss
all
> packages, because the first 19 packets in the first second are accept=
ed
and
> therefore the FW considers the continuous flow of packets with the sa=
me
port
> and address as a single connection - and let them pass here.
>
> Is there a way to tell the FW that this continuous flow of packets is=
 not
to
> be considered a ESTABLISHED connection?
>
>
> ----------
> @marcos
>
> > i had the same  trouble in the past , and beyond  the  rules for yo=
ur FW
> > on
> > itself there  is " other consideration"  to get on mind  , all peop=
le
that
> > are trying to steal  Voip   deploy you "brute force attack"  first
trying
> > with  few packets,  then  if they were not blocked , the real attac=
ks
> > begins
> > later .  because don't have any sense keep attack to a blocked serv=
er,
> > thay
> > are  bad no dummies . so  the speed with  you blocks  these tries a=
re so
> > critical and will defines to your  intruder how  effective is the
defense
> > that you have.
> >
> > So will be so helpfull install some script that inspect your logs t=
o
> > detect
> > the intrusion attack , i have very well result with   FAIL2BABN, [.=
=2E.]
>
> Thank you for this idea and your other considerations!!!
>
>
> Regards
>
> Detlef Pilzecker
> Weitlahnerstra=DFe 8
> D - 83209 Prien am Chiemsee
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

