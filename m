From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 20:08:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310212008.37744.Alistair@nerdnet.ca>
References: <20031021181138.49502.qmail@web40202.mail.yahoo.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031021181138.49502.qmail@web40202.mail.yahoo.com>
Content-Disposition: inline
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
To: SBlaze <dagent.geo@yahoo.com>, Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org

On October 21, 2003 02:11 pm, SBlaze wrote:
> > 	I agree the response is indeed sad, but I believe that's typical for
> > that sort of forum.  Watching the traffic coming in to your router and
> > charting it
> >
> > is NOT any sort of violation of any *rational* AUP.  Going farther than
> > that might well be.  The average user of cable internet access has litt=
le
> > idea of what goes on beyond the screen.  I've noted that DSL reports has
> > a few decent

 <SNIPPAGE>

> >
>
> This is the section that I am wondering about in Charter's AUP.
>
> 7. NO =93HACKING"
>
> Customer will not use, nor allow others to use, the Service to access the
> accounts of others or to attempt to penetrate security measures of the
> Service or other computer systems (=93hacking=94) or to cause a disruptio=
n of
> the Service to other on-line users. Customer will not use, nor allow othe=
rs
> to use, tools designed for compromising network security, such as
> password-guessing programs, cracking tools, packet sniffers or network
> probing tools.
>
> Wouldn't ntop be considered a "probing" tool?

	Welll ... it does incorporate a packet sniffer.  At that level,=20
	I can see how you feel that you might be violating AUP=20
	firing it up pointed at your outside connection.  However,=20
	despite not being a lawyer, I can point out that the intent of the
	section is defined clearly:
	=09
		No Hacking. =20
=09
	Soooo .... no coding on that there system now, no debugging allowed,=20
	no analysis of bleeding edge source code AT ALL darnit!!!

	(sorry old bone of mine)=20

		Intent here is fairly legally clear.  Don't go looking for a way to viola=
te=20
the integrity of the network or the security of any systems attached to the=
=20
network.  Analize your bandwidth, but don't retain info that could detail a=
=20
method of accessing any other system on the network.  I know that it seems =
a=20
fine line, but I believe that if you are doing this in the spirit of=20
analizing the network traffic to see if YOUR system is a problem, you are=20
unlilkely to have major issues.   The individual supposedly from your ISP=20
that replied (in that other forum) is clearly far from a network security=20
analyst.  I doubt they understand the functionality of a tool like ntop.
=09
  I know from past experience in my own co (cough) that we do indeed lock d=
own=20
IP's that are operating in promiscuous mode, and also IP's that are clearly=
=20
and documentably infected with DDOS tools.  However, we do NOT automaticall=
y=20
terminate the account based on this behaviour.  Frequently the issue is tha=
t=20
the system has been compromised remotely, and the sub is actually as much a=
=20
victim as a culprit.  Unfortunately this is a two edged sword, in which som=
e=20
(cough) people get away with murder.


>
> And getting back to my original reason and question for this post. How
> statistically can you see just how much iptables/netfilter is using of
> system resources?

	Got me on that ... I know that with only minimal processing on the firewal=
l=20
and three winders boxen downstream hammering the net connection, my linux b=
ox=20
is using  0.7% system  consistently (AMD Athlon 1500 756mbRam and kernel=20
2.4.22 iptables 1.2.7a, pom from January)=20

	With my desktop up and running (kde 3.1.2 ) with xmms and konqueror and=20
	other such things running, and my other half playing Sims online and me
	pulling Xfree86 current CVS right now I'm seeing Umm 2.6% system load.
	(most likely the sound drivers) -- plus something seems to be searching my=
 =09
	website........hmm -- not google.

	(yes ... thats a bad habit... but my desktop is the net connection for the=
=20
household... I'm working on that)

	On a dual pp 48Mb ram in a colo handling ~~1Gb/day data the system hasn't=
=20
broken 0.8% in over two months. (2.4.19, iptables 1.2.7a, no pom, no extras=
,=20
boots and runs from cd, logs remotely)

	*shrug* ... last time someone decided to ddos my network neighbour in the=
=20
colo, I saw some serious load *grin* ..the system usage actually hit 5%, bu=
t=20
I suspect that was the logger more than anything else .. .since I was=20
dropping and logging packets like crazy at the time.



	I'm still inclined to say that if you are concerned about the difference=20
between TCP pings to game servers and the so called ping time in game=20
that the issue lies with the game server.  I doubt from what you've posted =
so=20
far that the local outside network or iptables is causing your problems.

>
> Thanks Everyone
> SBlaze
>
>
> =3D=3D=3D=3D=3D
> In the absence of order there will be chaos.
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com

=2D-=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

