From: "webmaster" <webmaster@lagente.com>
Subject: Iptables - Port forwarding - extremely baffled.
Date: Wed, 30 Apr 2003 16:41:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c30f69$b3ba0040$c900a8c0@yourfather.shore.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

I have setup 2 DSL outgoing connections for my LAN. I split the traffic
according form the source IP.
My network setup is
                                                ---------dsl1
xxx.xxx.xxx.xxx
192.168.0.0/24 LAN------
                                                ---------dsl2
yyy.yyy.yyy.yyy
My rules are
iptables -t nat -A POSTROUTING -s 192.168.0.128/25 -d 0/0 -j SNAT --to
xxx.xxx.xxx.xxx
iptables -t nat -A POSTROUTING -s 192.168.0.128/25 -d 0/0 -j SNAT --to
yyy.yyy.yyy.yyy
My default gateway is xxx.xxx.xxx.xxx
The nat rule that uses my default gateway has no problem.
How can I set a route rule to send the traffic form yyy.yyy.yyy.yyy out, =
or
I don=92t know if I=92m using the incorrect iptable command. Sorry I=92m =
a newbie

>Today's Topics:
>
>   1. iprange match processing overhead (John A. Sullivan III)
>   2. limit match log question (Frank Smith)
>   3. Re: Netfilter and SCTP (Maciej Soltysiak)
>   4. Re: Re[4]: access to server (Alistair Tonner)
>   5. Re: limit match log question (Maciej Soltysiak)
>   6. Re: limit match log question (Frank Smith)
>   7. Can anyone please review the following rules and comment on them ?
(Moti Levy)
>   8. Ipables memory footprint (Paul Albert)
>   9. Re[6]: access to server (netfilter_user)
>  10. Re: Re[6]: access to server (Alistair Tonner)
>  11. Iptables - Port forwarding - extremely baffled. (Paul)
>  12. Communication redirect (Sapient2003)
>  13. RE: Local rule for Port Forward (Patrick Nelson)
>
>--__--__--
>
>Message: 1
>Subject: iprange match processing overhead
>From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
>To: netfilter@lists.netfilter.org
>Organization:
>Date: 30 Apr 2003 10:46:42 -0400
>
>We've done some initial testing of the iprange patch and are thrilled
>with it.  However, is it any more processing intensive to use an iprange
>match than to use the standard source or destination match, i.e., -s
>rather than -m iprange --iprange --src/dst-range? Thanks- John
>--
>John A. Sullivan III
>Chief Technology Officer
>Nexus Management
>+1 207-985-7880
>john.sullivan@nexusmgmt.com
>---
>If you are interested in helping to develop a GPL enterprise class
>VPN/Firewall/Security device management console, please visit
>http://iscs.sourceforge.net
>
>
>
>--__--__--
>
>Message: 2
>Date: Wed, 30 Apr 2003 09:52:18 -0500
>From: Frank Smith <fsmith@hoovers.com>
>To: Netfilter <netfilter@lists.netfilter.org>
>Subject: limit match log question
>
>If you are using the limit match to control the number of log entries, i=
s
>there any way to also show the number of matches?  Something like syslog=
's
>ability to combine repeated events into 'last message repeated 2318 time=
s'.
>   For example, if I limit logging of a match to 1 per 5 seconds to avoi=
d
>log flooding, I can't easily tell if I'm dropping 1 packet per 5 seconds
>or 1000.  Or is there some option or patch to do this that I just haven'=
t
>noticed?
>
>Frank
>
>
>--
>Frank Smith                                             fsmith@hoovers.c=
om
>Systems Administrator                                  Voice: 512-374-46=
73
>Hoover's Online                                          Fax: 512-374-45=
01
>
>
>--__--__--
>
>Message: 3
>Date: Wed, 30 Apr 2003 17:12:02 +0200 (CEST)
>From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
>To: Ray Leach <raymondl@knowledgefactory.co.za>
>Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>
>Subject: Re: Netfilter and SCTP
>
>Hi,
>
>> Isn't SCTP just a sub-protocol of TCP/IP?
>Well, i do not know about SCTP, but if the SCTP protocol stores
>IP/port information inside the packet (like eg. FTP PORT), then
>this information has to be rewritten by a clever conntrack module.
>
>I have to read on SCTP, i do not even know what is it for :-D
>
>Regards,
>Maciej Soltysiak
>
>
>
>--__--__--
>
>Message: 4
>From: Alistair Tonner <Alistair@nerdnet.ca>
>Reply-To: Alistair@nerdnet.ca
>To: netfilter_user <netfilter_user@o2.pl>, Arnt Karlsen <arnt@c2i.net>
>Subject: Re: Re[4]: access to server
>Date: Wed, 30 Apr 2003 10:59:48 -0400
>Cc: netfilter@lists.netfilter.org
>
>On April 30, 2003 09:32 am, netfilter_user wrote:
>> Hello Arnt,
>>
>> Wednesday, April 30, 2003, 4:47:45 AM, you wrote:
>>
>> AK> On Wed, 30 Apr 2003 03:38:12 +0200,
>> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>>
>> AK> <1246491441.20030430033812@o2.pl>:
>> >> Hello Arnt,
>> >>
>> >> Wednesday, April 30, 2003, 3:10:30 AM, you wrote:
>> >>
>> >> AK> On Wed, 30 Apr 2003 00:49:31 +0200,
>> >> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>> >>
>> >> AK> <5436369716.20030430004931@o2.pl>:
>> >> >> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multioport --dpor=
t
>> >>
>> >> AK>                                                      /\
>> >> AK> ..is " -m --multioport " a valid match in iptables, or a correc=
t
>> >> AK> quote of your attempt to write  ' -m --multiport ' ?
>> >>
>> >> damn my wrong...it should looks like this:
>> >> iptables -A FORWARD -i eth1 -p udp -m --multioport --dport 23073,23=
083
>> >> -j ACCEPT                                   /\
>>
>> AK>                                               ||
>> AK> ..lets try again: I don't find "-m --multioport" _anywhere_
>> AK> in the docs, so, if you _actually_ try '-m --multioport' in
>> AK> your rule set, it _should_ fail, then you'll wanna try
>> AK> '-m --multiport', without your extra "o".  ;-)
>>
>> Oh yes, now i got, i was too sleepy yestorday to understand. Actualy
>> this rule looks like this:
>>
>> iptables -A FORWARD -i eth1 -p udp -m --multiport --dport 23073,23083 =
-j
>> ACCEPT
>>
>> and after run, shows no error msg. Thats mean it works but it wont
>> helps me to achive this what i want.
>>
>> I repeat my msg here again:
>>
>> In my network, Linux machine connect Local net (eth1) with internet
>> (ppp0). As a default all INCOMING traffic is deny. I made some rules
>> to access SMTP, HTTP etc. but its not important now.
>> It is necessery for nodes from local net to access server that is in
>> Internet. The address of this server is 62.233.202.165 and listen on p=
ort
>> 23073 and 23083.
>>
>> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multiport --dport
>> 23073,23083 -j ACCEPT"
>> wont helps and i have received msg in log like this:
>>
>> Apr 30 02:28:41 slack kernel: IPT:UnhandledForward:IN=3Deth1 OUT=3Dppp=
0
>> SRC=3D192.168.1.2 DST=3D62.233.202.165 LEN=3D36 TOS=3D0x00 PREC=3D0x00=
 TTL=3D127
