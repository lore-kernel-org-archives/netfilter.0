From: Jerry Mercks <mercksjt@comcast.net>
Subject: Re: netfilter digest, Vol 1 #472 - 8 msgs
Date: Tue, 17 Dec 2002 07:19:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212170719.30169.mercksjt@comcast.net>
References: <20021217130002.12807.44638.Mailman@kashyyyk>
Reply-To: mercksjt@comcast.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021217130002.12807.44638.Mailman@kashyyyk>
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

On Tue December 17 2002 07:00 am, netfilter-request@lists.netfilter.org wrote:
. > Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> 	netfilter-request@lists.netfilter.org
>
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>
>
> Today's Topics:
>
>    1. RE: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination Unreacha
>        ble) (Rob Sterenborg)
>    2. Re: "iptables: Invalid argument" with kernel 2.4.20 (cees-bart)
>    3. Re: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination Unreachable)
> (hare ram) 4. QoS limitations .... (Raymond Leach)
>    5. Re: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination
>        Unreachable) (Marcello Scacchetti)
>    6. Re: Help! ip traffic accounting and bidirection with iptables ??
> (Oskar Berggren)
>
> --__--__--
>
> Message: 1
> From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
> To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
> Subject: RE: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination Unreacha
> 	ble)
> Date: Tue, 17 Dec 2002 10:41:16 +0100
>
> This message is in MIME format. Since your mail reader does not understand
> this format, some or all of this message may not be legible.
>
> ------_=_NextPart_001_01C2A5B0.71B35340
> Content-Type: text/plain
>
> > Is it possible to use IPTables version 1.2.7a with Redhat
> > 7.3?  RH 7.3 comes with a different version by default and I
> > wanted to upgrade to 1.2.7a.  Is it possible?
>
> Yes, you can compile a brand new version for your own system.
> It's not that hard...
>
> > Also, do you know if any RPMs exist for IPTables version
> > 1.2.7a and RH 7.3?
>
> A Google search on "iptables 1.2.7a redhat rpm" returns results like
> http://www.haoli.org/rpm/redhat-7.x/RPMS/i386/.
> But I still think you'd better compile your own.
>
>
> Rob
>
> ------_=_NextPart_001_01C2A5B0.71B35340
> Content-Type: text/html
> Content-Transfer-Encoding: quoted-printable
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
> <HTML>
> <HEAD>
> <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
> charset=3Dus-ascii">
> <META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
> 5.5.2653.12">
> <TITLE>RE: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination =
> Unreachable)</TITLE>
> </HEAD>
> <BODY>
>
> <P><FONT SIZE=3D2>&gt; Is it possible to use IPTables version 1.2.7a =
> with Redhat </FONT>
> <BR><FONT SIZE=3D2>&gt; 7.3?&nbsp; RH 7.3 comes with a different =
> version by default and I </FONT>
> <BR><FONT SIZE=3D2>&gt; wanted to upgrade to 1.2.7a.&nbsp; Is it =
> possible?</FONT>
> </P>
>
> <P><FONT SIZE=3D2>Yes, you can compile a brand new version for your own =
> system.</FONT>
> <BR><FONT SIZE=3D2>It's not that hard...</FONT>
> </P>
>
> <P><FONT SIZE=3D2>&gt; Also, do you know if any RPMs exist for IPTables =
> version </FONT>
> <BR><FONT SIZE=3D2>&gt; 1.2.7a and RH 7.3?</FONT>
> </P>
>
> <P><FONT SIZE=3D2>A Google search on &quot;iptables 1.2.7a redhat =
> rpm&quot; returns results like <A =
> HREF=3D"http://www.haoli.org/rpm/redhat-7.x/RPMS/i386/" =
> TARGET=3D"_blank">http://www.haoli.org/rpm/redhat-7.x/RPMS/i386/</A>.</F=
> ONT>
> <BR><FONT SIZE=3D2>But I still think you'd better compile your =
> own.</FONT>
> </P>
> <BR>
>
> <P><FONT SIZE=3D2>Rob</FONT>
> </P>
>
> </BODY>
> </HTML>
> ------_=_NextPart_001_01C2A5B0.71B35340--
>
>
> --__--__--
>
> Message: 2
> Date: Tue, 17 Dec 2002 10:55:33 +0100 (CET)
> From: cees-bart <ceesb@cs.kun.nl>
> To: netfilter@lists.netfilter.org
> Subject: Re: "iptables: Invalid argument" with kernel 2.4.20
>
> On Mon, 16 Dec 2002, Joel Newkirk wrote:
> > On Monday 16 December 2002 11:25 am, cees-bart wrote:
> > > hi all,
> > >
> > > -A OUTPUT -d MYMACHINE -p udp -m udp --dport 27960 -j DNAT \
> > >                            --to-destination OTHERMACHINE:30000
> > >
> > > this setup works fine on kernel 2.4.19 with iptables 1.2.6a.
> > >
> > > BUT, the last rule (OUTPUT) fails with message "iptables: Invalid
> > > argument" when running under 2.4.20.
> >
> > Have you tried manually creating the rule, or are you restoring from a
> > save made with the earlier version?
>
> i tried both, and i found my mistake:
>
> i forgot to enable CONFIG_IP_NF_NAT_LOCAL in the kernel.
> sorry for the trouble.
>
> bye,
> cees-bart
>
>
>
> --__--__--
>
> Message: 3
> Reply-To: "hare ram" <hareram@sol.net.in>
> From: "hare ram" <hareram@sol.net.in>
> To: "freedom" <freedom10@idemation.com>,
> 	"'Marcello Scacchetti'" <marcello.scacchetti@nextrem.it>,
> 	<netfilter@lists.netfilter.org>
> Subject: Re: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination
> Unreachable) Date: Tue, 17 Dec 2002 16:11:41 +0530
>
> hi
>
> yes you can patch up the kernel with new version
> but there is no Latest rpm availbale for 1.2.7a
>
>  you need to use only 1.2.6a latest RPM with Redhat 8.0
> ----- Original Message -----
> From: "freedom" <freedom10@idemation.com>
> To: "'Marcello Scacchetti'" <marcello.scacchetti@nextrem.it>;
> <netfilter@lists.netfilter.org>
> Sent: Tuesday, December 17, 2002 9:23 AM
> Subject: RE: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination
> Unreachable)
>
> > Marcello,
> >
> > Sure...
> >
> > Is it possible to use IPTables version 1.2.7a with Redhat 7.3?  RH 7.3
> > comes with a different version by default and I wanted to upgrade to
> > 1.2.7a.  Is it possible?
> >
> > Also, do you know if any RPMs exist for IPTables version 1.2.7a and RH
> > 7.3?
> >
> > Thanks!
> > Kameron
> >
> > > -----Original Message-----
> > > From: netfilter-admin@lists.netfilter.org [mailto:netfilter-
> > > admin@lists.netfilter.org] On Behalf Of Marcello Scacchetti
> > > Sent: Monday, December 16, 2002 7:18 AM
> > > To: netfilter@lists.netfilter.org
> > > Subject: Re: ICMP Destination Unreachable
> > >
> > > Hi Kameron,
> > > can you be a little more verbose?
> > > What does "run" means? Unable to set rules? Unable to run iptables
> > > command? Unable to make rules work?
> > >
> > > Marcello
> > >
> > > Il ven, 2002-12-06 alle 16:09, Kameron ha scritto:
> > > > Hello Gurus,
> > > >
> > > > I have a couple of quick questions...
> > > >
> > > > 1) Does anybody know of any reason why I couldn't run IPTables
> >
> > 1.2.7a
> >
> > > > with RH7.3.
> > > >
> > > > 2) Are there any .rpm's for IPTables 1.2.7.a available?  I attempted
> >
> > to
> >
> > > > compile my own, but didn't have any luck.
> > > >
> > > > Thanks!
> > > > Kameron
> > >
> > > --
> > > Marcello Scacchetti <marcello.scacchetti@nextrem.it>
>
> --__--__--
>
> Message: 4
> Subject: QoS limitations ....
> From: Raymond Leach <raymondl@knowledgefactory.co.za>
> Reply-To: raymondl@knowledgefactory.co.za
> To: Netfilter Mailing List <netfilter@lists.netfilter.org>
> Organization: Knowledge Factory
> Date: 17 Dec 2002 13:16:53 +0200
>
>
> --=-v0Q1ipdrgEbeJlI9Gfbs
> Content-Type: text/plain
> Content-Transfer-Encoding: quoted-printable
>
> Hi all
>
> Does anyone know of a limit to the number of filters or classes that can
> be attached to a single qdisc (let's say CBQ or HTB)?
>
> I have a client that want to do bandwidth throttling per ip across 10
> class C subnets.
>
> What problems can I expect, and does anyone have any other suggestions
> on how to accomplish this?
>
> Ray
>
> --=20
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> (  Raymond Leach                       )
>  ) Knowledge Factory                  (
> (                                      )
>  ) Tel: +27 11 445 8100               (
> (  Fax: +27 11 445 8101                )
>  )                                    (
> (  http://www.knowledgefactory.co.za/  )
>  ) http://www.saptg.co.za/            (
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    o                                o
>     o                              o
>         .--.                  .--.
>
>        | o_o|                |o_o |
>        | \_:|                |:_/ |
>
>       / /   \\              //   \ \
>      ( |     |)            (|     | )
>      /`\_   _/'\          /'\_   _/`\
>      \___)=3D(___/          \___)=3D(___/
>
> --=-v0Q1ipdrgEbeJlI9Gfbs
> Content-Type: application/pgp-signature; name=signature.asc
> Content-Description: This is a digitally signed message part
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
>
> iD8DBQA9/wekh1fuR/Bv+ygRAqC1AKCGgs7sRhCOZfqaWlj/Z5+ryANHPACfQz5f
> P989v/Mb15P+IRCOiifmLng=
> =8R+h
> -----END PGP SIGNATURE-----
>
> --=-v0Q1ipdrgEbeJlI9Gfbs--
>
>
>
> --__--__--
>
> Message: 5
> Subject: Re: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination
> 	Unreachable)
> From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
> To: hare ram <hareram@sol.net.in>
> Cc: freedom <freedom10@idemation.com>, netfilter@lists.netfilter.org
> Organization:
> Date: 17 Dec 2002 11:01:56 +0100
>
> Try check here: http://www.haoli.org/rpm/redhat-7.x/RPMS/i386/
>
> Marcello
>
> Il mar, 2002-12-17 alle 11:41, hare ram ha scritto:
> > hi
> >
> > yes you can patch up the kernel with new version
> > but there is no Latest rpm availbale for 1.2.7a
> >
> >  you need to use only 1.2.6a latest RPM with Redhat 8.0
> > ----- Original Message -----
> > From: "freedom" <freedom10@idemation.com>
> > To: "'Marcello Scacchetti'" <marcello.scacchetti@nextrem.it>;
> > <netfilter@lists.netfilter.org>
> > Sent: Tuesday, December 17, 2002 9:23 AM
> > Subject: RE: Redhat 7.3 and IPTables 1.2.7a (was ICMP Destination
> > Unreachable)
> >
> > > Marcello,
> > >
> > > Sure...
> > >
> > > Is it possible to use IPTables version 1.2.7a with Redhat 7.3?  RH 7.3
> > > comes with a different version by default and I wanted to upgrade to
> > > 1.2.7a.  Is it possible?
> > >
> > > Also, do you know if any RPMs exist for IPTables version 1.2.7a and RH
> > > 7.3?
> > >
> > > Thanks!
> > > Kameron
> > >
> > > > -----Original Message-----
> > > > From: netfilter-admin@lists.netfilter.org [mailto:netfilter-
> > > > admin@lists.netfilter.org] On Behalf Of Marcello Scacchetti
> > > > Sent: Monday, December 16, 2002 7:18 AM
> > > > To: netfilter@lists.netfilter.org
> > > > Subject: Re: ICMP Destination Unreachable
> > > >
> > > > Hi Kameron,
> > > > can you be a little more verbose?
> > > > What does "run" means? Unable to set rules? Unable to run iptables
> > > > command? Unable to make rules work?
> > > >
> > > > Marcello
> > > >
> > > > Il ven, 2002-12-06 alle 16:09, Kameron ha scritto:
> > > > > Hello Gurus,
> > > > >
> > > > > I have a couple of quick questions...
> > > > >
> > > > > 1) Does anybody know of any reason why I couldn't run IPTables
> > >
> > > 1.2.7a
> > >
> > > > > with RH7.3.
> > > > >
> > > > > 2) Are there any .rpm's for IPTables 1.2.7.a available?  I
> > > > > attempted
> > >
> > > to
> > >
> > > > > compile my own, but didn't have any luck.
> > > > >
> > > > > Thanks!
> > > > > Kameron
> > > >
> > > > --
> > > > Marcello Scacchetti <marcello.scacchetti@nextrem.it>

-- 

Jerry Mercks, MCSE
Phone: 256 881 1492

Public key  may be obtained from www.keyserver.net
Search for Mercks. Use Key ID 853422D

This private communication is intended for the named recipient(s) only.
If you  have received this message in error please delete at once and notify
merckspub@comcast.net.

Please be advised that use, distribution, copying, reliance on or disclosure
of the contents of this message by anyone other than named recipient may
be inappropriate and may be in violation of laws relating to confidential 
information.

