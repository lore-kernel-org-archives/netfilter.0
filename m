From: "Manikandan" <mani@manikandan.org>
Subject: RE: netfilter digest, Vol 1 #1663 - 11 msgs
Date: Tue, 30 Mar 2004 10:58:15 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <JFEPKPDIGFAKJOGHOICDCECDCAAA.mani@manikandan.org>
References: <20040329194007.18459.11569.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040329194007.18459.11569.Mailman@vishnu.netfilter.org>
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
To: netfilter@lists.netfilter.org

Dear Antony,

Thanks for your reply. I am trying to connect to my Windows 2000 VPN server
using PPTP. The error 721 is dialup networking error. I have got the
following modules loaded in my iptables.

iptable_nat            21720   1  (autoclean)
ipt_state               1048   2  (autoclean)
ip_conntrack           26976   2  (autoclean) [iptable_nat ipt_state]
iptable_filter          2412   1  (autoclean)
ip_tables              15096   5  [iptable_nat ipt_state iptable_filter]

What are the other modules I would need to load?

My VPN client behind firewall using PPTP is able to make only one connection
to the VPN server.

Thanks.

-- Manikandan.


Message: 3
From: "Manikandan" <mani@manikandan.org>
To: "Netfilter" <netfilter@lists.netfilter.org>
Subject:  VPN issue
Date: Mon, 29 Mar 2004 19:09:57 +0530


Dear all,

A Linux server is acting as gateway/firewall to route traffic from my LAN to
Internet using one public IP.
The issue is, I am able to make only one connection to the VPN server
through my firewall. The second connection fails with an error 721.
I mapped another unused public IP to one of my local LAN system. I am able
to make one more connection to the server as the public IP is different. So
NATing seems to be the problem.
Please assist me in configuring my firewall to allow concurrent VPN sessions
to the server.
I am using 2.4.20-8 kernel and iptables.

Advance thanks.

Regards,
Manikandan.

--__--__--

Message: 4
From: Antony Stone <Antony@Soft-Solutions.co.uk>
Reply-To: "Netfilter" <netfilter@lists.netfilter.org>
To: "Netfilter" <netfilter@lists.netfilter.org>
Subject: Re: VPN issue
Date: Mon, 29 Mar 2004 14:52:18 +0100

On Monday 29 March 2004 2:39 pm, Manikandan wrote:

> Dear all,
>
> A Linux server is acting as gateway/firewall to route traffic from my LAN
> to Internet using one public IP.
> The issue is, I am able to make only one connection to the VPN server

What sort of VPN server?   What VPN protocol are you using?   IPsec?   PPTP?
Something else?

> through my firewall. The second connection fails with an error 721.

What does this error message mean (it doesn't come from netfilter)?

> I mapped another unused public IP to one of my local LAN system. I am able
> to make one more connection to the server as the public IP is different.
So
> NATing seems to be the problem.

Sounds like you're probably using PPTP then (but please confirm anyway).
Do
you have the PPTP-nat/conntrack helpers loaded?

Regards,

Antony.



 -----Original Message-----
From: 	netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]  On Behalf Of
netfilter-request@lists.netfilter.org
Sent:	Tuesday, March 30, 2004 1:10 AM
To:	netfilter@lists.netfilter.org
Subject:	netfilter digest, Vol 1 #1663 - 11 msgs

Send netfilter mailing list submissions to
	netfilter@lists.netfilter.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.netfilter.org/mailman/listinfo/netfilter
or, via email, send a message with subject or body 'help' to
	netfilter-request@lists.netfilter.org

You can reach the person managing the list at
	netfilter-admin@lists.netfilter.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of netfilter digest..."


Today's Topics:

   1. kernel 2.6 IPsec and netfilter (Devaraj Das)
   2. Re: kernel 2.6 IPsec and netfilter (Lane Powers)
   3. VPN issue (Manikandan)
   4. Re: VPN issue (Antony Stone)
   5. Iptables and kernel 2.6.4 on slackware 9.1 (Erik Ahlner)
   6. connlimit problem (kamil kapturkiewicz)
   7. Re: kernel 2.6 IPsec and netfilter (Devaraj Das)
   8. Re: kernel 2.6 IPsec and netfilter (Devaraj Das)
   9. Re: Three kernel Oops/panic/BUG ksymoopses (kernel BUG at
buffer.c:539) (Erik Bourget)
  10. Re: Wayward RST packets - what's the right answer? (Jay Levitt)
  11. Serious NAT problem (Karol Tomala)

