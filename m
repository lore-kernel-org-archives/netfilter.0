From: "HTB" <kerasakti@nusa.net.id>
Subject: Re: netfilter digest, Vol 1 #926 - 12 msgs
Date: Fri, 20 Jun 2003 08:27:19 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c336cb$199ac420$2801a8c0@medannic>
References: <20030619190601.353.76623.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


----- Original Message -----
From: <netfilter-request@lists.netfilter.org>
To: <netfilter@lists.netfilter.org>
Sent: Friday, June 20, 2003 2:06 AM
Subject: netfilter digest, Vol 1 #926 - 12 msgs


> Send netfilter mailing list submissions to
> netfilter@lists.netfilter.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> netfilter-request@lists.netfilter.org
>
> You can reach the person managing the list at
> netfilter-admin@lists.netfilter.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>
>
> Today's Topics:
>
>    1. ntop not saving ... (Ray Leach)
>    2. Re: ntop not saving ... (Ray Leach)
>    3. Re: Ip handling (Julian Gomez)
>    4. Re: Ip handling (Ramin Dousti)
>    5. Re: Ip handling (Ramin Dousti)
>    6. Re: Ip handling (Ramin Dousti)
>    7. RE: pptp patch (Rowan Reid)
>    8. re: pptp patch (Gary Cote)
>    9. RE: pptp patch (Rowan Reid)
>   10. Re: Ip handling (Pascal Italiaander)
>   11. MARK Locally Generated Packets (Jay)
>   12. Problems installing Netfilter extensions (Juan Torres)
>
> --__--__--
>
> Message: 1
> Subject: ntop not saving ...
> From: Ray Leach <raymondl@knowledgefactory.co.za>
> To: Netfilter Mailing List <netfilter@lists.netfilter.org>
> Organization: Knowledge Factory
> Date: 19 Jun 2003 12:40:45 +0200
>
>
> --=-4RjArP7abNR9IAPlGvxq
> Content-Type: text/plain
> Content-Transfer-Encoding: quoted-printable
>
> Hi
>
> Has anyone used ntop to monitor network load?
>
> My ntopd keeps dying with no evidence as to why. No messages on console
> or in /var/log/messages.
>
> Any clues as to what is happening?
>
>
> --=20
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --
>
> --=-4RjArP7abNR9IAPlGvxq
> Content-Type: application/pgp-signature; name=signature.asc
> Content-Description: This is a digitally signed message part
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>
> iD8DBQA+8ZMth1fuR/Bv+ygRAjY+AKCbjpx1fsyUO+Eeosorzajb8BiDEwCeMNK2
> ka21M+kYCpgqw2yDsXgqdoE=
> =f5ZY
> -----END PGP SIGNATURE-----
>
> --=-4RjArP7abNR9IAPlGvxq--
>
>
>
> --__--__--
>
> Message: 2
> Subject: Re: ntop not saving ...
> From: Ray Leach <raymondl@knowledgefactory.co.za>
> To: steve.cherry@brandid.net
> Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>, GLUG Tech
<glug-tech@linux.org.za>
> Organization: Knowledge Factory
> Date: 19 Jun 2003 13:13:25 +0200
>
>
> --=-8FdyD06xB1xwQDFyw8Tv
> Content-Type: text/plain
> Content-Transfer-Encoding: quoted-printable
>
> On Thu, 2003-06-19 at 12:53, Steven Cherry wrote:
> > hello,
> >=20
> > I had this problem with servers who's network load was quite high and=20
> > when you restart it all your logs are gone and you have to start a
fresh?
> >=20
> That is exactly what is happening.
>
> I'm going to try the new 2.2 version and see what happens.
>
> > Never got to the bottom of it though, I would be intrested to hear if=20
> > you do though
> >=20
> > thanks
> >=20
> >=20
> > steve
> >=20
> > Ray Leach wrote:
> > > Hi
> > >=20
> > > Has anyone used ntop to monitor network load?
> > >=20
> > > My ntopd keeps dying with no evidence as to why. No messages on
console
> > > or in /var/log/messages.
> > >=20
> > > Any clues as to what is happening?
> > >=20
> > >=20
> >=20
> >=20
> > ----------------------------------------------
> > This message has been scanned for viruses and
> > dangerous content by the Brand I.D. Ltd E-mail
> > Virus Scanner, and is believed to be clean.
> >=20
> > http://www.brandid.net
> --=20
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --
>
> --=-8FdyD06xB1xwQDFyw8Tv
> Content-Type: application/pgp-signature; name=signature.asc
> Content-Description: This is a digitally signed message part
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>
> iD8DBQA+8ZrUh1fuR/Bv+ygRAm4aAJ4tf4euRIhvXT/72rDZ3iJttLgNewCfQV+r
> 5sEJ+zHBgpo5Iv7v8Aun0Ag=
> =Pxaa
> -----END PGP SIGNATURE-----
>
> --=-8FdyD06xB1xwQDFyw8Tv--
>
>
>
> --__--__--
>
> Message: 3
> Date: Thu, 19 Jun 2003 21:02:21 +0800
> From: Julian Gomez <kluivert@tm.net.my>
> To: netfilter@lists.netfilter.org
> Subject: Re: Ip handling
> Reply-To: kluivert@tm.net.my
>
> On Thu, Jun 19, 2003 at 10:18:02AM +0200, Pascal Italiaander spoke thusly:
> >Op donderdag 19 juni 2003 05:31, schreef Ramin Dousti:
> >> > Does anyone know of a way to make say all connections from the
outside
> >> > going to my outside IP address Appear to be coming from my local lan
of
> >> > 192.168.0.1
> >>
> >> Just out of curiosity: what is the application of such a setup?
> >>
> >> Ramin
> >
> >Find it out yourself , it's not even apropriate to ask such a thing.
> >
> >Since this is a netfilter mailing-list no hackers-chat page.
> >
> >but nice try
>
> I've seen Ramin post to this list a long time already, though he's been
> quite for the past 6-8 months at least I think :-) So, if by the above you
> are sorta implying he's some sort of script kiddie; you've probably got
the
> wrong person targetted.
>
> A number of times, knowing the problem in full can lead to better ways of
> handling the problem, with better tools - rather than a kludged solution.
>
> Oh,.. before I forget, a number of his posts have been nothing short of
> extremely informative -- so the hostile behaviour is not really required.
> --
> USG && George Bush : Rot in hell.
>
>
> --__--__--
>
> Message: 4
> Date: Thu, 19 Jun 2003 09:30:45 -0400
> From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
> To: Pascal Italiaander <pc-secure@home.nl>
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Ip handling
>
> On Thu, Jun 19, 2003 at 10:08:54AM +0200, Pascal Italiaander wrote:
>
> > Op donderdag 19 juni 2003 06:02, schreef Ramin Dousti:
> > > On Thu, Jun 19, 2003 at 02:01:21AM +0200, Pascal Italiaander wrote:
> > > > small errors were in it, fixed:
> > > >
> > > >  iptables -I INPUT -p all -m mac --mac-source 10:20:30:40:05:06 -m \
> > > >  state --state NEW -j ACCEPT
> > > >  iptables -I OUTPUT -p all -m state --state ESTABLISHED,RELATED -j
ACCEPT
> > >
> > > Just a performance note. Since a high percentage of the packets are
> > > ESTABLISHED,RELATED it is recommended to have this rule at the
> > > beginning of the rule set prior to any other rule and also "-p all"
> > > is redundant...
> > >
> > > Ramin
> > >
> > > > Pascal
> >
> >
> > huhum....  , did you notice the -I insert rule ?
> >
> > The -I rule means that the rule is placed at the beginning of the chain.
:-)
>
> Yes, sorry. I'm used to -A... which gives you a chronological order of
> the rule setup. With -I you have to read the rules in the reverse order
;-)
>
> Ramin
>
> >
> > Pascal
> >
> >
> >
>
>
> --__--__--
>
> Message: 5
> Date: Thu, 19 Jun 2003 09:32:38 -0400
> From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
> To: Pascal Italiaander <pc-secure@home.nl>
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Ip handling
>
> On Thu, Jun 19, 2003 at 10:00:20AM +0200, Pascal Italiaander wrote:
>
> > Op donderdag 19 juni 2003 05:31, schreef Ramin Dousti:
> > > > Does anyone know of a way to make say all connections from the
outside
> > > > going to my outside IP address Appear to be coming from my local lan
of
> > > > 192.168.0.1
> > >
> > > Just out of curiosity: what is the application of such a setup?
> > >
> > > Ramin
> >
> > No official application excists.
> >
> > I will not explain you howto setup a spoofed connection , thats out of
order.
> > This mailing-list is ment to keep "hackers" out of the door, not howto
gain
> > acces to others.
>
> Well, the best way of securing a network is to know exactly how it
> can be insecured...
>
> Ramin
>
> >
> > But if you want to know more about these issues look for the subject
> > "exploits".
> >
> > Pascal
> >
>
>
> --__--__--
>
> Message: 6
> Date: Thu, 19 Jun 2003 09:59:24 -0400
> From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
> To: netfilter@lists.netfilter.org
> Subject: Re: Ip handling
>
> Thanks, Julian, for the complement.
>
> Now back to Mr arrogant: what the original poster was asking was
> how to "spoof" back to his own network, which sounded illogical;
> hence my question. Although, George Vieira sent a very nice
> application for this in a private email to me. Now, as a general
> rule, you either know the answer to a question (even a wrong one
> will be tolerated) or just shutup.
>
> Ramin
>
> On Thu, Jun 19, 2003 at 09:02:21PM +0800, Julian Gomez wrote:
>
> > >> > Does anyone know of a way to make say all connections from the
outside
> > >> > going to my outside IP address Appear to be coming from my local
lan of
> > >> > 192.168.0.1
> > >>
> > >> Just out of curiosity: what is the application of such a setup?
> > >>
> > >> Ramin
> > >
> > >Find it out yourself , it's not even apropriate to ask such a thing.
> > >
> > >Since this is a netfilter mailing-list no hackers-chat page.
> > >
> > >but nice try
> >
> > I've seen Ramin post to this list a long time already, though he's been
> > quite for the past 6-8 months at least I think :-) So, if by the above
you
> > are sorta implying he's some sort of script kiddie; you've probably got
the
> > wrong person targetted.
> >
> > A number of times, knowing the problem in full can lead to better ways
of
> > handling the problem, with better tools - rather than a kludged
solution.
> >
> > Oh,.. before I forget, a number of his posts have been nothing short of
> > extremely informative -- so the hostile behaviour is not really
required.
> > --
> > USG && George Bush : Rot in hell.
>
>
> --__--__--
>
> Message: 7
> Date: Thu, 19 Jun 2003 09:18:41 -0700
> From: Rowan Reid <rreid@studio3arc.com>
> Subject: RE: pptp patch
> To: "'Hill, John'" <jhill@columbuscontainer.com>,
netfilter@lists.netfilter.org
>
>
> >
> > I have kernel 2.4.21 netfilter - latest cvs.
> >
> > Built netfilter for extra added pptp support.
> >
> > Recompiled kernel -- netfilter.
> >
> > I have a win2000 pptp server behind a Linux firewall
>
> Well having gone yrou route here is my 2 cents.
>
> A.) if your not married to pptp then setup a freeswan vpn on your
> firewall  freeswan accepts connection from pretty much any other vpn
> including windows2000. sorry pptp not included. I think it's generally
> accepted that pptp is out the door.
>
> B.) if you are married to pptp wait until a stable version has been
> released with netfilter. It's not wise to play with beta/experimental
> software on sensitive information.   To the best of my knowledge pptp
> can nly handle one connection at a time with the current patch. This is
> per the netfilter website.
>
>
> >
> > I had 3 VPN connections working. When one closed the
> > connection the kernel panicked and died. I could not recover
> > the error message. I was forced to power off.
>
>
>
> --__--__--
>
> Message: 8
> From: "Gary Cote" <gcote@transat-tech.com>
> To: <netfilter@lists.netfilter.org>
> Subject: re: pptp patch
> Date: Thu, 19 Jun 2003 11:19:31 -0500
>
> John,
>
> I also need to to route pptp traffic through a box with
> recent kernel revisions (2.4.20-18.7 for me at the moment).
> The linux box is neither the pptp client nor server. It's
> just a router/NAT. Would you be so kind as to forward
> anything you might find out over to me? Once I know your
> address, I'll do the same.
>
> (sorry for the "me too" post on the list, but I subscribed
>  to the group after your posting, and the archive masks out
>  email addresses.)
>
> A couple questions:
>
> . Am I correct in understanding that there are two pptp
>   patches out there? One against the latest netfilter
>   sources, and the John Hardin/Brian Kushak patch against
>   earlier revisions?
>   . Is the first one the patch-o-matic extra/pptp-conntrack-nat.patch?
>
> . You said Brian Kushak's 2.4.19 patch won't work against
>   2.4.21. Do you simply mean that patch reported errors,
>   or have you looked into what it would take to port the
>   patch to recent kernels? I've taken a quick look through
>   it and saw the code has been redesigned in some spots,
>   so it's not a simple cut-and-paste job. If it's already
>   known to be a lost cause, then I won't waste any more time
>   looking at it.
>
> . Your post said you built 2.4.21 netfilter with pptp support.
>   I guess this refers back to my first question. Are you
>   referring to the pptp-conntrack-nat.patch?
>
> Once I get my head screwed on straight about all this stuff,
> and figure out what ground's already been covered, maybe we
> can figure out how to get it to work for both of us.
>
> thanks
>
>
>
>
>
> --__--__--
>
> Message: 9
> Date: Thu, 19 Jun 2003 09:32:28 -0700
> From: Rowan Reid <rreid@studio3arc.com>
> Subject: RE: pptp patch
> To: 'Gary Cote' <gcote@transat-tech.com>, netfilter@lists.netfilter.org
>
>
> > . Your post said you built 2.4.21 netfilter with pptp support.
> >   I guess this refers back to my first question. Are you
> >   referring to the pptp-conntrack-nat.patch?
> >
>
> http://netfilter.org/documentation/pomlist/pom-extra.html#pptp-conntrack
> -nat
>
> pptp-conntrack-nat [pptp-conntrack-nat.patch]
> [pptp-conntrack-nat.patch.config.in]
> [pptp-conntrack-nat.patch.configure.help]
> [pptp-conntrack-nat.patch.help] [pptp-conntrack-nat.patch.makefile]
> Author: Harald Welte <laforge@gnumonks.org>
> Status: Beta
>
> This adds CONFIG_IP_NF_PPTP:
> Connection tracking and NAT support for PPTP.
>
> Note that this code currently has limitations
> - can only NAT connections from PNS to PAC
> - doesnt' support multiple calls within one session
>
>
>
>
> --__--__--
>
> Message: 10
> From: Pascal Italiaander <pc-secure@home.nl>
> Organization: PC-Secure
> To: netfilter@lists.netfilter.org
> Subject: Re: Ip handling
> Date: Thu, 19 Jun 2003 19:16:28 +0200
>
> Op donderdag 19 juni 2003 15:59, schreef Ramin Dousti:
> > Thanks, Julian, for the complement.
> >
> > Now back to Mr arrogant: what the original poster was asking was
> > how to "spoof" back to his own network, which sounded illogical;
> > hence my question. Although, George Vieira sent a very nice
> > application for this in a private email to me. Now, as a general
> > rule, you either know the answer to a question (even a wrong one
> > will be tolerated) or just shutup.
> >
> > Ramin
>
> Mr arrogant ?, cause i feel this question is way of toppic ? it is.
> If it wasn't, wy did you receive a private mail ,and not through
> netfilter-list ? That software is no Netfilter-topic, so "Spoofing HowTo"
is
> also no Netfilter-topic.
>
> AND:
>
> 1) The linux-kernel is protected for it (spoofing) by default.
> 2) iptables can block spoofing as well.
> 3) It works great.
>
> There are several options to stop spoofing, that are functioning great, so
> what more do you need to know ?
>
> The exploits where i was talking about ,have nothing to do with iptables
> directly.
>
> All we need to know is what spoofing is about ( not how it is done), for
> iptables to make rules against spoofing.
>
> > On Thu, Jun 19, 2003 at 09:02:21PM +0800, Julian Gomez wrote:
> > > >> > Does anyone know of a way to make say all connections from the
> > > >> > outside going to my outside IP address Appear to be coming from
my
> > > >> > local lan of 192.168.0.1
> > > >>
> > > >> Just out of curiosity: what is the application of such a setup?
> > > >>
> > > >> Ramin
> > > >
> > > >Find it out yourself , it's not even apropriate to ask such a thing.
> > > >
> > > >Since this is a netfilter mailing-list no hackers-chat page.
> > > >
> > > >but nice try
> > >
> > > I've seen Ramin post to this list a long time already, though he's
been
> > > quite for the past 6-8 months at least I think :-) So, if by the above
> > > you are sorta implying he's some sort of script kiddie; you've
probably
> > > got the wrong person targetted.
> > >
> > > A number of times, knowing the problem in full can lead to better ways
of
> > > handling the problem, with better tools - rather than a kludged
solution.
> > > Oh,.. before I forget, a number of his posts have been nothing short
of
> > > extremely informative -- so the hostile behaviour is not really
required.
>
> Julian,
>
> No offend Julian, but by vieuwing someones e-mail , you can tell if
someone is
> not a script-kiddy ?
> Whauw, how do you do that, teach me . :-)
>
> > > USG && George Bush : Rot in hell.
>
> Pascal
>
>
> --__--__--
>
> Message: 11
> Date: Thu, 19 Jun 2003 12:11:30 -0600
> From: Jay <jeno@finali.com>
> To: netfilter@lists.netfilter.org
> Subject: MARK Locally Generated Packets
>
> Hi,
>
>      I'm trying to mark locally generated packets to be able to re-route
> HTTP(S) requets out a different gateway. Similar to a transparent proxy,
> with the exception that I want only traffic generated from this box to
> get marked and re-routed. I've setup everything correctly according to
> the many documents I've found, and I can manually use ip rules to get the
> actions I want, I'm jut not getting a mark recognized by the ip rules.
> Anybody have any ideas on how to get iptables to mark locally generated
> packets?
>
> -= Jay =-
>
>
>
> --__--__--
>
> Message: 12
> From: "Juan Torres" <islero77@telefonica.net>
> To: "Netfilter-users" <netfilter@lists.netfilter.org>
> Subject: Problems installing Netfilter extensions
> Date: Thu, 19 Jun 2003 21:04:58 +0200
>
> This is a multi-part message in MIME format.
>
> ------=_NextPart_000_0004_01C336A6.76E0F070
> Content-Type: text/plain;
> charset="us-ascii"
> Content-Transfer-Encoding: 7bit
>
>
> Hi!!
>
> I'm trying to install a Netfilter extension, mport, but it
> doesn't work
>
> I make all the steps that comes on the Netfilter Extensions
> HOWTO, but, when I try to use the new match, it appears an error saying
> that it doesn't exists the libipt_mport.so file, I have observed that
> there are the ipt_mport.c and ipt_mport.h files, but no this other file.
>
> I think that the problem is because I can't make the last step
> explained in the documentation, where is written:
>
> Once your new kernel is installed, you can go ahead and
> compile and install the "iptables" package, from the "userspace/"
> directory as follows:
> # make all install
>
> This last step doesn't work!! When I execute this command in the
> userspace/ subdirectory inside the patch-o-matic directory, It appears
> an error saying that It can't find the "all" option (or something
> similar)
>
>
> What I'm not doing properly??
>
>
> Than you very much
>
>
>
> ------=_NextPart_000_0004_01C336A6.76E0F070
> Content-Type: text/html;
> charset="us-ascii"
> Content-Transfer-Encoding: quoted-printable
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
> <HTML>
> <HEAD>
> <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
> charset=3Dus-ascii">
> <META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
> 6.0.4630.0">
> <TITLE>Problems installing Netfilter extensions</TITLE>
> </HEAD>
> <BODY>
> <!-- Converted from text/rtf format -->
> <BR>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
> FACE=3D"Arial">Hi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"><FONT SIZE=3D2 =
> FACE=3D"Arial">!!</FONT></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"es">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">m =
> trying to install a Netfilter extension, mport, but it =
> doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
> work</FONT></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
> FACE=3D"Arial">I make all the steps that come</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">s on the Netfilter Extensions HOWTO, but, when =
> I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"> <FONT SIZE=3D2 FACE=3D"Arial">try to use the new match, =
> it appears an error sayi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">ng =
> that it doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
> exists the libipt_mport.so file, I have</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">observed that there are the ipt_mport.c =
> and</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> ipt_mport.h files, but no =
> this other file.</FONT></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">I think that the problem is because I =
> can</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">t</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
> FACE=3D"Arial">make</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
> the last step explained in the documentation</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">,</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
> FACE=3D"Arial">where is written:</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> =
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">Once your new kernel is installed, you can go =
> ahead and compile and install the</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">iptables</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial"> package, from the</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
> SIZE=3D2 FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">userspace/</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial"> directory as follows:</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
> FACE=3D"Arial"># make all install</FONT></SPAN></P>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
> FACE=3D"Arial">Thi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">s =
> last step doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
> work!!</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
> FACE=3D"Arial">When I execute this command in the userspace/ =
> subdirectory inside the p</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">atch</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">-o-m</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">atic directory, It appears an error saying that =
> I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t</FONT></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
> SIZE=3D2 FACE=3D"Arial"> can</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">t</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
> FACE=3D"Arial">find the</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
> FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">all</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
> option (or something similar)</FONT></SPAN></P>
> <BR>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
> FACE=3D"Arial">What I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
> FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
> LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">m =
> not doing properly??</FONT></SPAN></P>
> <BR>
>
> <P ALIGN=3DJUSTIFY><SPAN =
> LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =

> FACE=3D"Arial">Than you very much</FONT></SPAN></P>
> <BR>
>
> </BODY>
> </HTML>
> ------=_NextPart_000_0004_01C336A6.76E0F070--
>
>
>
>
> --__--__--
>
> _______________________________________________
> netfilter mailing list
> netfilter@lists.netfilter.org
> https://lists.netfilter.org/mailman/listinfo/netfilter
>
>
> End of netfilter Digest
>


