From: "Martin McKeay" <mmckeay@stillsecure.com>
Subject: RE: syn DDoS attack solution
Date: Mon, 4 Jun 2007 11:24:13 -0600
Message-ID: <5C9E8CCEEB81ED498AC0C3B0054704F3029B6DE0@webmail.latis.com>
References: <Pine.LNX.4.64.0706021446290.18235@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <Pine.LNX.4.64.0706021446290.18235@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "R. DuFresne" <dufresne@sysinfo.com>, Bgs <bgs@bgs.hu>
Cc: Ric Messier <kilroy@WasHere.COM>, netfilter@lists.netfilter.org

I'm glad you summed up the technical aspects of the conversation so far.
A DDoS attack is a serious problem, no matter what form it takes.

I have one question for you: do you really believe that there's no
defense other than not waking the lion, that the battle is already lost?
That doesn't paint a pretty picture to me.  Are you basing this on
published work or personal experience?  Which I guess makes two
questions, so I'll quit while I'm ahead.

Martin

Martin McKeay, CISSP, GSNA
Cobia Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://www.cobiablog.com

-- R. DuFrense wrote --


DDOS attacks work against resources, the tcp/ip stack <half opens
(syn's) left hanging>, memory <cache of data in your syn-flood db>,
drive space <system logs with overzealous logging of packet flow in
limited space, or how much disk is devoted to a syn-flood db>, the size
of your pipe...


In any but the most simplistic low bandwith attacks there is little one
can do in such cases but either ride out the storm or go upstream for
help in resolution <mist often a block of the damaging traffic>.  Even
an semi-decent firewall defense against a simple low bandwith syn flood
will need to be totally rework for defense in the case of a simple
lowbandwidth ping flood, etc.  And once the attack level is amplified
above the flow capabilities of your pipe, all bets are off.  In a
serious flooding attack the firewall simply become a stopgate from
preventing work on the local net from being affected.  There have been
and will continue to be some rather decently funded companies with some
fairly decent pipes wiped out of business or their internet presence
closed up due to some of these kinds of attacks over extended periods of
time.  Goverments across the globe have had internet services disrupted
for extended periods.=20
Microsoft has had to relocate servers to new net/ip addresses to divert
the flow from such attacks and stay somewhat online...


Best way to avoid such problems is to not get into a whose prick is
bigger contest with some kid in IRC that controls a 10,000-100,000 or
larger series of zombies in their botnet.

It's the nature of the game, all in the design...



Thanks,

Ron DuFresne
- --
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com Key fingerprint =3D 9401 =
4B13
B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover instead of creating the
perfect love.

                 -Tom Robbins <Still Life With Woodpecker> -----BEGIN
PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGYcADst+vzJSwZikRApiLAJ444UDiM3HZnoNLO7ECHocT31r88wCeMhmS
Zv2jS1v6fCcb3gLbx9+KqHQ=3D
=3DiZ/G
-----END PGP SIGNATURE-----


