From: BILL CHANCE <whitesock95829@yahoo.com>
Subject: Re: netfilter digest, Vol 1 #1310 - 11 msgs
Date: Mon, 17 Nov 2003 07:51:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031117155105.42218.qmail@web14907.mail.yahoo.com>
References: <20031117115605.15876.67752.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1671727789-1069084265=:41692"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117115605.15876.67752.Mailman@netfilter-sponsored-by.noris.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-1671727789-1069084265=:41692
Content-Type: text/plain; charset=us-ascii


 
 
I am new studing Network Security and iptables. The questions and answers are very helpful as a student. Any quick way on how to write iptables and policy. I am struggling.
 
bill
netfilter-request@lists.netfilter.org wrote:
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

1. System Load (Rohit)
2. Caching of rules in PRE(POST)ROUTING chains? (Pavel V. Yanchenko)
3. iptables questions (Antti Korpela)
4. iptables ipforwarding issue (Michael Menges)
5. RE: A little help? (Chris Winfield-Blum)
6. Re: Documentation for the u32 module (Harald Welte)
7. Re: System Load (Ray Leach)
8. Re: Caching of rules in PRE(POST)ROUTING chains? (Ray Leach)
9. Re: Caching of rules in PRE(POST)ROUTING chains? (Antony Stone)
10. Changes in kernel >= 2.4.20 ? (Martin Petruzzi)
11. Re: System Load (bikrant@wlink.com.np)

--__--__--

Message: 1
From: Rohit 
To: netfilter@lists.netfilter.org
Subject: System Load
Date: Fri, 14 Nov 2003 15:19:11 +0545
Cc: lartc@mailman.ds9a.nl

Hi,
Is it possible to know how much system resources (cpu/memory load) that the 
netfilter module(s) is using? We are using HTB to shape our client traffic 
and there are 4 iptables rule for each client in the mangle table. I think it 
will be helpful to gather such data and graph it using mrtg.

I'm really sorry if someone has already asked about it.
Thanks a lot.

with regards,
Rohit Nepali


--__--__--

Message: 2
Date: Sat, 15 Nov 2003 11:07:35 +0300
From: "Pavel V. Yanchenko" 
Reply-To: balrog@msmu.eu.org
To: netfilter@lists.netfilter.org
Subject: Caching of rules in PRE(POST)ROUTING chains?

Hello.

As far as I understand, rules in PRE- and POSTROUTING chains are
cached? Because when I delete a rule with SNAT target for ip
192.168.10.10 this address's packets are still SNATed for several
minutes. The same thing happens for rules in PREROUTING chains.
Is it possible to disable this feature? Maybe there is some file in
/proc where cached rules are listed?

Thanks in advance.

-- 
Best regards,
Pavel mailto:balrog@msmu.eu.org



--__--__--

Message: 3
From: "Antti Korpela" 
To: 
Subject: iptables questions
Date: Sat, 15 Nov 2003 12:51:40 +0200

This is a multi-part message in MIME format.

------=_NextPart_000_0033_01C3AB77.3702E3A0
Content-Type: text/plain;
charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have here some questions and i hope you have some time to answer

1. What difference and which is better between: iptables -t nat -j =
MASQUERADE or SNAT --to IP if im using it for internet gateway =
NAT-machine in big LAN-parties, over 300 IP:s.
2. I have get this error often "too much work on eth0, dropping =
packet..." what this mean? do i have to put this on kernel:
echo "65000" > /proc/sys/net/ipv4/ip_conntrack_max ? is there any other =
solutions for this ?
3. Do you have some other tips for MASQ ? :)

Thanks for your time and support!
------=_NextPart_000_0033_01C3AB77.3702E3A0
Content-Type: text/html;
charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



charset=3Diso-8859-1">




Hi,

 

I have here some questions and i hope =
you have some=20
time to answer

 

1. What difference and which is better =
between:=20
iptables -t nat -j MASQUERADE or SNAT --to IP if im using it for =
internet=20
gateway NAT-machine in big LAN-parties, over 300 IP:s.

2. I have get this error often "too =
much work on=20
eth0, dropping packet..." what this mean? do i have to put this on=20
kernel:

echo "65000" >=20
/proc/sys/net/ipv4/ip_conntrack_max ? is there any other solutions for =
this=20
?

3. Do you have some =
other tips for=20
MASQ ? :)

 

Thanks for your time and =

support!


------=_NextPart_000_0033_01C3AB77.3702E3A0--



--__--__--

Message: 4
From: "Michael Menges" 
To: 
Subject: iptables ipforwarding issue
Date: Sat, 15 Nov 2003 22:31:04 -0500

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C3ABC8.27E2F4E0
Content-Type: text/plain;
charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just upgraded to 2.4.22 kernel from 2.2.x and now must learn iptables =
just when I got ipchains down. ;)
Anyhow, i need some help getting my firewall box to forward traffic for =
certain services, formost https.

Here's what I have thus far:
iptables -P FORWARD DROP
iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED
iptables -A FORWARD -j ACCEPT -p tcp -i eth0 -o eth1 -d 12.249.0.0/16 =
--dport 443

12.249.0.0/16 is eth0 and is my inet connection. 192.168.0.0/24 is eth1 =
and is my localnet interface.
Where do I go from here to bridge the gap allowing access to my https =
server inside my localnet?

Thanks for any help you might spare me. ;)

Mike


------=_NextPart_000_0005_01C3ABC8.27E2F4E0
Content-Type: text/html;
charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



charset=3Diso-8859-1">




