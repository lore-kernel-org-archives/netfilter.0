From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: CnC General and ipitables woes. Need HELP PLS!
Date: Thu, 17 Apr 2003 10:14:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030417171413.35076.qmail@web40207.mail.yahoo.com>
References: <006501c3048c$89c3f800$026410ac@honor>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006501c3048c$89c3f800$026410ac@honor>
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
Content-Transfer-Encoding: quoted-printable
To: Sascha Reissner <sascha.reissner@toxicnet.de>, nf <netfilter@lists.netfilter.org>


--- Sascha Reissner <sascha.reissner@toxicnet.de> wrote:
> From: "SBlaze" <dagent.geo@yahoo.com>
>=20
> [...]
>=20
> > So my question is... is some sort of con. tracking mod needed? Anyone k=
now
> > anything about this problem? Thanks for your time and help anyone
>=20
> [...]
>=20
> Those kind of games tend to include the IP address of the "gaming" machine
> withing the payload of their datapackets.
>=20
> As i don't know that game i can just tell you that you might want to take=
 a
> look into .ini files or parameters for the game to override that behaviou=
r.
>=20
> Some games allow players via parameter to set a different ip that will get
> included into the data payload.
>=20
> Greets,
> Sascha
>=20
>=20
Hi Sascha,

  I agree with you on the fact that this probably could all be laid to rest=
 by
a configuration "correction."  However there is a small problem with that, =
and
that is Doccumentaion. Here is the only information reguarding Firewalling =
and
such in the actuall README of the game.

<snippet>

2.9. Firewall Issues:

If you are running a firewall (particularly a NETGEAR solution) and are una=
ble
to connect to other players while in the Command & Conquer Generals multipl=
ayer
lobby, check the Send Delay box under the Network Options portion of the ga=
me's
Options menu. If you are still experiencing connection problems, you may wa=
nt
to place your firewall in DMZ mode. (WARNING: Doing so will open your firew=
all
ports to everyone, and this should only be done as a last resort). If you do
not know how to configure your firewall settings, consult your firewall
documentation or contact your Internet service provider.=20

If you have made changes to your firewall configuration since the last time
that you played Command & Conquer Generals online and are experiencing
connection difficulties, click the Refresh NAT box under the Network Options
portions of the game's Option menu. It is highly recommended that you click
this box every time you change your Internet or firewall settings.=20

</snippet>

This to me sounds like it's reffering to NETGEAR routers and local machine
firewalls? This is not the case for me obviously since my issue involves
iptables and the game is Windows based( and my lines posted earlier show it
being fowarded to an internal game). Even if the formentioned is the case w=
ith
"external" firewalls both my friend and me updated after changes to the fws.

Now there is another section in the readme following the above one that loo=
ks
like it may have some relevance.

<snippet>

2.10. Firewall/NAT Port Number Info:

The game will need to talk to external servers that use the following port
numbers.  These ports need to be open in your firewall in order to play on
Generals Online:
=20
TCP ports:
80, 6667, 28910, 29900, 29920
=20
UDP ports:
4321, 27900
=20
If your firewall does not allow outgoing packets to open ports to incoming
traffic, or you experience problems connecting to other players, you will h=
ave
to specify which port you want Command & Conquer Generals to use for
communicating with other players.  To do this, perform the following steps.
=20
Go to your =93My Documents=94 directory, and go to the =93Command and Conqu=
er
Generals Data=94 directory.  Right click on the options.ini file and choose
"Edit."

Look for the "FirewallPortOverride" entry. If you don=92t see this entry, a=
dd it
as a new line.  Then assign the port you want to use to the port override
entry.  After making this change, this entry should look like:
=20
FirewallPortOverride =3D XXXX
=20
Where XXXX is the port number you have chosen.  You will need to open the
chosen port in your firewall for communication with players external to your
firewall or NAT device.  If you use the port override feature, the port you
have chosen can not be masqueraded by a NAT device.

</snippet>

This seems to pertain only to "Online" games. We are  trying to play a Dire=
ct
Connect one.... In Desperation we tried the FirewallPortOverride option to =
no
avail....


Coming full circle to your suggestion of changing the actual header's
ip...there is no option for that mentioned in the README.... Case of poor
documentaion? Does that option exsist? Perhaps they have bad headers and ne=
ed a
con track modules to work with iptables? I'ld sure like to know!

Thanks for everyones time.. I hope we can all put our heads together and fi=
gure
this out!

=3D=3D=3D=3D=3D
"No touchy NO TOUCHY! Emperor Kuzko -=3DEmperor's New Groove=3D-"

__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

