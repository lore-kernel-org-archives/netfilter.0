From: ccmike@isugw.indstate.edu
Subject: IPTables Feature set and performance.
Date: Mon, 2 Dec 2002 13:25:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212021325.41118.ccmike@isugw.indstate.edu>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


O wise netfilter guruz, I pray unto thee in hopes you can answer my most=20
humble questions.=20

I have been all over the net and looked thru the mailing list archives, b=
ut=20
cannot find an answer to questions that have been asked a number of times=
,=20
but never with the proper specifications, so I will attempt to ask in a m=
ore=20
proper form.

First: netfilter vs pix

considering packet filtering only, and ignoring the "extra" things such a=
s vpn=20
and pretty gui, administration costs, purchase price, and CYA.

What things can I do with an iptables firewall that I cannot do with a pi=
x=20
firewall,  I know about log tagging, but what else?

If the "costs" are not an issue, and the cisco extras are not necessary, =
would=20
you go with a pix or a netfilter solution and why? (skip the 'cause linux=
=20
rulez answers).

It seems that every time that this question was asked in the past the ans=
wer=20
was "pix comes with cisco CYA", or "what about the admin overhead", or=20
"depends on your requirements".  I am interested (as I am sure others are=
) in=20
the technical differences.  I am not trying to build a business case. =20

Second: Performance

If I make a monolithic kernel with everything stripped out of it except f=
or=20
the code I need to run a netfilter firewall with stateful inspection, and=
 I=20
have only the basic ruleset (everything out, established+mail+web+ssh in,=
=20
drop illegal ip addresses and flag combinations). basically a network noi=
se=20
filter. How many new connections per second can I expect to handle on wha=
t=20
type of box?  What type of thruput should I expect on what type of box?

Please note, I have both types of firewalls, and I am just trying to plan=
 out=20
how many of what I should put where and why.  I really would prefer to us=
e=20
netfilter over pix, it will be an educational exercise for me.  I can D/L=
=20
freeswan, and all the other goodies, and have plenty of boxen lying aroun=
d=20
collecting dust, lots of time and get paid no matter what I decide to do =
(see=20
sig).

There has to be someone, somewhere, who understands what I am asking and =
has=20
the answers.  I have the asbestos underwear properly installed, so flame =
on.=20
I will summarize back to the list.

- --=20
Mike Taylor.  GSEC          Non Impediti Ratione Cogitationis
Coordinator of Systems Administration and Network Security
Indiana State University.                      Rankin Hall Rm 039
210 N 7th St.                                           Terre Haute, IN.
Voice: 812-237-8843
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE966WlknPysOadsKcRAj8HAJ0fYo3EBa9dcjKB/rbwcNRCKE+RpwCgulCb
38DjnIigdHaCkyWmWbpkyNA=3D
=3DmReT
-----END PGP SIGNATURE-----