Just upgraded to 2.4.22 =
kernel from=20
2.2.x and now must learn iptables just when I got ipchains down. =
;)

Anyhow, i need some =
help getting my=20
firewall box to forward traffic for certain services, formost=20
https.

 

Here's what I have thus =

far:

iptables -P FORWARD =
DROP

iptables -A FORWARD -j =
ACCEPT -m=20
state --state ESTABLISHED,RELATED

iptables -A FORWARD -j =
ACCEPT -p tcp=20
-i eth0 -o eth1 -d 12.249.0.0/16 --dport 443

 

12.249.0.0/16 is eth0 =
and is my inet=20
connection.  192.168.0.0/24 is eth1 and is my localnet=20
interface.

Where do I go from =
here to=20
bridge the gap allowing access to my https server inside my=20
localnet?

 

Thanks for any help you =
might spare=20
me. ;)

 

Mike

 

 


------=_NextPart_000_0005_01C3ABC8.27E2F4E0--


--__--__--

Message: 5
Subject: RE: A little help?
Date: Mon, 17 Nov 2003 13:46:47 +0800
From: "Chris Winfield-Blum" 
To: , 

Hopefully My answers will help

Thanks Guys


-----Original Message-----
From: Mark E. Donaldson [mailto:markee@bandwidthco.com]
Sent: Sunday, November 16, 2003 5:17 AM
To: Chris Winfield-Blum; netfilter@lists.samba.org
Subject: RE: A little help?


Chris - couple of questions for you:

1. You have supplied two scripts here. Which one are you trying to =
use, or
which one do you want help with to solve your problem? That will help
narrow the focus down.

# ANSWER #

I am currently using fw.leadside which is working but not allowing =
everything to be forwarded to the Proxy server as required.

fw_leadingside is the script that I started to write to do the proxy =
server side of it HOWEVER this is not working...
so when giving suggestions maybe use this one as the base


2. What specific problems are you having now with your firewall? You
mention that Guard Dog is "stuffing up" iptables, but this means very =
little
to me. If you could be more specific as to what is not working that =
would
be helpful.

# ANSWER #

I stopped using Guarddog and started writing the iptables script to =
enter all the information in...
At the moment I need to:
** create a "group" of $CLIENTS that are machine within the IP range of =
192.168.1.11-192.168.1.249
** have $CLIENTS automatically Forwarded to 3128 for web requests. (but =
leaving open 25 and 110 to go through normal firwall rules not the =
proxy)
** I then need everything other port blocked so that Yahoo and MSN etc =
wont go through another port.



3. What type of connection are your internal clients connected to? Do =
they
have static IP's, or are they being assigned IP's by DHCP?

# ANSWER #

Machines in the LAN are set IP's via DHCP which is done by another =
machine on the network. but servers etc are Static IP's

4. You have several Rule chains defined (i.e. firewalled, tcpflags,
silent), and yet I don't see any rules for these. What are you trying =
to do
here?

# ANSWER #

To be honest I dont know! haha I have pulled these things out of other =
scripts etc...


Clear up some of these questions and issues, and someone may be able to =
help
you. Right now, there are too many unknowns and unexplained issues.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris
Winfield-Blum
Sent: Friday, November 14, 2003 12:46 AM
To: netfilter@lists.samba.org
Subject: A little help?

Hi everyone.. i hope that one of you may be able to help...

Hi my name is Chris and I'm currently setting up a firewall for my =
office.
However I am pretty much a novice and am having some problems... I read =
one
of your scripts and thought you would be a good person to get in contact
with IF i could.
=20
I have a firewall up and running BUT my boss is wanting me to block =
Instant
Messaging... I have worked out HOW to do this however the system that I =
had
working was causing problems with the email (i was using Guarddog for =
KDE)=20

So i have resorted to handwriting everything as I should probably have =
done
before hand.

I was hoping that you would be able to help me out... I am limited by =
what I
can do to the network because this is a "stable" network (even though =
they
did not have a firewall before I cam 3 weeks ago)=20

I have installed a Proxy server on the same box as the firewall and the
rules successfully prevent clients from accessing yahoo and msn (which a
normal firewall wouldnt because they would go through on port 80 etc)

BUT when guarddog was used it was stuffing up the IPtables.. (eg i would
open Port 80 and it would close it)

EXACTLY WHAT I NEED
------------------------------------

I need to have two sections to the firewall.. one being the server and
priviledged machine (kind of like DMZ BUT on the same ip range as the
clients much to my disgust)=20

Local Clients are from 192.168.1.11-192.168.1.249 (not my setup)

I want any machines that are not included in this to NOT have to go =
through
the Firewall if possible. If not all of them I need the mail server
(residing on 192.168.1.251) to not be if possible.

I would like the following ports FORWARDED to 192.168.1.251
25 80 110 443
that way the squid will do the rules to filter out bad ports etc =
(right?)

I would like all machines that are clients to be Automatically FORWARDED =
to
port 3128 so that the rules can stpo the chatting etc

I have given links my "attempt" at this but am really stuck on it.. I
realise you have probably got better things to spend your time with but =
I
would be eternally grateful. this would take me HOURS but probably take =
you
minutes. I hope to hear from you soon

http://web.igateway.com.au/~chrislive/iptables/fw.leadside
http://web.igateway.com.au/~chrislive/iptables/fw_leadingside


Thankyou




--__--__--

