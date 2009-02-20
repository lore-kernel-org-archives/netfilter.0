From: Michael Schwartzkopff <misch@multinet.de>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Fri, 20 Feb 2009 10:16:58 +0100
Message-ID: <200902201016.58939.misch@multinet.de>
References: <499D9292.902@colsmemory.co.uk> <499E7171.2030400@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <499E7171.2030400@chello.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Am Freitag, 20. Februar 2009 10:01:37 schrieb Mart Frauenlob:
> netfilter-owner@vger.kernel.org wrote:
> > Not sure if this is possible. I wish to create a rule that once
> > created will
> > automatically expire (and be removed) after say 10 minutes.
> >
> > Please
> >
> > Many thanks,
> > Colin.
>
> Hello,
>
> you did not tell much about your circumstances, but maybe worth takin=
g a
> look at fail2ban:
> http://www.fail2ban.org
>
> As it's main goal seems to temporarily lock out certain hosts.
>
> Greets
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Or you could utilize the recent module. see man iptables for more info =
about=20
recent.


--=20
Dr. Michael Schwartzkopff
MultiNET Services GmbH
Addresse: Bretonischer Ring 7; 85630 Grasbrunn; Germany
Tel: +49 - 89 - 45 69 11 0
=46ax: +49 - 89 - 45 69 11 21
mob: +49 - 174 - 343 28 75

mail: misch@multinet.de
web: www.multinet.de

Sitz der Gesellschaft: 85630 Grasbrunn
Registergericht: Amtsgericht M=FCnchen HRB 114375
Gesch=E4ftsf=FChrer: G=FCnter Jurgeneit, Hubert Martens

---

PGP Fingerprint: F919 3919 FF12 ED5A 2801 DEA6 AA77 57A4 EDD8 979B
Skype: misch42
