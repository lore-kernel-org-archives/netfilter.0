From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: re: problem with ./runme in --batch mode. -- current p-o-m
Date: Thu, 9 Jan 2003 22:44:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301092244.09844.Alistair@nerdnet.ca>
Reply-To: Alistair@nerdnet.ca
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


=09Hi folks:
=09
=09Its too late at night, and I shouldn't be mucking with scripts. ... I =
realize=20
now that my previous email was in error ... and now realize what is actua=
lly=20
happening when passing a long list to ./runme ... its just disconcerting =
to=20
see patches that I don't want in the "already applied" list that ./runme=20
spits up when running in batch mode ... I can now see that the $EXCLUDED =
are=20
copied to $SEEN and listed in already applied list because of that ...=20

   perhaps we could put a *bypassed* tag in there so that others don't ge=
t as=20
confused as I.....=20

=09(hangs head in shame)

=09Alistair Tonner
=09Alistair@nerdnet.ca

=09(Actually ... since I just flipped email addys on the mailing list ...=
 this=20
message migh show up before the one of which I speak.....)