Message: 6
Date: Mon, 17 Nov 2003 09:56:01 +0100
From: Harald Welte 
To: William Stearns 
Cc: Fabrice Marie ,
ML-netfilter ,
ML-netfilter-devel ,
webmaster@netfilter.org, Don Cohen 
Subject: Re: Documentation for the u32 module


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2003 at 05:06:38PM -0500, William Stearns wrote:
> > Would you be willing to merge your u32 documentation with that?
>=20
> Harald, I'd be honored to!

;) don't exaggerate.

> With the help of http://www.stearns.org/html2sgml :-), I've got=20
> that article in sgml form, ready to go. Fabrice, I've patched against=20
> your 1.30 Netfilter-extensions-HOWTO. Here are the files of interest:
>=20
> http://www.stearns.org/patches/netfilter-extensions-HOWTO.1.31.sgml

ok, i've merged your patch to our CVS repository. Will do a homepage
update soon, so it becomes visible to the public.

> Cheers,
> - Bill

--=20
- Harald Welte http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"Fragmentation is like classful addressing -- an interesting early
architectural error that shows how much experimentation was going
on while IP was being designed." -- Paul Vixie

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/uI0hXaXGVTD0i/8RAi/4AJsENdkPLtyUSlkzbNR77q9knqNTaACcDF8m
cvZ4Rxn9E06CLEOvvd2odV0=
=FGKJ
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--


--__--__--

Message: 7
Subject: Re: System Load
From: Ray Leach 
To: Netfilter Mailing List 
Organization: Knowledge Factory
Date: Mon, 17 Nov 2003 11:16:25 +0200


--=-ZVqAuk+RHfflLEG46SSS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-11-14 at 11:34, Rohit wrote:
> Hi,
> Is it possible to know how much system resources (cpu/memory load) that =
the=20
> netfilter module(s) is using? We are using HTB to shape our client traffi=
c=20
> and there are 4 iptables rule for each client in the mangle table. I thin=
k it=20
> will be helpful to gather such data and graph it using mrtg.
>=20
Just remember, iptables is only used to mark the traffic. tc is used to
classify and shape the traffic.

> I'm really sorry if someone has already asked about it.
> Thanks a lot.
>=20
> with regards,
> Rohit Nepali
--=20
--
Raymond Leach 
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD 00EE 8757 EE47 F06F FB28
--

--=-ZVqAuk+RHfflLEG46SSS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/uJHoh1fuR/Bv+ygRAjUcAKCtTAFtc542TkCT2IkWU/0L1deEJQCfXxlV
qtrQURczttsOsmUpusF3eB0=
=/ohx
-----END PGP SIGNATURE-----

--=-ZVqAuk+RHfflLEG46SSS--



--__--__--

Message: 8
Subject: Re: Caching of rules in PRE(POST)ROUTING chains?
From: Ray Leach 
To: Netfilter Mailing List 
Organization: Knowledge Factory
Date: Mon, 17 Nov 2003 11:17:51 +0200


--=-R6kr7jzDTsYK5346dY5I
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-11-15 at 10:07, Pavel V. Yanchenko wrote:
> Hello.
>=20
> As far as I understand, rules in PRE- and POSTROUTING chains are
> cached? Because when I delete a rule with SNAT target for ip
> 192.168.10.10 this address's packets are still SNATed for several
> minutes. The same thing happens for rules in PREROUTING chains.
Isn't it the connection tracking table that's cached and NOT the rules?
Active connections need to timeout first.

> Is it possible to disable this feature? Maybe there is some file in
> /proc where cached rules are listed?
>=20
> Thanks in advance.
--=20
--
Raymond Leach 
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD 00EE 8757 EE47 F06F FB28
--

--=-R6kr7jzDTsYK5346dY5I
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/uJI+h1fuR/Bv+ygRAn4bAJ9tYmiWX2PA+cS18dFKoqmQViRBhwCffyZL
0j3VRb3ceKZow9N0BFR+XMk=
=RYO/
-----END PGP SIGNATURE-----

--=-R6kr7jzDTsYK5346dY5I--



--__--__--

Message: 9
From: Antony Stone 
Organization: Software Solutions
To: netfilter@lists.netfilter.org
Subject: Re: Caching of rules in PRE(POST)ROUTING chains?
Date: Mon, 17 Nov 2003 09:24:42 +0000

On Saturday 15 November 2003 8:07 am, Pavel V. Yanchenko wrote:

> Hello.
>
> As far as I understand, rules in PRE- and POSTROUTING chains are
> cached? Because when I delete a rule with SNAT target for ip
> 192.168.10.10 this address's packets are still SNATed for several
> minutes. The same thing happens for rules in PREROUTING chains.
> Is it possible to disable this feature? Maybe there is some file in
> /proc where cached rules are listed?

No, there is no caching of rules in netfilter; however, packets which are 
part of an ESTABLISHED connection will continue to be processed without 
reference to the rules in PRE/POSTROUTING because of the connection tracking 
table entry - onlt the first packets of connections ever go through the 
explicit rules in these tables - all following packets are automagically 
processed behind the scenes.

This is the effect you are seeing, I'm sure.

Antony.

-- 

Christianity tells you to work hard today for little or no reward, and 
tomorrow you will die and awake in paradise.

Marxism says work hard today for little or no reward; tomorrow you will die 
and your children will awake in paradise.

- Len Deighton, Billion Dollar Brain
Please reply to the list;
please don't CC me.


--__--__--

Message: 10
Date: Mon, 17 Nov 2003 11:06:42 +0100
From: Martin Petruzzi 
To: netfilter@lists.netfilter.org
Subject: Changes in kernel >= 2.4.20 ?

Hello

