From: Arturo Borrero <aborrero@cica.es>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Tue, 28 Aug 2012 10:55:33 +0200
Message-ID: <CAPfcJas2Cz8VCDe+FG8oVVzmhVyq0=s7vKHhorFgPdM5jwLSdg@mail.gmail.com>
References: <50375A06.6000808@cica.es> <1345818598.2977.265.camel@denise.theartistscloset.com>
 <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr> <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com>
 <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr> <CAPfcJaugwb5DboUYGAfEktHCDZX0KxdCWdS9CyAu3rh94P8inQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJaugwb5DboUYGAfEktHCDZX0KxdCWdS9CyAu3rh94P8inQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: julien@linuxwall.info
Cc: netfilter@vger.kernel.org

> On 2012-08-24 19:46, Jan Engelhardt wrote:
> > On Friday 2012-08-24 23:12, Arturo Borrero wrote:
>
> >>You usally set your ruleset in this way:
> >>
> >>$IPT -A INPUT -i $IF -s $INTERNET -d $MYSERVER -p tcp --sport 1024:
> >> --dport
> >>$SSH_PORT -j ACCEPT
> >
> > If you begin with something like this, no wonder it's all going slo=
w,
> > because you are needlessy reloading all the damn rules.
> > That's why smart people use iptables-restore.
> >
>
> Oh, only about ~2000 times faster in my tests :p
> http://www.slideshare.net/slideshow/embed_code/14051936?startSlide=3D=
22

Well, but the problem of writting two different rulesets with the same
info is still unsolved.

And If you permit my point of view, I think it's harder to solve using
iptables-restore than using bash and iptables/ip6tables (because
variables, additional flexibility of bash, etc...)

Maybe the point would be to generate with Bash a iptables-restore
ruleset to load to kernel, but not load the ruleset directly from
Bash...


--
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica, @NIS_CICA (twitter)
Centro Informatico Cientifico de Andalucia (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa
