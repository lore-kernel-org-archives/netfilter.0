From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Port 25
Date: Mon, 7 Feb 2005 13:30:20 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502071325260.15692-100000@darkstar.sysinfo.com>
References: <1107767854.10815.3.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107767854.10815.3.camel@nostromo.bgsecm.com>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On 7 Feb 2005, Jose Maria Lopez wrote:

> El dom, 06 de 02 de 2005 a las 22:03, Jason Opperisano escribi=C3=B3:
> > Ron has an excellent point here about IDENT.  a "good Internet citize=
n"
> > thing to do when running a mail server is to reject ident instead of
> > dropping it:
> >=20
> >   iptables -A INPUT -p tcp --syn --dport 113 \
> >     -j REJECT --reject-with tcp-reset
>=20
> Isn't it advisable for every tcp port you want to block?
> I have some documentation that says that doing otherwise
> it's even bad for your network communications.
>=20

I've never heard it is bad, but, te question is how nice one wishes to be
to those trying to transgess your security profile.  I tend to use alot o=
f
drops, especially for ports like ftp, telnet, some of the printer and
shell exec ports, any ports trojans are fond of.  The drop make the other
end continue trying till the command/connect attepmt is either aborted or
timesout, and with autoomated attacks, that can slow down the how little
nasty prog.  Kinder to me and my other servers, as well as others on the
net when I can slow these things down some.  Reject with rst, those are
for the ports that you wish to treat the otherend nicely from.

Thanks,

Ron DuFresne
--=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