Apparently there have been changes in kernel since 2.4.20 concerning netfilters. NAT, masqerading, forwarding or whatever it is called does not work the same as before. I have the rules as following:

#!/bin/bash
/sbin/modprobe iptable_nat
/opt/sbin/iptables -F
/opt/sbin/iptables -X
/opt/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
...
and so on.

This worked perfect with kernels < 2.4.20. Now I'm on 2.4.22 and NAT only works partially. The system is RH7.2. I tried the latest iptables from updates.redhat.com and also compiled the latest from netfilter.org. I had no errors at all, nor while compiling (kernel/iptables) neigther while installing or inserting the roules.


=== message truncated ===
--0-1671727789-1069084265=:41692
Content-Type: text/html; charset=us-ascii

<DIV><BR>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am new studing Network Security and iptables. The questions and answers are very helpful&nbsp;as a student. Any quick way on how to write iptables and policy. I am struggling.</DIV>
<DIV>&nbsp;</DIV>
<DIV>bill<BR><B><I>netfilter-request@lists.netfilter.org</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Send netfilter mailing list submissions to<BR>netfilter@lists.netfilter.org<BR><BR>To subscribe or unsubscribe via the World Wide Web, visit<BR>https://lists.netfilter.org/mailman/listinfo/netfilter<BR>or, via email, send a message with subject or body 'help' to<BR>netfilter-request@lists.netfilter.org<BR><BR>You can reach the person managing the list at<BR>netfilter-admin@lists.netfilter.org<BR><BR>When replying, please edit your Subject line so it is more specific<BR>than "Re: Contents of netfilter digest..."<BR><BR><BR>Today's Topics:<BR><BR>1. System Load (Rohit)<BR>2. Caching of rules in PRE(POST)ROUTING chains? (Pavel V. Yanchenko)<BR>3. iptables questions (Antti Korpela)<BR>4. iptables ipforwarding issue (Michael Menges)<BR>5. RE: A little help? (Chris Winfield-Blum)<BR>6. Re: Documentation for the u32 module (Harald Welte)<BR>7. Re: System Load (Ray Leach)<BR>8. Re: Ca
 ching of
 rules in PRE(POST)ROUTING chains? (Ray Leach)<BR>9. Re: Caching of rules in PRE(POST)ROUTING chains? (Antony Stone)<BR>10. Changes in kernel &gt;= 2.4.20 ? (Martin Petruzzi)<BR>11. Re: System Load (bikrant@wlink.com.np)<BR><BR>--__--__--<BR><BR>Message: 1<BR>From: Rohit <BIKRANT_ML@WLINK.COM.NP><BR>To: netfilter@lists.netfilter.org<BR>Subject: System Load<BR>Date: Fri, 14 Nov 2003 15:19:11 +0545<BR>Cc: lartc@mailman.ds9a.nl<BR><BR>Hi,<BR>Is it possible to know how much system resources (cpu/memory load) that the <BR>netfilter module(s) is using? We are using HTB to shape our client traffic <BR>and there are 4 iptables rule for each client in the mangle table. I think it <BR>will be helpful to gather such data and graph it using mrtg.<BR><BR>I'm really sorry if someone has already asked about it.<BR>Thanks a lot.<BR><BR>with regards,<BR>Rohit Nepali<BR><BR><BR>--__--__--<BR><BR>Message: 2<BR>Date: Sat, 15 Nov 2003 11:07:35 +0300<BR>From: "Pavel V. Yanchenko"
 <BALROG@MSMU.EU.ORG><BR>Reply-To: balrog@msmu.eu.org<BR>To: netfilter@lists.netfilter.org<BR>Subject: Caching of rules in PRE(POST)ROUTING chains?<BR><BR>Hello.<BR><BR>As far as I understand, rules in PRE- and POSTROUTING chains are<BR>cached? Because when I delete a rule with SNAT target for ip<BR>192.168.10.10 this address's packets are still SNATed for several<BR>minutes. The same thing happens for rules in PREROUTING chains.<BR>Is it possible to disable this feature? Maybe there is some file in<BR>/proc where cached rules are listed?<BR><BR>Thanks in advance.<BR><BR>-- <BR>Best regards,<BR>Pavel mailto:balrog@msmu.eu.org<BR><BR><BR><BR>--__--__--<BR><BR>Message: 3<BR>From: "Antti Korpela" <ANTTI.KORPELA@PP6.INET.FI><BR>To: <NETFILTER@LISTS.NETFILTER.ORG><BR>Subject: iptables questions<BR>Date: Sat, 15 Nov 2003 12:51:40 +0200<BR><BR>This is a multi-part message in MIME format.<BR><BR>------=_NextPart_000_0033_01C3AB77.3702E3A0<BR>Content-Type:
 text/plain;<BR>charset="iso-8859-1"<BR>Content-Transfer-Encoding: quoted-printable<BR><BR>Hi,<BR><BR>I have here some questions and i hope you have some time to answer<BR><BR>1. What difference and which is better between: iptables -t nat -j =<BR>MASQUERADE or SNAT --to IP if im using it for internet gateway =<BR>NAT-machine in big LAN-parties, over 300 IP:s.<BR>2. I have get this error often "too much work on eth0, dropping =<BR>packet..." what this mean? do i have to put this on kernel:<BR>echo "65000" &gt; /proc/sys/net/ipv4/ip_conntrack_max ? is there any other =<BR>solutions for this ?<BR>3. Do you have some other tips for MASQ ? :)<BR><BR>Thanks for your time and support!<BR>------=_NextPart_000_0033_01C3AB77.3702E3A0<BR>Content-Type: text/html;<BR>charset="iso-8859-1"<BR>Content-Transfer-Encoding: quoted-printable<BR><BR><BR><BR>
