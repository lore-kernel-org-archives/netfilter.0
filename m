From: "SKLim" <sklim@mfocus.com.my>
Subject: RE: netfilter digest, Vol 1 #2119 - 15 msgs
Date: Wed, 10 Jul 2002 14:01:33 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <BEENKHMJBJPABPBOHJJOGEBOCLAA.sklim@mfocus.com.my>
References: <20020709175021.271CA489F@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020709175021.271CA489F@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org



-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of
netfilter-request@lists.samba.org
Sent: Wednesday, July 10, 2002 1:50 AM
To: netfilter@lists.samba.org
Subject: netfilter digest, Vol 1 #2119 - 15 msgs


Send netfilter mailing list submissions to
	netfilter@lists.samba.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.samba.org/listinfo/netfilter
or, via email, send a message with subject or body 'help' to
	netfilter-request@lists.samba.org

You can reach the person managing the list at
	netfilter-admin@lists.samba.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of netfilter digest..."


Today's Topics:

   1. IPTables counters (Dotan Lior)
   2. Help with configuring the ip_nat_snmp_basic module (Eyal k)
   3. Re: IPTables counters (Antony Stone)
   4. tcp/udp ports (was: Re: HTTP Port forwarding issues) (James
Sneeringer)
   5. Redhat 7.2 Kernel (Mike G. Hammonds)
   6. Re: Redhat 7.2 Kernel (R. Sterenborg)
   7. H.323 and 2.4.18 kernel problem (Marcus Schopen)
   8. FW: PPTP through masquerading gateway (Rowan Reid)
   9. Do I need a firewall rule for RST ? (Jan Humme)
  10. Re: Redhat 7.2 Kernel (Matthias Kattanek)
  11. Speed Issues through NAT Firewall (Travis Crook)
  12. Re: Do I need a firewall rule for RST ? (Ramin Alidousti)
  13. Re: Speed Issues through NAT Firewall (Ramin Alidousti)
  14. Re: Redhat 7.2 Kernel (Jan Humme)
  15. Re: Speed Issues through NAT Firewall (Patrick Schaaf)

--__--__--

Message: 1
From: Dotan Lior <Lior.Dotan@innowave-ws.com>
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>
Subject: IPTables counters
Date: Tue, 9 Jul 2002 16:41:00 +0300

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2274E.43118830
Content-Type: text/plain

Hello,

I have a simple setup. A linux RH7.3 box doing NAT and connected to the
internet with one windows2000 client sitting behind it. I've set up iptables
to NAT the windows internal address to a legal IP address.
So far it works well, However when I inspect the NAT table with "iptables -L
-t nat -v -n -x",
the bytes counter shows extremely low values. I've transfer a 200Kb file via
FTP on the windows
client, but the counter was less than 100 bytes. It seems as if only the
first packet of a connection
is listed.
Is there a way to see the real bytes count? Also I would to know the number
of bytes that traveled
on both ways (from the client and to the client), is that also possible
using iptables?

Thanks.

------_=_NextPart_001_01C2274E.43118830
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2652.35">
<TITLE>IPTables counters</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">Hello,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">I have a simple setup. A linux RH7.3 =
box doing NAT and connected to the internet with one windows2000 client =
sitting behind it. I've set up iptables to NAT the windows internal =
address to a legal IP address.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">So far it works well, However when I =
inspect the NAT table with &quot;iptables -L -t nat -v -n -x&quot;, =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">the bytes counter shows extremely =
low values. I've transfer a 200Kb file via FTP on the windows</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">client, but the counter was less =
than 100 bytes. It seems as if only the first packet of a =
connection</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">is listed.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">Is there a way to see the real bytes =
count? Also I would to know the number of bytes that traveled</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">on both ways (from the client and to =
the client), is that also possible using iptables?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">Thanks.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2274E.43118830--


--__--__--