--__--__--

Message: 1
Date: Mon, 29 Mar 2004 16:40:05 +0530
From: Devaraj Das <ddas@india.hp.com>
Organization: Hewlett Packard (STSD)
To: netfilter@lists.netfilter.org
Subject: kernel 2.6 IPsec and netfilter

Hi,
I wanted to know whether there is a working solution for the issue that
was discussed sometime back:
http://www.spinics.net/lists/netfilter/msg22099.html
In short is there any solution to enable blocking selective ports in a
machine running Linux 2.6.0 + in-kernel ipsec.
I would be very helpful if I can get a working solution or some
information on a possible solution.
Thanks,
Devaraj.



--__--__--

Message: 2
Date: Mon, 29 Mar 2004 07:36:49 -0500
From: Lane Powers <lpowers@mis.net>
To: netfilter@lists.netfilter.org
Subject: Re: kernel 2.6 IPsec and netfilter

Well, it might not be perfect, but here is what I do, and it 'works for me'

In my ipsec.conf I use the updown script functionality of pluto, i.e. in
my conn default I put
         leftupdown=/usr/local/bin/updown.sh


and then that script is responsible for setting netfilter rules for that
ip while the tunnel is up, i.e.

#!/bin/bash
if [ "$PLUTO_VERB" == "up-client" ] || [ "$PLUTO_VERB" == "up-host" ] ; then
         iptables -N $PLUTO_CONNECTION;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 22 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 23 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 80 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 443 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 3389 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 5900 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-reply
-j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-request
-j ACCEPT;
         iptables -A $PLUTO_CONNECTION -j ACCEPT
         iptables -I INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -I FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         exit 0;
elif [ "$PLUTO_VERB" == "down-client" ] || [ "$PLUTO_VERB" ==
"down-host" ] ; then
         iptables -D INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -D FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -F $PLUTO_CONNECTION;
         iptables -X $PLUTO_CONNECTION;
         exit 0;
fi
         exit 0;

obviously if you needed different rules per tunnel you could just move
the updown into the individual conn and define a seperate script per
connection with different rules.  all of the $PLUTO_... stuff is set in
the ENV while the connection is being built... obviously for me, my
FORWARD chain is a default drop, so I am just inserting at the top and
allowing what I want for the duration of the tunnel.

Hope that helps.

Lane

Devaraj Das wrote:
> Hi,
> I wanted to know whether there is a working solution for the issue that
> was discussed sometime back:
> http://www.spinics.net/lists/netfilter/msg22099.html
> In short is there any solution to enable blocking selective ports in a
> machine running Linux 2.6.0 + in-kernel ipsec.
> I would be very helpful if I can get a working solution or some
> information on a possible solution.
> Thanks,
> Devaraj.
>
>


--__--__--

--
In Heaven, the police are British, the chefs are Italian, the beer is
Belgian,
the mechanics are German, the lovers are French, the entertainment is
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American,
the mechanics are French, the lovers are Swiss, the entertainment is
Belgian,
and everything is organised by the Italians.

                                                     Please reply to the
list;
                                                           please don't CC
me.



--__--__--

Message: 5
From: "Erik Ahlner" <whyz@home.se>
To: <netfilter@lists.netfilter.org>
Subject: Iptables and kernel 2.6.4 on slackware 9.1
Date: Mon, 29 Mar 2004 15:53:25 +0200

hello!

I've recently reentered this mailinglist and thus i don't know if this
question has been asked before.. i hope i'm not alone with this problem!

Last week I bought a new harddrive for my box, and installed slackware 9.1
(had 8.0 earlier) and compiled kernel 2.6.4 (had 2.4.22 earlier). At first,
everything seems to be fine, iptables runs.
But after half an hour or so, iptables just stops working. It's only
iptables that does this (i suppose), the server/router still has connection
to the internet and the computers behind it.
(I.e i have a ventrilo server running on the router, and i can still talk to
users connecting to it from the internet, while i'm connected to it from
inside the lan).