>> ID=3D23780 PROTO=3DUDP SPT=3D1552 DPT=3D13073 LEN=3D16
>>
>
> From that packet it seems that you want to have --dport accept on port
13073
> NOT 23073 ... or perhaps as well as!
>
>--
>
> Alistair Tonner
> nerdnet.ca
> Senior Systems Analyst - RSS
>
>     Any sufficiently advanced technology will have the appearance of
magic.
> Lets get magical!
>
>
>--__--__--
>
>Message: 5
>Date: Wed, 30 Apr 2003 17:13:50 +0200 (CEST)
>From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
>To: Frank Smith <fsmith@hoovers.com>
>Cc: Netfilter <netfilter@lists.netfilter.org>
>Subject: Re: limit match log question
>
>Hi,
>
>> If you are using the limit match to control the number of log entries,
>> is there any way to also show the number of matches?
>Yes,
>
># iptables -L -nv
>
>-v option will show the number of packets that has hit the rule.
>
>Regards,
>Maciej Soltysiak
>
>
>
>--__--__--
>
>Message: 6
>Date: Wed, 30 Apr 2003 10:39:03 -0500
>From: Frank Smith <fsmith@hoovers.com>
>To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
>Cc: Netfilter <netfilter@lists.netfilter.org>
>Subject: Re: limit match log question
>
>--On Wednesday, April 30, 2003 17:13:50 +0200 Maciej Soltysiak
<solt@dns.toxicfilms.tv> wrote:
>
>>> If you are using the limit match to control the number of log entries=
,
>>> is there any way to also show the number of matches?
>> Yes,
>>
>># iptables -L -nv
>>
>> -v option will show the number of packets that has hit the rule.
>
>Thanks for the reply, but it seems I wasn't clear on my question.  I was
>looking for a way to get the number logged, so when the log entry was
>written it would contain the number of matches that occurred during the
>log limit interval.  If the log limit interval were set to 5 seconds, an=
d
>it got 1000 matches in that 5 seconds, the log entry would contain the
>number 1000 in it somewhere.
>   It seemed to me like a useful extension that would enable you to redu=
ce
>log file sizes while still providing data on the frequency of events.
Getting
>the counters from iptables on the command line is helpful for seeing wha=
t's
>going on right now, but doesn't help if you want data from some time in =
the
>past.
>
>Frank
>
>--
>Frank Smith                                             fsmith@hoovers.c=
om
>Systems Administrator                                  Voice: 512-374-46=
73
>Hoover's Online                                          Fax: 512-374-45=
01
>
>
>--__--__--
>
>Message: 7
>From: "Moti Levy" <moti@flncs.com>
>To: <netfilter@lists.netfilter.org>
>Subject: Can anyone please review the following rules and comment on the=
m ?
>Date: Wed, 30 Apr 2003 12:23:03 -0400
>
>Thanks ,
>Moti
>
>
>
>iptables -t nat -A PREROUTING -d $EXTIP -p TCP -m multiport \
>   --dport 25,80,110,443 -j DNAT --to $SRV_IP
>
> iptables -t nat -A POSTROUTING -o $EXTIF -s $LAN -j MASQUERADE
># ----------------------------------------------------------------------=
---
-
>--
>  iptables -A INPUT -i $EXTIF -p udp -m udp -s 0/0 --sport 67:68 -j ACCE=
PT
>  iptables -A INPUT -i $EXTIF -m state --state RELATED,ESTABLISHED -j
ACCEPT
>
>  iptables -A INPUT -i $EXTIF -p udp -m udp -s 0/0 --sport 500 -j ACCEPT
>  iptables -A INPUT -i $EXTIF -p 50 -s 0/0 -j ACCEPT
>  iptables -A INPUT -i $EXTIF -p 51 -s 0/0 -j ACCEPT
>
>  iptables -A INPUT -i $EXTIF -p tcp -d $EXTIP -m multiport \
>           --dport 22,25,80,110,443,8080 -j ACCEPT
>
>  iptables -A INPUT -i $EXTIF -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
>  iptables -A INPUT -i $EXTIF -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
>  iptables -A INPUT -i $EXTIF -m limit --limit 5/minute -j LOG --log-pre=
fix
>"IPT->"
>  iptables -A INPUT -i $EXTIF -j DROP
>
>
>
>--__--__--
>
>Message: 8
>Subject: Ipables memory footprint
>Date: Wed, 30 Apr 2003 10:23:22 -0600
>From: "Paul Albert" <palbert@rovingplanet.com>
>To: <netfilter@lists.netfilter.org>
>
>Hi all -=3D20
>
>I'm running a RH 7.3 box with a 2.4.20 kernel (with the bridge patches)
>and iptables v1.2.7a as a bridge.  Last night I received notice that the
>machine was out of memory.  After killing all of the java processes that
>were running, the machine was still using a substantial amount of memory
>(440MB/512MB).  I took the machine to single user mode to see if this
>would reduce the memory footprint, but this didn't change things
>significantly.
>
>I've run iptables for about a year without problems.  However, some
>people belive that it is this code that is causing our problems.  My
>questions are as follows:
>
>* Is there a way that I can measure the amount of memory that iptables
>is using?
>
>* Is there a way that I can manually flush all of the entries in
>/proc/net/ip_conntrack?
>
>* Are there any tools that I could use the monitor the kernel memory
>size?
>
>Thanks,
>Paul
>
>
>--__--__--
>
>Message: 9
>Date: Wed, 30 Apr 2003 19:00:56 +0200
>From: netfilter_user <netfilter_user@o2.pl>
>Reply-To: netfilter_user <netfilter_user@o2.pl>
>Organization: experience
>To: Alistair Tonner <Alistair@nerdnet.ca>
>Cc: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org
>Subject: Re[6]: access to server
>
>Hello Alistair,
>
>Wednesday, April 30, 2003, 4:59:48 PM, you wrote:
>
>AT> On April 30, 2003 09:32 am, netfilter_user wrote:
>>> Hello Arnt,
>>>
>>> Wednesday, April 30, 2003, 4:47:45 AM, you wrote:
>>>
>>> AK> On Wed, 30 Apr 2003 03:38:12 +0200,
>>> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>>>
>>> AK> <1246491441.20030430033812@o2.pl>:
>>> >> Hello Arnt,
>>> >>
>>> >> Wednesday, April 30, 2003, 3:10:30 AM, you wrote:
>>> >>
>>> >> AK> On Wed, 30 Apr 2003 00:49:31 +0200,
>>> >> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>>> >>
>>> >> AK> <5436369716.20030430004931@o2.pl>:
>>> >> >> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multioport --dpo=
rt
>>> >>
>>> >> AK>                                                      /\
>>> >> AK> ..is " -m --multioport " a valid match in iptables, or a corre=
ct
>>> >> AK> quote of your attempt to write  ' -m --multiport ' ?
>>> >>
>>> >> damn my wrong...it should looks like this:
>>> >> iptables -A FORWARD -i eth1 -p udp -m --multioport --dport
23073,23083
>>> >> -j ACCEPT                                   /\
>>>
>>> AK>                                               ||
>>> AK> ..lets try again: I don't find "-m --multioport" _anywhere_
>>> AK> in the docs, so, if you _actually_ try '-m --multioport' in
>>> AK> your rule set, it _should_ fail, then you'll wanna try
>>> AK> '-m --multiport', without your extra "o".  ;-)
>>>
>>> Oh yes, now i got, i was too sleepy yestorday to understand. Actualy
>>> this rule looks like this:
>>>
>>> iptables -A FORWARD -i eth1 -p udp -m --multiport --dport 23073,23083=
 -j
