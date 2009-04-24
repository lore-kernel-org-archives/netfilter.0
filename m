From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 21:13:31 +0200
Message-ID: <49F20F5B.1030200@plouf.fr.eu.org>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu> <49F1D0AE.1030606@plouf.fr.eu.org> <49F1E5B8.7030907@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F1E5B8.7030907@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

G=E1sp=E1r Lajos a =E9crit :
>=20
> I think it is happens like this:
> 1. iptables checks the command line for matches and loads them,
> 2. every match registers its "extra_opts" in an internal table, (this=
=20
> time connmark and mark registers the same "mark" option.)
> 3. iptables checks the remaining command line options against the tab=
le.
> 4. if the option found in the table then the match will decide the=20
> option's fate (with the "parse" callback function).

Well, then I rephrase : why does iptables pass to the match options=20
which are beyond the next -m ? It seems obvious to me that those option=
s=20
belong to the next matches. Is it an accepted practice to order matches=
=20
and options randomly ? If yes, then non-exclusive matches should not be=
=20
allowed to have the same options.