After about 5 minutes of downtime iptables suddenly starts working again,
and the computers on the NAT has internet access again.

These are my rules:

IPTABLES=/usr/sbin/iptables
EXTIF="eth0"
INTIF="eth1"

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE


Nothing here has changes since i was running kernel 2.4.22.

What could be the problem?
Anyone else who has experienced this?


I'm using iptables v1.2.9


Regards
    Erik Ahlner




--__--__--

Message: 6
Date: Mon, 29 Mar 2004 16:02:28 +0200
From: kamil kapturkiewicz <horizn@neozdrada.pl>
To:  netfilter@lists.netfilter.org
Subject: connlimit problem

hi

after run kernel 2.4.25 with connlimit from latest pom there is lots of:

kernel: ipt_connlimit: Oops: invalid ct state ?

in syslog.

i try to find solve in google, but i cant find answer what to do whit this.

can anyone help me ? please ;)




--__--__--

Message: 7
Date: Mon, 29 Mar 2004 20:43:25 +0530
From: Devaraj Das <ddas@india.hp.com>
Organization: Hewlett Packard (STSD)
To: Thomas Lussnig <lussnig@smcc.net>, lpowers@mis.net
Cc: netfilter@lists.netfilter.org
Subject: Re: kernel 2.6 IPsec and netfilter

Thanks for your responses Thomas & Lane. I forgot to mention that I am us=
ing
racoon as the IKE daemon. If I enable ipsec tunnelling between two linux-=
2.6
machines, things work fine. I am able to restrict accesses to ports, etc.

I also have windows (2K) machines that can be connected as a client to th=
e
linux-2.6 machine. The problem that I am facing now is that the windows
machine's native ipsec implementation does not work if the "tunnel mode" =
is
enabled. So now I am looking for a solution that does not require enablin=
g
tunnelling.

Thanks for your help.

Devaraj.

Thomas Lussnig wrote:

> Devaraj Das wrote:
>
> >Hi,
> >I wanted to know whether there is a working solution for the issue tha=
t
> >was discussed sometime back:
> >http://www.spinics.net/lists/netfilter/msg22099.html
> >In short is there any solution to enable blocking selective ports in a
> >machine running Linux 2.6.0 + in-kernel ipsec.
> >I would be very helpful if I can get a working solution or some
> >information on a possible solution.
> >Thanks,
> >Devaraj.
> >
> >
> Hi,
> if you look at ipsec from Linux-2.6.0 you would have noticed that you d=
efine
> SRC-IP/SRC-PORT -- DST-IP/DST-PORT this mean you question imply the
> following setup:
>
> 1. You allow any port combination to go via the ipsec tunnel
> 2. You have ports that should not go via the ipsec tunnel wich you allo=
w
> via ipsec
> 3. Now this ports should be filtered on iptables layer
> - possible at prerouting/mangle
> + define the correkt ipsec config
>
> Gru=DF Thomas Lu=DFnig



--__--__--

Message: 8
Date: Mon, 29 Mar 2004 20:51:53 +0530
From: Devaraj Das <ddas@india.hp.com>
Organization: Hewlett Packard (STSD)
To: Lane Powers <lpowers@mis.net>
Cc: netfilter@lists.netfilter.org
Subject: Re: kernel 2.6 IPsec and netfilter

Lets take for this discussion a simple case where
* we want to disable 10.0.1.5's access to port 5000 on another machine
10.0.1.1.

* 10.0.1.5, however, has access to all other ports on 10.0.1.1.
* Another machine 10.0.1.6 has access to all ports on 10.0.1.1.
* Creating tunnels to 10.0.1.1 may not be possible on all machines.
* All the clients have to necessarily go through the ipsec protocols...
* racoon is the key mgmt daemon.

Please let me know your inputs...

Thanks,
Devaraj.

Lane Powers wrote:

> Well, it might not be perfect, but here is what I do, and it 'works for
me'
>
> In my ipsec.conf I use the updown script functionality of pluto, i.e. in
> my conn default I put
>          leftupdown=/usr/local/bin/updown.sh
>
> and then that script is responsible for setting netfilter rules for that
> ip while the tunnel is up, i.e.
>
> #!/bin/bash
> if [ "$PLUTO_VERB" == "up-client" ] || [ "$PLUTO_VERB" == "up-host" ] ;
then
>          iptables -N $PLUTO_CONNECTION;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 22 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 23 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 80 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 443 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 3389 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p tcp --dport 5900 -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-reply
> -j ACCEPT;
>          iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-request
> -j ACCEPT;
>          iptables -A $PLUTO_CONNECTION -j ACCEPT
>          iptables -I INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
>          iptables -I FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
>          exit 0;
> elif [ "$PLUTO_VERB" == "down-client" ] || [ "$PLUTO_VERB" ==
> "down-host" ] ; then
>          iptables -D INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
>          iptables -D FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
>          iptables -F $PLUTO_CONNECTION;
>          iptables -X $PLUTO_CONNECTION;
>          exit 0;
> fi
>          exit 0;
>
> obviously if you needed different rules per tunnel you could just move
> the updown into the individual conn and define a seperate script per
> connection with different rules.  all of the $PLUTO_... stuff is set in
> the ENV while the connection is being built... obviously for me, my
> FORWARD chain is a default drop, so I am just inserting at the top and
> allowing what I want for the duration of the tunnel.
>
> Hope that helps.
>
> Lane
>
> Devaraj Das wrote:
> > Hi,
> > I wanted to know whether there is a working solution for the issue that
> > was discussed sometime back:
> > http://www.spinics.net/lists/netfilter/msg22099.html
> > In short is there any solution to enable blocking selective ports in a
> > machine running Linux 2.6.0 + in-kernel ipsec.
> > I would be very helpful if I can get a working solution or some
> > information on a possible solution.
> > Thanks,
> > Devaraj.
> >
> >



--__--__--

Message: 9
To: <Administrator>
Cc: <linux-kernel@vger.kernel.org>,
	<netfilter@lists.netfilter.org>
Subject: Re: Three kernel Oops/panic/BUG ksymoopses (kernel BUG at
buffer.c:539)
From: "Erik Bourget" <erik@midmaine.com>
Date: Mon, 29 Mar 2004 16:40:45 +0100

Guennadi Liakhovetski <g.liakhovetski@gmx.de> writes:

> On Fri, 2 Jan 2004, Erik Bourget wrote:
>
>> I had a very bizarre situation where four boxes in the same rack all
>> simultaneously (within 30 minutes) hard-locked with Oops messages.  The
>> boxes
>
> An obvious idea - after reading an article about a break-in into Debian
> and others' boxes - sure you weren't cracked?

Yeah, that was a concern and I'm relatively sure that's not the case because

*) chkrootkit says so (mod some hidden processes that are reported by a bug
in
 chkrootkit according to Google)

*) The crashy boxes were all installed with 2.4.23, not upgraded, so the big
 Debian vulnerability didn't exist

*) The only open ports to the outside world are running SMTP and POP3 as
 non-root no-shell accounts, and it's running qmail which seems simple and
 safe enough.

- Erik Bourget

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/





--__--__--

Message: 10
To: <netfilter@lists.netfilter.org>
Subject: Re: Wayward RST packets - what's the right answer?
Date: Mon, 29 Mar 2004 14:11:53 -0500
From: Jay Levitt <lists-netfilter@shopwatch.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0584_01C41597.C9290450
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Chris Brenton wrote:


> On Thu, 2004-03-25 at 23:29, Jay Levitt wrote:
> >
> > Fairly often - as in a few times an hour on a very, very underused
> > server - I get repeated RST packets from hosts I've recently been
> > talking to, but that conntrack thinks aren't part of a connection.  =
My
> > rule:
> >
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j LOG --log-prefix "Stealth scan attempt"
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j DROP
>
> Maybe I'm reading this wrong, but I would expect you would only get a
> match with this rule if SYN was set. I'm surprised your grabbing RST
> packets. Perhaps another rule that uses the same prefix?

Nope, it's the other way around - this rule matches any packet that is =
in a
NEW state but has flags other than SYN-and-only-SYN.

> Also, not so sure you can consider RST's a "stealth scan" as a =
receiving
> host is just going to ignore bogus RST's and not reply, regardless of
> whether the port is open or not. Best an attacker could hope to =
receive
> is a host unreachable.