Message: 2
From: "Eyal k" <lalala103@hotmail.com>
To: netfilter@lists.samba.org
Subject: Help with configuring the ip_nat_snmp_basic module
Date: Tue, 09 Jul 2002 16:52:43 +0300


Hi. I'm having difficulties setting up the ip_nat_snmp_basic module.
I can't seem to find information how to define mapping rules for it, there's
no documentation of anything alike in iptables and ipchains.
If any of you could shed a light on this, I would be grateful.

Thanx in advance,
Eyal




_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com



--__--__--

Message: 3
From: Antony Stone <Antony@Soft-Solutions.co.uk>
Organization: Software Solutions
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>
Subject: Re: IPTables counters
Date: Tue, 9 Jul 2002 15:03:38 +0100

On Tuesday 09 July 2002 2:41 pm, Dotan Lior wrote:

> Hello,
>
> So far it works well, However when I inspect the NAT table with "iptables
> -L -t nat -v -n -x", the bytes counter shows extremely low values. I've
> transfer a 200Kb file via FTP on the windows client, but the counter was
> less than 100 bytes. It seems as if only the first packet of a connection
> is listed.

That is correct.   Only the first packet goes through the listed NAT rules -
the others go directly via the connection tracking table and not through the
rules (for efficiency).

> Is there a way to see the real bytes count? Also I would to know the
number
> of bytes that traveled on both ways (from the client and to the client),
is
> that also possible using iptables?

Yes, simply look at the filter table (ie the default one) instead of the NAT
table.

*All* packets pass through your filtering rules (that's why you need the
rules for ESTABLISHED and RELATED packets), so just use

iptables -L -n -v -x without the -t nat option.

Remember you can create rules without targets if you want to see the
packet/byte counters for them without doing anything else:

eg iptables -A FORWARD -i eth0
iptables -A FORWARD -i eth1



Antony.


--__--__--

Message: 4
Date: Tue, 9 Jul 2002 09:15:22 -0500
From: James Sneeringer <james+netfilter@vincentsystems.com>
To: netfilter@lists.samba.org
Subject: tcp/udp ports (was: Re: HTTP Port forwarding issues)

On Tue, Jul 09, 2002 at 11:52:39AM +0200, Jan Humme wrote:
| Of course, HTTP runs over TCP, but who can explain why in /etc/services:
| http		80/tcp		www www-http	# WorldWideWeb HTTP
| http		80/udp		www www-http	# HyperText Transfer Protocol

The IANA frequently allocates the same port for both protocols.  Take a
look at RFC 1700.  You'll see that most services have both TCP and UDP
ports reserved, even though most probably use only one of them.

| Ports and port numbers are different for TCP and UDP, right?

Correct.  Look at ports 512, 513, and 514 in /etc/services.

-James



--__--__--

Message: 5
From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
To: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>
Subject: Redhat 7.2 Kernel
Date: Tue, 9 Jul 2002 10:17:12 -0400

Does the default install kernel of RH7.2 have iptable support already
compiled in it?

Mike Hammonds
Fellon-McCord & Associates, Inc.
Information Services Manager
Voice (502) 214-6324 Fax (502)426-8800
mhammonds@knowledgeinenergy.com <mailto:mhammonds@knowledgeinenergy.com >



--__--__--

Message: 6
From: "R. Sterenborg" <rsterenborg@xs4all.nl>
To: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>
Subject: Re: Redhat 7.2 Kernel
Date: Tue, 9 Jul 2002 16:38:15 +0200

----- Original Message -----
From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Subject: Redhat 7.2 Kernel


> Does the default install kernel of RH7.2 have iptable support already
> compiled in it?
>
Yes it does.

Rob



--__--__--

Message: 7
Date: Tue, 09 Jul 2002 16:50:40 +0200
From: Marcus Schopen <marcus.schopen@uni-bielefeld.de>
Organization: LOCALGURU
To: netfilter@lists.samba.org
Subject: H.323 and 2.4.18 kernel problem