>>> ACCEPT
>>>
>>> and after run, shows no error msg. Thats mean it works but it wont
>>> helps me to achive this what i want.
>>>
>>> I repeat my msg here again:
>>>
>>> In my network, Linux machine connect Local net (eth1) with internet
>>> (ppp0). As a default all INCOMING traffic is deny. I made some rules
>>> to access SMTP, HTTP etc. but its not important now.
>>> It is necessery for nodes from local net to access server that is in
>>> Internet. The address of this server is 62.233.202.165 and listen on
port
>>> 23073 and 23083.
>>>
>>> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multiport --dport
>>> 23073,23083 -j ACCEPT"
>>> wont helps and i have received msg in log like this:
>>>
>>> Apr 30 02:28:41 slack kernel: IPT:UnhandledForward:IN=3Deth1 OUT=3Dpp=
p0
>>> SRC=3D192.168.1.2 DST=3D62.233.202.165 LEN=3D36 TOS=3D0x00 PREC=3D0x0=
0 TTL=3D127
>>> ID=3D23780 PROTO=3DUDP SPT=3D1552 DPT=3D13073 LEN=3D16
>>>
>
>AT>         From that packet it seems that you want to have --dport acce=
pt
on port 13073
>AT>         NOT 23073 ... or perhaps as well as!
>
>
>ok, so what means a LEN (lenght ???), TOS, PREC ?
>Is SPT means source port?
>Is DPT means destination port?
>
>Another thing,
>In client program i have told that i should use port 23073 or 23083 (
>23073 is set as default).
>Is taht means that when i use rule "iptables -A FORWARD -i eth1 -p udp
>-m --multiport --dport 23073,23083 -j ACCEPT" i make able demand
>packets to go out and then server answer from 62.233.202.165:1552(SPT)
>to my blocked port 13073 (DPT) ?
>
>But if its like i suspect, shouldent help rule that i set earlyer? :
>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>
>--
>Best regards,
> mailto:netfilter_user@o2.pl
>
>
>
>--__--__--
>
>Message: 10
>From: Alistair Tonner <Alistair@nerdnet.ca>
>Reply-To: Alistair@nerdnet.ca
>To: netfilter_user <netfilter_user@o2.pl>
>Subject: Re: Re[6]: access to server
>Date: Wed, 30 Apr 2003 13:48:09 -0400
>Cc: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org
>
>On April 30, 2003 01:00 pm, netfilter_user wrote:
>> Hello Alistair,
>>
>> Wednesday, April 30, 2003, 4:59:48 PM, you wrote:
>>
>> AT> On April 30, 2003 09:32 am, netfilter_user wrote:
>> >> Hello Arnt,
>> >>
>> >> Wednesday, April 30, 2003, 4:47:45 AM, you wrote:
>> >>
>> >> AK> On Wed, 30 Apr 2003 03:38:12 +0200,
>> >> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>> >>
>> >> AK> <1246491441.20030430033812@o2.pl>:
>> >> >> Hello Arnt,
>> >> >>
>> >> >> Wednesday, April 30, 2003, 3:10:30 AM, you wrote:
>> >> >>
>> >> >> AK> On Wed, 30 Apr 2003 00:49:31 +0200,
>> >> >> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>> >> >>
>> >> >> AK> <5436369716.20030430004931@o2.pl>:
>> >> >> >> Rule: "iptables -A FORWARD -i eth1 -p
udp -m --multioport --dport
>> >> >>
>> >> >> AK>                                                      /\
>> >> >> AK> ..is " -m --multioport " a valid match in iptables, or a
correct
>> >> >> AK> quote of your attempt to write  ' -m --multiport ' ?
>> >> >>
>> >> >> damn my wrong...it should looks like this:
>> >> >> iptables -A FORWARD -i eth1 -p udp -m --multioport --dport
>> >> >> 23073,23083 -j ACCEPT                                   /\
>> >>
>> >> AK>                                               ||
>> >> AK> ..lets try again: I don't find "-m --multioport" _anywhere_
>> >> AK> in the docs, so, if you _actually_ try '-m --multioport' in
>> >> AK> your rule set, it _should_ fail, then you'll wanna try
>> >> AK> '-m --multiport', without your extra "o".  ;-)
>> >>
>> >> Oh yes, now i got, i was too sleepy yestorday to understand. Actual=
y
>> >> this rule looks like this:
>> >>
>> >> iptables -A FORWARD -i eth1 -p udp -m --multiport --dport
23073,23083 -j
>> >> ACCEPT
>> >>
>> >> and after run, shows no error msg. Thats mean it works but it wont
>> >> helps me to achive this what i want.
>> >>
>> >> I repeat my msg here again:
>> >>
>> >> In my network, Linux machine connect Local net (eth1) with internet
>> >> (ppp0). As a default all INCOMING traffic is deny. I made some rule=
s
>> >> to access SMTP, HTTP etc. but its not important now.
>> >> It is necessery for nodes from local net to access server that is i=
n
>> >> Internet. The address of this server is 62.233.202.165 and listen o=
n
>> >> port 23073 and 23083.
>> >>
>> >> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multiport --dport
>> >> 23073,23083 -j ACCEPT"
>> >> wont helps and i have received msg in log like this:
>> >>
>> >> Apr 30 02:28:41 slack kernel: IPT:UnhandledForward:IN=3Deth1 OUT=3D=
ppp0
>> >> SRC=3D192.168.1.2 DST=3D62.233.202.165 LEN=3D36 TOS=3D0x00 PREC=3D0=
x00 TTL=3D127
>> >> ID=3D23780 PROTO=3DUDP SPT=3D1552 DPT=3D13073 LEN=3D16
>>
>> AT>         From that packet it seems that you want to have --dport
accept
>> on port 13073 AT>         NOT 23073 ... or perhaps as well as!
>>
>>
>> ok, so what means a LEN (lenght ???), TOS, PREC ?
>> Is SPT means source port?
>> Is DPT means destination port?
>>
>> Another thing,
>> In client program i have told that i should use port 23073 or 23083 (
>> 23073 is set as default).
>> Is taht means that when i use rule "iptables -A FORWARD -i eth1 -p udp
>> -m --multiport --dport 23073,23083 -j ACCEPT" i make able demand
>> packets to go out and then server answer from 62.233.202.165:1552(SPT)
>> to my blocked port 13073 (DPT) ?
>>
>> But if its like i suspect, shouldent help rule that i set earlyer? :
>> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Hmm.
> Okay ... from this packet *alone* I cannot tell what rules need be ther=
e.
> BUT -- this packet appears to be *from* your inside computer
>(SRC=3D192.168.....) and headed to the server to which yau are connectin=
g
>(DST=3D62.233.....)
> SRC =3D where the packet started
> DST =3D where the packet is going
> SPT=3D which port on the sending computer emitted the packet
> DPT =3D which port on the recieving computer the packet is pointed at.
>
> I realize that this is NOT the entire datastream for the connection, bu=
t
the
> issue may be that the application uses somewhat more resources than the
> designers report.
>
> I'd have to see the /proc/net/ip_conntrack entry to see if this would b=
e
> tapped as related,established connection ... but connection a from poin=
t a
to
> point b does NOT nessesarily allow all other connections from point a t=
o
> point b.
>
> Further I can't recall at the moment how UDP is handled by EST, REL
rules...
> (I'm a little off lately, have been hammering on wine... so some of my
> iptables stuff is slipping)
>--
>
> Alistair Tonner
> nerdnet.ca
> Senior Systems Analyst - RSS
>
>     Any sufficiently advanced technology will have the appearance of
magic.
> Lets get magical!
>
>
>--__--__--
>
>Message: 11
>Date: Wed, 30 Apr 2003 12:33:07 -0700 (PDT)
>From: Paul <gabaod@yahoo.com>
>Subject: Iptables - Port forwarding - extremely baffled.
>To: netfilter@lists.netfilter.org
>
>Ok ive been trying to attempt basic port forwarding
>for past days and now im extremely confused :)
>
>First off instead of going with my normal firewall
>script, i decided to just open everything up and just
>test a basic port forwarding.
>
>I first ran this
>
>$IPTABLES -P INPUT ACCEPT
>$IPTABLES -P FORWARD ACCEPT
>$IPTABLES -P OUTPUT ACCEPT
>$IPTABLES -F INPUT
>$IPTABLES -F FORWARD
>$IPTABLES -F OUTPUT
>$IPTABLES -t nat -P PREROUTING ACCEPT
>$IPTABLES -t nat -P POSTROUTING ACCEPT
>$IPTABLES -t nat -P OUTPUT ACCEPT
>$IPTABLES -t nat -F PREROUTING
>$IPTABLES -t nat -F POSTROUTING
>$IPTABLES -t nat -F OUTPUT
>
>
>to fully clear everything and open everything up.
>
>I then ran this
>
>iptables -t nat -A PREROUTING -i eth0 -p tcp -d
>externalip --dport 22 -j DNAT --to 192.168.1.8:22
>
>And i tested it from outside the network, and yes it
>fully connected me to port 22 on 192.168.1.8  by ssh
>into externalip:22
>
>Ok, now i know port forwarding DOES work :)
>
>Well i want to be able to ssh to my firewall, and also
>to 192.168.1.8  so I reran the above flushing script
>to re-clear everything out.
>
>I then ran this
>
>iptables -t nat -A PREROUTING -i eth0 -p tcp -d
>externalip --dport 22022 -j DNAT --to 192.168.1.8:22
>
>only difference now is external port will be 22022
>instead of the previous 22.   So i try to connect to
>externalip:22022  and the connection just times out,
>so it didnt forward externalip:22022 to
>192.168.1.8:22, but it will forward  externalip:22 to
>192.168.1.8:22
>
>Please assist me in the right direction on why i cant
>let it be a different external port other than 22. and
>yes ive tried other various ports besides 22022 as
>well :/
>
>thanks
>-paul
>
>__________________________________
>Do you Yahoo!?
>The New Yahoo! Search - Faster. Easier. Bingo.
>http://search.yahoo.com
>
>
>--__--__--
>
>Message: 12
>Date: Wed, 30 Apr 2003 15:23:17 -0400
>From: Sapient2003 <sapient@qwest.net>
>To:  netfilter@lists.netfilter.org
>Subject: Communication redirect
>
>How can I redirect communication to a program... So far I have tried:
>
>iptables -t filter -A INPUT -p tcp --destination-port 21 -j REDIRECT
testftp
>
>
>
>--__--__--
>
>Message: 13
>Subject: RE: Local rule for Port Forward
>From: Patrick Nelson <pnelson@neatech.com>
>Reply-To: pnelson@neatech.com
>To: "'Netfilter List'" <netfilter@lists.samba.org>
>Organization: www.neatech.com
>Date: 30 Apr 2003 14:04:27 -0700
>
>On Sat, 2003-04-26 at 10:35, Andy Wood wrote:
>> ...perhaps it is self-governing.  Best practices would dictate that
>> instant messaging on a firewall is a bad idea.  The idea for a FW is
minimal
>> packages, no permanent compilers, certainly not X and all of its
user-ware.
>> It's remote-code-execution waitin' to happen.
>>
>> Question, why do you SNAT external Jabber traffic to your FW's
>> internal IP?  In doing that your server sees the traffic as originatin=
g
from
>> $InIP, vice its true source.
>>
>>
>> >  I'm doing port forwarding to a server that runs jabber and everythi=
ng
>> > works fine, I did notice that if I bring up a jabber client on the
>> > firewall itself I do not get connected.  While this isn't really
>> > needed... I don't totally understand why it doesn't work.  Being
>> > inquisitive... well I just gots to know why!  Can anyone shed some
>> > light?
>> >
>> >  My rules for the jabber port forward are:
>> >
>> >  iptables -A FORWARD
>> >           -i $ExIF -d $JabIP -p tcp --dport $JabPort
>> >           -j ACCEPT
>> >  iptables -A PREROUTING
>> >           -t nat -d $ExIP -p tcp --dport $JabPort
>> >           -j DNAT --to-destination $JabIP  iptables -A POSTROUTING
>> >           -t nat -d $JabIP -p tcp --dport $JabPort
>> >           -j SNAT --to-source $InIP
>>
>
>Well good question.  At first I was going to say because it's the only
>thing that made it work...  I tried dropping the snat and this shut
>everything down.  So at first I was going to say, not sure why but its
>the only way it works...  However...
>
>I did notice that the jabber server itself locked up too.  But this time
>I left just the 2 rules in place with out the snat, when I restarted the
>server.  Oh my all systems were able to connect.  All in all I guess I
>just put that rule in there because someone said... these are what I
>use.
>
>I think I understand a bit better how the dnat and snat stuff works.
>Thanks for questioning it.
>
>
>
>
>--__--__--
>
>_______________________________________________
>netfilter mailing list
>netfilter@lists.netfilter.org
>https://lists.netfilter.org/mailman/listinfo/netfilter
>
>
>End of netfilter Digest