OK, so it'd be perfectly safe to add this?

iptables -A INPUT -p -tcp --tcp-flags FIN,SYN,RST,ACK RST -m state =
--state
NEW -j ACCEPT

One problem is that although I can read about the TCP protocol and valid
states, I don't know what failure/DOS/etc modes I'm protecting against, =
and
therefore I'm not sure what invalid-yet-possible states I should be =
letting
through.

> > Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=3Deth0 OUT=3D
> > MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 SRC=3D208.185.179.12
> > DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D47 =
ID=3D6376 PROTO=3DTCP
> > SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST URGP=3D0
>
> What's the time stamp on the accepted packet? If you are
> logging/dropping RST packets prior to processing ESTABLISHED that =
would
> explain this entry. I very rarely see legit RST packets get dropped so
> if you are seeing them fairly often I would guess a config problem as
> RSTs are a last resort.

Not sure what you're asking about the timestamp... the rule does =
log/drop
RST packets in a NEW state (or, more likely, after a connection has been
"closed" in conntrack).  I see them a few times an hour; any idea what =
sort
of config problem I'd be looking for?

> The other time I've seen it is when there is an IDS on the wire =
kicking
> out RST packets when a suspect packet is seen, but the IDS does not =
get
> the sequence numbers right in the RST.

What's an IDS?

Jay Levitt

------=_NextPart_000_0584_01C41597.C9290450
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Chris Brenton wrote:<BR><BR><BR>&gt; On Thu, 2004-03-25 at 23:29, =
Jay=20
Levitt wrote:<BR>&gt; &gt;<BR>&gt; &gt; Fairly often - as in a few times =
an hour=20
on a very, very underused<BR>&gt; &gt; server - I get repeated RST =
packets from=20
hosts I've recently been<BR>&gt; &gt; talking to, but that conntrack =
thinks=20
aren't part of a connection.&nbsp; My<BR>&gt; &gt; rule:<BR>&gt; =
&gt;<BR>&gt;=20
&gt; iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m =
state<BR>&gt;=20
&gt; --state NEW -j LOG --log-prefix "Stealth scan attempt"<BR>&gt; &gt; =

iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m =
state<BR>&gt; &gt;=20
--state NEW -j DROP<BR>&gt;<BR>&gt; Maybe I'm reading this wrong, but I =
would=20
expect you would only get a<BR>&gt; match with this rule if SYN was set. =
I'm=20
surprised your grabbing RST<BR>&gt; packets. Perhaps another rule that =
uses the=20
same prefix?<BR><BR>Nope, it's the other way around - this rule matches =
any=20
packet that is in a<BR>NEW state but has flags other than=20
SYN-and-only-SYN.<BR><BR>&gt; Also, not so sure you can consider RST's a =

"stealth scan" as a receiving<BR>&gt; host is just going to ignore bogus =
RST's=20
and not reply, regardless of<BR>&gt; whether the port is open or not. =
Best an=20
attacker could hope to receive<BR>&gt; is a host unreachable.<BR><BR>OK, =
so it'd=20
be perfectly safe to add this?<BR><BR>iptables -A INPUT -p -tcp =
--tcp-flags=20
FIN,SYN,RST,ACK RST -m state --state<BR>NEW -j ACCEPT<BR><BR>One problem =
is that=20
although I can read about the TCP protocol and valid<BR>states, I don't =
know=20
what failure/DOS/etc modes I'm protecting against, and<BR>therefore I'm =
not sure=20
what invalid-yet-possible states I should be =
letting<BR>through.<BR><BR>&gt;=20
&gt; Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=3Deth0 =
OUT=3D<BR>&gt; &gt;=20
MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 =
SRC=3D208.185.179.12<BR>&gt; &gt;=20
DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D6376 =
PROTO=3DTCP<BR>&gt;=20
&gt; SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST =
URGP=3D0<BR>&gt;<BR>&gt; What's the=20
time stamp on the accepted packet? If you are<BR>&gt; logging/dropping =
RST=20
packets prior to processing ESTABLISHED that would<BR>&gt; explain this =
entry. I=20
very rarely see legit RST packets get dropped so<BR>&gt; if you are =
seeing them=20
fairly often I would guess a config problem as<BR>&gt; RSTs are a last=20
resort.<BR><BR>Not sure what you're asking about the timestamp... the =
rule does=20
log/drop<BR>RST packets in a NEW state (or, more likely, after a =
connection has=20
been<BR>"closed" in conntrack).&nbsp; I see them a few times an hour; =
any idea=20
what sort<BR>of config problem I'd be looking for?<BR><BR>&gt; The other =
time=20
I've seen it is when there is an IDS on the wire kicking<BR>&gt; out RST =
packets=20
when a suspect packet is seen, but the IDS does not get<BR>&gt; the =
sequence=20
numbers right in the RST.<BR><BR>What's an IDS?<BR><BR>Jay=20
Levitt<BR></DIV></BODY></HTML>