Hi,

to get the H.323 module working with kernel 2.4.18, I installed the
following patches with p-o-m (CVS version):

  1. arptables
  2. congig-cleanup
  3. conntrack+helper-unregister
  4. ip_conntrack_protocol_destroy
  5. ip_conntrack_protocol_unregister
  6. macro-trailing-semicolon-fix
  7. nat-export_symbols
  8. netfilter-arp
  9. REJECT-dont_fragment

  after that:

  10. 0-newnat13
  11. pptp_conntrack_nat
  12. h323_conntack_nat

All patches were installed cleanly. Did I forget a patch, because I get
the following error:

In file included from ip_conntrack_proto_gre.c:39:
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_inlist':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49: (Each
undeclared identifier is reported only once
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:49: for each
function it appears in.)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_append':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:70:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_prepend':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:78:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h: In function
`list_named_insert':
/usr/src/linux/include/linux/netfilter_ipv4/listhelp.h:104:
`ip_ct_gre_lock' undeclared (first use in this function)
ip_conntrack_proto_gre.c: At top level:
ip_conntrack_proto_gre.c:70: `ip_ct_gre_lock' used prior to declaration
make[2]: *** [ip_conntrack_proto_gre.o] Error 1
make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/net'
make: *** [_mod_net] Error 2

Thanks
Marcus


--

| Marcus Schopen      (0>     http://www.dzug.org |
| P.O. Box 10 25 25   //\     http://www.zope.org |
| D-33525 Bielefeld   V_/_  http://www.python.org |
|      *** Live as variously as possible ***      |



--__--__--

Message: 8
From: "Rowan Reid" <rreid@studio3arc.com>
To: <netfilter@lists.samba.org>,
	"'R. Sterenborg'" <rsterenborg@xs4all.nl>, <suse-linux-e@suse.com>
Subject: FW: PPTP through masquerading gateway
Date: Tue, 9 Jul 2002 09:44:43 -0700


FYI

Some info I came across, unfortunatly I'm not a CVS genious and the only
Method I know to patch I file is with zcat. Can someone answer this one
for me.

> the pptp patch in the CVS won't apply. I've just submitted a
> patch to the -devel list. You can download the latest CVS
> tree and apply the following patch :
> http://fabnetwork.ifrance.com/fabnetwork/patches/conntrack_ppt
p_patch_rediff.patch
After that, running patch-o-matic, the pptp patch should now apply
properly.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown



--__--__--

Message: 9
From: Jan Humme <jan.humme@xs4all.nl>
Reply-To: jan.humme@xs4all.nl
To: netfilter@lists.samba.org
Subject: Do I need a firewall rule for RST ?
Date: Tue, 9 Jul 2002 18:50:13 +0200

In /var/log/messages, I often find packages that have been rejected because
of the following rules:

$IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
	-j ACCEPT --tcp-flags ACK ACK
$IPTABLES -A FORWARD -m multiport -p tcp -o ppp0 --dports $TCPOUT\
	-j ACCEPT

In short, what I want to achieve is that incoming traffic should always have
the ACK-bit set.

Packets that are rejected most often are packets that have the RST-flag set:

Jul  9 14:08:58 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=32896 PROTO=TCP SPT=80 DPT=1068 WINDOW=0
RES=0x00 RST URGP=0
Jul  9 14:08:59 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=33682 PROTO=TCP SPT=80 DPT=1068 WINDOW=0
RES=0x00 RST URGP=0
Jul  9 14:09:01 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=35186 PROTO=TCP SPT=80 DPT=1068 WINDOW=0
RES=0x00 RST URGP=0

Questions:

1) AFAIK these packets are harmless, correct? Or could some of them be used
in attacks?

2) (Assuming they are harmless:) is it safe then to add a rule:

$IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
	-j ACCEPT --tcp-flags RST RST

3) Is there perhaps a better way to deal with these kinds of packets?
Perhaps i should better use "state" and forget about the flags?

Jan Humme.


--__--__--

Message: 10
Date: Tue, 9 Jul 2002 10:20:39 -0700 (PDT)
From: Matthias Kattanek <mattes@mykmk.com>
To: "R. Sterenborg" <rsterenborg@xs4all.nl>,
	"Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Cc: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>
Subject: Re: Redhat 7.2 Kernel


On Tue, 9 Jul 2002, R. Sterenborg wrote:

> ----- Original Message -----
> From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
> Subject: Redhat 7.2 Kernel
>
>
> > Does the default install kernel of RH7.2 have iptable support already
> > compiled in it?
> >
> Yes it does.

Nope, that is not exactly true.
All RedHat 7.x distribution with a 2.4.x kernel offer iptables as a
module. (same as ipchains)

By default RH distries have ipchains activated. So in case you attempt
e.g. 'iptables -L' you will encounter an error message.

no worries. easiest way around is to rename /etc/sysconfig/ipchains
to /etc/sysconfig/ipchains.notinuse. Then reboot the box and run
'iptables' and it will autoload the respective module.

mattes




--__--__--

Message: 11
From: "Travis Crook" <travis@visionsbeyond.com>
To: <netfilter@lists.samba.org>
Subject: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 11:29:49 -0600

This is a multi-part message in MIME format.

------=_NextPart_000_0014_01C2273B.EFAF6C00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
    I currently have two firewalls running.  Both on Mandrake 8.1 =
running iptables.  I currently have two internet connections (one is a =
DSL line at 1Mb, the other is straight from an ISP at 2.5 Mb).  I can =
get 700Kb speeds through the firewall on the DSL line (which is about as =
fast as it ever is) but I only get about 500Kb speeds through the =
firewall on the ISP line.  Shouldn't I be able to get at least 2Mb =
speeds through this firewall?=20

Thanks

Travis Crook
Visions Beyond

------=_NextPart_000_0014_01C2273B.EFAF6C00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4728.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hello,</DIV>
<DIV>&nbsp;&nbsp;&nbsp; I currently have two firewalls running.&nbsp; =
Both on=20
Mandrake 8.1 running iptables.&nbsp; I currently have two internet =
connections=20
(one is a DSL line at 1Mb, the other is straight from an ISP at 2.5 =
Mb).&nbsp; I=20
can get 700Kb speeds through the firewall on the DSL line (which is =
about as=20
fast as it ever is) but I only get about 500Kb speeds through the =
firewall on=20
the ISP line.&nbsp; Shouldn't I be able to get at least 2Mb speeds =
through this=20
firewall? </DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks</DIV>
<DIV>&nbsp;</DIV>
<DIV>Travis Crook<BR>Visions Beyond</DIV></BODY></HTML>

------=_NextPart_000_0014_01C2273B.EFAF6C00--



--__--__--

Message: 12
Date: Tue, 9 Jul 2002 13:35:35 -0400
From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
To: Jan Humme <jan.humme@xs4all.nl>
Cc: netfilter@lists.samba.org
Subject: Re: Do I need a firewall rule for RST ?

On Tue, Jul 09, 2002 at 06:50:13PM +0200, Jan Humme wrote:

> Questions:
>
> 1) AFAIK these packets are harmless, correct? Or could some of them be
used
> in attacks?

Someone can send you these packets to tear down your established
tcp sessions. Not that it's easy to do but feasible.

>
> 2) (Assuming they are harmless:) is it safe then to add a rule:
>
> $IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
> 	-j ACCEPT --tcp-flags RST RST
>
> 3) Is there perhaps a better way to deal with these kinds of packets?
> Perhaps i should better use "state" and forget about the flags?

Yes. I'd do this. However it doesn't protect you from the case mentioned
above. The only solution for that is using IPsec. But then again you
cannot run IPsec for all your traffic...

Ramin

> Jan Humme.


--__--__--

Message: 13
Date: Tue, 9 Jul 2002 13:38:58 -0400
From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
To: Travis Crook <travis@visionsbeyond.com>
Cc: netfilter@lists.samba.org
Subject: Re: Speed Issues through NAT Firewall

On Tue, Jul 09, 2002 at 11:29:49AM -0600, Travis Crook wrote:

> Hello,
>     I currently have two firewalls running.  Both on Mandrake 8.1 running
iptables.  I currently have two internet connections (one is a DSL line at
1Mb, the other is straight from an ISP at 2.5 Mb).  I can get 700Kb speeds
through the firewall on the DSL line (which is about as fast as it ever is)
but I only get about 500Kb speeds through the firewall on the ISP line.
Shouldn't I be able to get at least 2Mb speeds through this firewall?

How do you measure the throughput?

Ramin
PS. Line breaks are good things.


>
> Thanks
>
> Travis Crook
> Visions Beyond


--__--__--

Message: 14
From: Jan Humme <jan.humme@xs4all.nl>
Reply-To: jan.humme@xs4all.nl
To: Matthias Kattanek <mattes@mykmk.com>,
	"R. Sterenborg" <rsterenborg@xs4all.nl>,
	"Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Subject: Re: Redhat 7.2 Kernel
Date: Tue, 9 Jul 2002 19:41:09 +0200
Cc: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>

On Tuesday 09 July 2002 19:20, Matthias Kattanek wrote:
> On Tue, 9 Jul 2002, R. Sterenborg wrote:
> > ----- Original Message -----
> > From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
> > Subject: Redhat 7.2 Kernel
> >
> > > Does the default install kernel of RH7.2 have iptable support already
> > > compiled in it?
> >
> > Yes it does.
>
> Nope, that is not exactly true.
> All RedHat 7.x distribution with a 2.4.x kernel offer iptables as a
> module. (same as ipchains)
>
> By default RH distries have ipchains activated. So in case you attempt
> e.g. 'iptables -L' you will encounter an error message.
>
> no worries. easiest way around is to rename /etc/sysconfig/ipchains
> to /etc/sysconfig/ipchains.notinuse. Then reboot the box and run
> 'iptables' and it will autoload the respective module.
>
> mattes

I prefer to use:

#chkconfig ipchains --level 2345 off.
#chkconfig iptables --level 2345 on.

because it stops the ipchains script from being run at all (which is what
you
really want).

If you mv /etc/sysconfig/ipchains, then /etc/init.d/ipchains will still be
run, but exit because /etc/sysconfig/ipchains is missing.

In any case, /etc/init.d/iptables uses lsmod to find out if ipchains is
running, and exits should this be the case.

Jan Humme.


--__--__--

Message: 15
Date: Tue, 9 Jul 2002 19:49:26 +0200
From: Patrick Schaaf <bof@bof.de>
To: Travis Crook <travis@visionsbeyond.com>
Cc: netfilter@lists.samba.org
Subject: Re: Speed Issues through NAT Firewall

>     I currently have two firewalls running.  Both on Mandrake 8.1 running
iptables.  I currently have two internet connections (one is a DSL line at
1Mb, the other is straight from an ISP at 2.5 Mb).  I can get 700Kb speeds
through the firewall on the DSL line (which is about as fast as it ever is)
but I only get about 500Kb speeds through the firewall on the ISP line.
Shouldn't I be able to get at least 2Mb speeds through this firewall?

At least you can be almost assured that your problems have nothing to
do with iptables and it's NAT. Starting up my crystal ball, I predict
you'll find some half/full duplex mismatch on one of your Ethernets.
Oh, and what type and speed are your CPUs?

best regards
  Patrick



--__--__--

_______________________________________________
netfilter mailing list
netfilter@lists.samba.org
http://lists.samba.org/listinfo/netfilter


End of netfilter Digest