<META http-equiv=3DContent-Type content='3D"text/html;' ="<br">charset=3Diso-8859-1"&gt;<BR>
<META content='3D"MSHTML' name=3DGENERATOR 6.00.2800.1276?><BR>
<STYLE></STYLE>
<BR><BR><BR>
<DIV><FONT face=3DArial size=3>Hi,</FONT></DIV><BR>
<DIV><FONT face=3DArial size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial size=3>I have here some questions and i hope =<BR>you have some=20<BR>time to answer</FONT></DIV><BR>
<DIV><FONT face=3DArial size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial size=3>1. What difference and which is better =<BR>between:=20<BR>iptables -t nat -j MASQUERADE&nbsp;or SNAT --to IP if im using it for =<BR>internet=20<BR>gateway NAT-machine in big LAN-parties, over 300 IP:s.</FONT></DIV><BR>
<DIV><FONT face=3DArial size=3>2. I have get this error often "too =<BR>much work on=20<BR>eth0, dropping packet..." what this mean? do i have to put this on=20<BR>kernel:</FONT></DIV><BR>
<DIV><FONT face=3DArial size=3><FONT size=3>echo "65000" &gt;=20<BR>/proc/sys/net/ipv4/ip_conntrack_max ? is there any other solutions for =<BR>this=20<BR>?</FONT></FONT></DIV><BR>
<DIV><FONT face=3DArial size=3><FONT size=3>3. Do you have some =<BR>other tips for=20<BR>MASQ ? :)</FONT></FONT></DIV><BR>
<DIV><FONT face=3DArial size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial size=3><FONT size=3>Thanks for your time and =<BR><BR>support!</DIV></FONT></FONT><BR><BR>------=_NextPart_000_0033_01C3AB77.3702E3A0--<BR><BR><BR><BR>--__--__--<BR><BR>Message: 4<BR>From: "Michael Menges" <SNIPAH9@HOTMAIL.COM><BR>To: <NETFILTER@LISTS.NETFILTER.ORG><BR>Subject: iptables ipforwarding issue<BR>Date: Sat, 15 Nov 2003 22:31:04 -0500<BR><BR>This is a multi-part message in MIME format.<BR><BR>------=_NextPart_000_0005_01C3ABC8.27E2F4E0<BR>Content-Type: text/plain;<BR>charset="iso-8859-1"<BR>Content-Transfer-Encoding: quoted-printable<BR><BR>Just upgraded to 2.4.22 kernel from 2.2.x and now must learn iptables =<BR>just when I got ipchains down. ;)<BR>Anyhow, i need some help getting my firewall box to forward traffic for =<BR>certain services, formost https.<BR><BR>Here's what I have thus far:<BR>iptables -P FORWARD DROP<BR>iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED<BR>iptables -A FORWARD -j ACCEPT -p tcp -i eth0 -o e
 th1 -d
 12.249.0.0/16 =<BR>--dport 443<BR><BR>12.249.0.0/16 is eth0 and is my inet connection. 192.168.0.0/24 is eth1 =<BR>and is my localnet interface.<BR>Where do I go from here to bridge the gap allowing access to my https =<BR>server inside my localnet?<BR><BR>Thanks for any help you might spare me. ;)<BR><BR>Mike<BR><BR><BR>------=_NextPart_000_0005_01C3ABC8.27E2F4E0<BR>Content-Type: text/html;<BR>charset="iso-8859-1"<BR>Content-Transfer-Encoding: quoted-printable<BR><BR><BR><BR>