------=_NextPart_000_0584_01C41597.C9290450--



--__--__--

Message: 11
Subject: Serious NAT problem
From: Karol Tomala <ktomala@tgc.pl>
To: netfilter@lists.netfilter.org
Organization: TGC Polska
Date: Mon, 29 Mar 2004 21:51:09 +0200

Hello!
I have a question regarding netfilter. I have been looking for an answer
for two days and I'm hopeless. That's why I have decided to ask for help
here.

I have a Mandrake Linux 9.2.1 internal router acting as a
natbox/firewall. It has three NIC's:
eth0 -> x.y.z.x (DMZ interface) [Doesn't matter for this issue]
eth1 -> 172.18.12.0/255.255.252.0 (LAN interface)
eth2 -> 10.128.2.64/255.255.255.224 (Client network)

Here's a liitle graph showing the connections:

[ Cisco 1700 ]        [ NATBOX/FIREWALL ]
[ 10.128.2.65 ] <---> { eth2 }   { eth1 } <---> { LAN: 172.18.12.0 }

Eth2 interface has IP number 10.128.2.66.
Eth1 interface has IP number 172.18.15.125.

I want to connect client's Cisco 1700 router via eth2 network. However I
don't want a 1:1 NAT. I would like to NAT a few hosts from 172.18.
network to 10.128.2. so client could easily connect to some of our
servers without having access to the rest of our LAN.

I have a host 172.18.5.2 that should be NAT'ed to 10.128.2.70. All
traffic going to 10.128.2.70 should reach 172.18.5.2 transparently.

I have been trying to configure NAT without much success.

This is a part of my configuration:

### Netfilter
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Add route to 172.18.5.0/29 network
ip route add 172.18.5.0/29 gw 172.18.15.254 dev eth1

# Only for testing, will be changed when NAT works
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT

# NAT
iptables -t nat -A POSTROUTING -o eth2 -s 172.18.5.2 -j SNAT --to-source
10.128.2.70
iptables -t nat -A PREROUTING -i eth2 -d 10.128.2.70 -j DNAT
--to-destination 172.18.5.2

[cut]

Unfortunatelly it's not working. I have lost two days on it, browsing
through google and found nothing much helpful.

I would like to achieve exactly the same as you can do in Cisco IOS with
issuing command:
ip nat inside static host 172.18.5.2 host 10.128.2.70

I don't want to assign VLAN on my eth2 NIC with IP 10.128.2.70. (Reason
for this is that NATBOX is acting as a firewall/natbox/vpn router and I
would have to assign thousands of VLANs on my NICs). I would like the
host 172.18.5.2 to be seen as 10.128.2.70 in the client's network.

I can ping the Cisco router on 10.128.2.65 from 10.128.2.66 via eth2. I
can ping 172.18.5.2 from 172.18.15.125 via eth1. Unfortunatelly NAT is
not working. Pinging 10.128.2.70 from eth2 gives Destination Host
Unreachable. tcpdump -i eth2 gives "arp who-has 10.128.2.70 tell
10.128.2.66". Nothing else happens. I cannot telnet to 10.128.2.70, but
I can telnet to it by 172.18.5.2 IP number.

What am I doing wrong? Please help me. I'm hopeless and don't know what
to do. :(

Greetings
--
Karol Tomala





--__--__--

_______________________________________________
netfilter mailing list
netfilter@lists.netfilter.org
https://lists.netfilter.org/mailman/listinfo/netfilter


End of netfilter Digest



