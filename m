From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Re: Fw: iptables-save/restore question
Date: Wed, 18 Sep 2002 15:12:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c25f14$fd82fd40$6307a8c0@net>
References: <006b01c25e32$5ede5500$6307a8c0@net> <3D8723F6.50904@fugmann.dhs.org>
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

> Bo Jacobsen wrote:
> > I run some iptables commands then run iptables -L -n > testfile1 to =
save the setup.
> > Then I run iptables-restore testfile1 and than run iptables-save =
again:
> > iptables -L -n > testfile2
> Why don't you use 'iptables-save' to save the rules?

I do, but by this procedure I try to verify that running save and =
restore will do nothing to the rules and will produce the
same result as if running iptables commands directly from our scripts.
This of course assuming that the iptables -L -n is working.
My point is that IF there is a bug in either iptables-save or restore =
(with my rules) the diff command will show it.

>=20
> > The reason we want to make this test is that we need to be sure that =
the rules generated directly by
> > the iptables commands, are EXATLY the same as what the =
iptables-save/restore command pair does.
> Do you distrust the iptables-restore command. If you do, then insert=20
> each rule by hand (or through a script.).  You cannot validate rules,=20
> the way you described above, even if the saved files were equal.
>=20
> Example: Assume a bug is present resulting in iptables -L -n lists all =

> ip-addresses as 0.0.0.0/0. When you use iptables-restore, then the =
rules=20
> has 0.0.0.0/0 instead of the original ipnumbers.  Even if=20
> iptables-save/iptables-restore produces the same results, you have not =

> proven that iptables-save works, because the original rules did have=20
> other ipaddresses than 0.0.0.0/0.

That is "perfectly OK", because as long as the iptables-save/restore =
works, the rules are set as expected (I just
don't know it, as the diff shows no errors).
Of course if both iptables -L -n lists AND iptables-save/restore is not =
working, THEN it's no good, and we are all screed, but I=20
trust the netfilter programmers enough to bet that the chances of that =
happening, is very slim.

>=20
> >=20
> > One thing is to test that the iptable commands works, another is to =
blindly trust that our 300 iptable rules
> > are correctly saved and restored by iptables-save/restore (a =
firewall with 4 different local lans).
> What are you afraid of. iptables-restore not able to process 300 =
lines?=20
> You you trust it to read even 1 rule?
No comments.
.
>=20
> If you cannot trust iptables-restore then do not use it. If you trust=20
> it, then trust it enough the assume that iptables-restore would yeild =
an=20
> exit value <>0, if any error occured while setting the rules.
> Regards
> Anders Fugmann
>=20
>=20
> --=20
> Neo: 'Can you fly that thing?'
> Trinity: 'Not yet'.
> $ apt-get install pilot-prg-v212helicopter.
>=20
>=20
>=20