<META http-equiv=3DContent-Type content='3D"text/html;' ="<br">charset=3Diso-8859-1"&gt;<BR>
<META content='3D"MSHTML' name=3DGENERATOR 6.00.2800.1264?><BR>
<STYLE></STYLE>
<BR><BR><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Just upgraded to 2.4.22 =<BR>kernel from=20<BR>2.2.x and now must learn iptables just when I got ipchains down. =<BR>;)</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Anyhow, i need some =<BR>help getting my=20<BR>firewall box to forward traffic for certain services, formost=20<BR>https.</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Here's what I have thus =<BR><BR>far:</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>iptables -P FORWARD =<BR>DROP</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>iptables -A FORWARD -j =<BR>ACCEPT -m=20<BR>state --state ESTABLISHED,RELATED</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>iptables -A FORWARD -j =<BR>ACCEPT -p tcp=20<BR>-i eth0 -o eth1 -d&nbsp;12.249.0.0/16 --dport 443</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>12.249.0.0/16 is eth0 =<BR>and is my inet=20<BR>connection.&nbsp; 192.168.0.0/24 is eth1 and is my localnet=20<BR>interface.</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Where do I go from =<BR>here&nbsp;to=20<BR>bridge the gap allowing access to my https server inside my=20<BR>localnet?</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Thanks for any help you =<BR>might spare=20<BR>me. ;)</FONT></DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3></FONT>&nbsp;</DIV><BR>
<DIV><FONT face=3DArial color=#3d000f size=3>Mike</FONT></DIV><BR>
<DIV>&nbsp;</DIV><BR>
<DIV>&nbsp;</DIV><BR><BR>------=_NextPart_000_0005_01C3ABC8.27E2F4E0--<BR><BR><BR>--__--__--<BR><BR>Message: 5<BR>Subject: RE: A little help?<BR>Date: Mon, 17 Nov 2003 13:46:47 +0800<BR>From: "Chris Winfield-Blum" <CHRIS@LEADINGSIDE.COM.MY><BR>To: <MARKEE@BANDWIDTHCO.COM>, <NETFILTER@LISTS.SAMBA.ORG><BR><BR>Hopefully My answers will help<BR><BR>Thanks Guys<BR><BR><BR>-----Original Message-----<BR>From: Mark E. Donaldson [mailto:markee@bandwidthco.com]<BR>Sent: Sunday, November 16, 2003 5:17 AM<BR>To: Chris Winfield-Blum; netfilter@lists.samba.org<BR>Subject: RE: A little help?<BR><BR><BR>Chris - couple of questions for you:<BR><BR>1. You have supplied two scripts here. Which one are you trying to =<BR>use, or<BR>which one do you want help with to solve your problem? That will help<BR>narrow the focus down.<BR><BR># ANSWER #<BR><BR>I am currently using fw.leadside which is working but not allowing =<BR>everything to be forwarded to the Proxy server as required.<BR><BR>fw_leadi
 ngside
 is the script that I started to write to do the proxy =<BR>server side of it HOWEVER this is not working...<BR>so when giving suggestions maybe use this one as the base<BR><BR><BR>2. What specific problems are you having now with your firewall? You<BR>mention that Guard Dog is "stuffing up" iptables, but this means very =<BR>little<BR>to me. If you could be more specific as to what is not working that =<BR>would<BR>be helpful.<BR><BR># ANSWER #<BR><BR>I stopped using Guarddog and started writing the iptables script to =<BR>enter all the information in...<BR>At the moment I need to:<BR>** create a "group" of $CLIENTS that are machine within the IP range of =<BR>192.168.1.11-192.168.1.249<BR>** have $CLIENTS automatically Forwarded to 3128 for web requests. (but =<BR>leaving open 25 and 110 to go through normal firwall rules not the =<BR>proxy)<BR>** I then need everything other port blocked so that Yahoo and MSN etc =<BR>wont go through another port.<BR><BR><BR><BR>3. What ty
 pe of
 connection are your internal clients connected to? Do =<BR>they<BR>have static IP's, or are they being assigned IP's by DHCP?<BR><BR># ANSWER #<BR><BR>Machines in the LAN are set IP's via DHCP which is done by another =<BR>machine on the network. but servers etc are Static IP's<BR><BR>4. You have several Rule chains defined (i.e. firewalled, tcpflags,<BR>silent), and yet I don't see any rules for these. What are you trying =<BR>to do<BR>here?<BR><BR># ANSWER #<BR><BR>To be honest I dont know! haha I have pulled these things out of other =<BR>scripts etc...<BR><BR><BR>Clear up some of these questions and issues, and someone may be able to =<BR>help<BR>you. Right now, there are too many unknowns and unexplained issues.<BR><BR>-----Original Message-----<BR>From: netfilter-admin@lists.netfilter.org<BR>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris<BR>Winfield-Blum<BR>Sent: Friday, November 14, 2003 12:46 AM<BR>To: netfilter@lists.samba.org<BR>Subject: A little
 help?<BR><BR>Hi everyone.. i hope that one of you may be able to help...<BR><BR>Hi my name is Chris and I'm currently setting up a firewall for my =<BR>office.<BR>However I am pretty much a novice and am having some problems... I read =<BR>one<BR>of your scripts and thought you would be a good person to get in contact<BR>with IF i could.<BR>=20<BR>I have a firewall up and running BUT my boss is wanting me to block =<BR>Instant<BR>Messaging... I have worked out HOW to do this however the system that I =<BR>had<BR>working was causing problems with the email (i was using Guarddog for =<BR>KDE)=20<BR><BR>So i have resorted to handwriting everything as I should probably have =<BR>done<BR>before hand.<BR><BR>I was hoping that you would be able to help me out... I am limited by =<BR>what I<BR>can do to the network because this is a "stable" network (even though =<BR>they<BR>did not have a firewall before I cam 3 weeks ago)=20<BR><BR>I have installed a Proxy server on the same box a
 s the
 firewall and the<BR>rules successfully prevent clients from accessing yahoo and msn (which a<BR>normal firewall wouldnt because they would go through on port 80 etc)<BR><BR>BUT when guarddog was used it was stuffing up the IPtables.. (eg i would<BR>open Port 80 and it would close it)<BR><BR>EXACTLY WHAT I NEED<BR>------------------------------------<BR><BR>I need to have two sections to the firewall.. one being the server and<BR>priviledged machine (kind of like DMZ BUT on the same ip range as the<BR>clients much to my disgust)=20<BR><BR>Local Clients are from 192.168.1.11-192.168.1.249 (not my setup)<BR><BR>I want any machines that are not included in this to NOT have to go =<BR>through<BR>the Firewall if possible. If not all of them I need the mail server<BR>(residing on 192.168.1.251) to not be if possible.<BR><BR>I would like the following ports FORWARDED to 192.168.1.251<BR>25 80 110 443<BR>that way the squid will do the rules to filter out bad ports etc =<BR>(right?)<B
 R><BR>I
 would like all machines that are clients to be Automatically FORWARDED =<BR>to<BR>port 3128 so that the rules can stpo the chatting etc<BR><BR>I have given links my "attempt" at this but am really stuck on it.. I<BR>realise you have probably got better things to spend your time with but =<BR>I<BR>would be eternally grateful. this would take me HOURS but probably take =<BR>you<BR>minutes. I hope to hear from you soon<BR><BR>http://web.igateway.com.au/~chrislive/iptables/fw.leadside<BR>http://web.igateway.com.au/~chrislive/iptables/fw_leadingside<BR><BR><BR>Thankyou<BR><BR><BR><BR><BR>--__--__--<BR><BR>Message: 6<BR>Date: Mon, 17 Nov 2003 09:56:01 +0100<BR>From: Harald Welte <LAFORGE@NETFILTER.ORG><BR>To: William Stearns <WSTEARNS@POBOX.COM><BR>Cc: Fabrice Marie <FABRICE@NETFILTER.ORG>,<BR>ML-netfilter <NETFILTER@LISTS.NETFILTER.ORG>,<BR>ML-netfilter-devel <NETFILTER-DEVEL@LISTS.NETFILTER.ORG>,<BR>webmaster@netfilter.org, Don Cohen <DON-NFIL@ISIS.CS3-INC.COM><BR>Subject: Re:
 Documentation for the u32 module<BR><BR><BR>--SO98HVl1bnMOfKZd<BR>Content-Type: text/plain; charset=us-ascii<BR>Content-Disposition: inline<BR>Content-Transfer-Encoding: quoted-printable<BR><BR>On Sat, Nov 15, 2003 at 05:06:38PM -0500, William Stearns wrote:<BR>&gt; &gt; Would you be willing to merge your u32 documentation with that?<BR>&gt;=20<BR>&gt; Harald, I'd be honored to!<BR><BR>;) don't exaggerate.<BR><BR>&gt; With the help of http://www.stearns.org/html2sgml :-), I've got=20<BR>&gt; that article in sgml form, ready to go. Fabrice, I've patched against=20<BR>&gt; your 1.30 Netfilter-extensions-HOWTO. Here are the files of interest:<BR>&gt;=20<BR>&gt; http://www.stearns.org/patches/netfilter-extensions-HOWTO.1.31.sgml<BR><BR>ok, i've merged your patch to our CVS repository. Will do a homepage<BR>update soon, so it becomes visible to the public.<BR><BR>&gt; Cheers,<BR>&gt; - Bill<BR><BR>--=20<BR>- Harald Welte
 <LAFORGE@NETFILTER.ORG>http://www.netfilter.org/<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=<BR>=3D<BR>"Fragmentation is like classful addressing -- an interesting early<BR>architectural error that shows how much experimentation was going<BR>on while IP was being designed." -- Paul Vixie<BR><BR>--SO98HVl1bnMOfKZd<BR>Content-Type: application/pgp-signature<BR>Content-Disposition: inline<BR><BR>-----BEGIN PGP SIGNATURE-----<BR>Version: GnuPG v1.2.3 (GNU/Linux)<BR><BR>iD8DBQE/uI0hXaXGVTD0i/8RAi/4AJsENdkPLtyUSlkzbNR77q9knqNTaACcDF8m<BR>cvZ4Rxn9E06CLEOvvd2odV0=<BR>=FGKJ<BR>-----END PGP SIGNATURE-----<BR><BR>--SO98HVl1bnMOfKZd--<BR><BR><BR>--__--__--<BR><BR>Message: 7<BR>Subject: Re: System Load<BR>From: Ray Leach <RAYMONDL@KNOWLEDGEFACTORY.CO.ZA><BR>To: Netfilter Mailing List
 <NETFILTER@LISTS.NETFILTER.ORG><BR>Organization: Knowledge Factory<BR>Date: Mon, 17 Nov 2003 11:16:25 +0200<BR><BR><BR>--=-ZVqAuk+RHfflLEG46SSS<BR>Content-Type: text/plain<BR>Content-Transfer-Encoding: quoted-printable<BR><BR>On Fri, 2003-11-14 at 11:34, Rohit wrote:<BR>&gt; Hi,<BR>&gt; Is it possible to know how much system resources (cpu/memory load) that =<BR>the=20<BR>&gt; netfilter module(s) is using? We are using HTB to shape our client traffi=<BR>c=20<BR>&gt; and there are 4 iptables rule for each client in the mangle table. I thin=<BR>k it=20<BR>&gt; will be helpful to gather such data and graph it using mrtg.<BR>&gt;=20<BR>Just remember, iptables is only used to mark the traffic. tc is used to<BR>classify and shape the traffic.<BR><BR>&gt; I'm really sorry if someone has already asked about it.<BR>&gt; Thanks a lot.<BR>&gt;=20<BR>&gt; with regards,<BR>&gt; Rohit Nepali<BR>--=20<BR>--<BR>Raymond Leach <RAYMONDL@KNOWLEDGEFACTORY.CO.ZA><BR>Network Support
 Specialist<BR>http://www.knowledgefactory.co.za<BR>"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"<BR>Key fingerprint =3D 7209 A695 9EE0 E971 A9AD 00EE 8757 EE47 F06F FB28<BR>--<BR><BR>--=-ZVqAuk+RHfflLEG46SSS<BR>Content-Type: application/pgp-signature; name=signature.asc<BR>Content-Description: This is a digitally signed message part<BR><BR>-----BEGIN PGP SIGNATURE-----<BR>Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)<BR><BR>iD8DBQA/uJHoh1fuR/Bv+ygRAjUcAKCtTAFtc542TkCT2IkWU/0L1deEJQCfXxlV<BR>qtrQURczttsOsmUpusF3eB0=<BR>=/ohx<BR>-----END PGP SIGNATURE-----<BR><BR>--=-ZVqAuk+RHfflLEG46SSS--<BR><BR><BR><BR>--__--__--<BR><BR>Message: 8<BR>Subject: Re: Caching of rules in PRE(POST)ROUTING chains?<BR>From: Ray Leach <RAYMONDL@KNOWLEDGEFACTORY.CO.ZA><BR>To: Netfilter Mailing List <NETFILTER@LISTS.NETFILTER.ORG><BR>Organization: Knowledge Factory<BR>Date: Mon, 17 Nov 2003 11:17:51 +0200<BR><BR><BR>--=-R6kr7jzDTsYK5346dY5I<BR>Content-Type:
 text/plain<BR>Content-Transfer-Encoding: quoted-printable<BR><BR>On Sat, 2003-11-15 at 10:07, Pavel V. Yanchenko wrote:<BR>&gt; Hello.<BR>&gt;=20<BR>&gt; As far as I understand, rules in PRE- and POSTROUTING chains are<BR>&gt; cached? Because when I delete a rule with SNAT target for ip<BR>&gt; 192.168.10.10 this address's packets are still SNATed for several<BR>&gt; minutes. The same thing happens for rules in PREROUTING chains.<BR>Isn't it the connection tracking table that's cached and NOT the rules?<BR>Active connections need to timeout first.<BR><BR>&gt; Is it possible to disable this feature? Maybe there is some file in<BR>&gt; /proc where cached rules are listed?<BR>&gt;=20<BR>&gt; Thanks in advance.<BR>--=20<BR>--<BR>Raymond Leach <RAYMONDL@KNOWLEDGEFACTORY.CO.ZA><BR>Network Support Specialist<BR>http://www.knowledgefactory.co.za<BR>"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"<BR>Key fingerprint =3D 7209 A695 9EE0 E971 A9AD 00EE 8757 EE47 F06F
 FB28<BR>--<BR><BR>--=-R6kr7jzDTsYK5346dY5I<BR>Content-Type: application/pgp-signature; name=signature.asc<BR>Content-Description: This is a digitally signed message part<BR><BR>-----BEGIN PGP SIGNATURE-----<BR>Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)<BR><BR>iD8DBQA/uJI+h1fuR/Bv+ygRAn4bAJ9tYmiWX2PA+cS18dFKoqmQViRBhwCffyZL<BR>0j3VRb3ceKZow9N0BFR+XMk=<BR>=RYO/<BR>-----END PGP SIGNATURE-----<BR><BR>--=-R6kr7jzDTsYK5346dY5I--<BR><BR><BR><BR>--__--__--<BR><BR>Message: 9<BR>From: Antony Stone <ANTONY@SOFT-SOLUTIONS.CO.UK><BR>Organization: Software Solutions<BR>To: netfilter@lists.netfilter.org<BR>Subject: Re: Caching of rules in PRE(POST)ROUTING chains?<BR>Date: Mon, 17 Nov 2003 09:24:42 +0000<BR><BR>On Saturday 15 November 2003 8:07 am, Pavel V. Yanchenko wrote:<BR><BR>&gt; Hello.<BR>&gt;<BR>&gt; As far as I understand, rules in PRE- and POSTROUTING chains are<BR>&gt; cached? Because when I delete a rule with SNAT target for ip<BR>&gt; 192.168.10.10 this address's packets are st
 ill
 SNATed for several<BR>&gt; minutes. The same thing happens for rules in PREROUTING chains.<BR>&gt; Is it possible to disable this feature? Maybe there is some file in<BR>&gt; /proc where cached rules are listed?<BR><BR>No, there is no caching of rules in netfilter; however, packets which are <BR>part of an ESTABLISHED connection will continue to be processed without <BR>reference to the rules in PRE/POSTROUTING because of the connection tracking <BR>table entry - onlt the first packets of connections ever go through the <BR>explicit rules in these tables - all following packets are automagically <BR>processed behind the scenes.<BR><BR>This is the effect you are seeing, I'm sure.<BR><BR>Antony.<BR><BR>-- <BR><BR>Christianity tells you to work hard today for little or no reward, and <BR>tomorrow you will die and awake in paradise.<BR><BR>Marxism says work hard today for little or no reward; tomorrow you will die <BR>and your children will awake in paradise.<BR><BR>- Len Deight
 on,
 Billion Dollar Brain<BR>Please reply to the list;<BR>please don't CC me.<BR><BR><BR>--__--__--<BR><BR>Message: 10<BR>Date: Mon, 17 Nov 2003 11:06:42 +0100<BR>From: Martin Petruzzi <M.PETRUZZI@BLUEWIN.CH><BR>To: netfilter@lists.netfilter.org<BR>Subject: Changes in kernel &gt;= 2.4.20 ?<BR><BR>Hello<BR><BR>Apparently there have been changes in kernel since 2.4.20 concerning netfilters. NAT, masqerading, forwarding or whatever it is called does not work the same as before. I have the rules as following:<BR><BR>#!/bin/bash<BR>/sbin/modprobe iptable_nat<BR>/opt/sbin/iptables -F<BR>/opt/sbin/iptables -X<BR>/opt/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward<BR>...<BR>and so on.<BR><BR>This worked perfect with kernels &lt; 2.4.20. Now I'm on 2.4.22 and NAT only works partially. The system is RH7.2. I tried the latest iptables from updates.redhat.com and also compiled the latest from netfilter.org. I had no errors at all, nor w
 hile
 compiling (kernel/iptables) neigther while installing or inserting the roules.<BR><BR><BR>=== message truncated ===</BLOCKQUOTE>
--0-1671727789-1069084265=:41692--

