From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: IDS better than hardcore iptables rules?
Date: Sun, 6 Feb 2005 15:34:12 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502061533170.352-100000@darkstar.sysinfo.com>
References: <1107695009.20774.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107695009.20774.1.camel@nostromo.bgsecm.com>
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

On 6 Feb 2005, Jose Maria Lopez wrote:

> El dom, 06 de 02 de 2005 a las 07:29, seberino@spawar.navy.mil escribi=C3=
=B3:
> > Hudson & Ron
> >=20
> > I'm not sure there even exists documentation to explain
> > some of the DROP rules I see in firewall scripts.
> >=20
> > Have you seen guys like these?...
> >=20
> >  -p tcp --tcp-flags ACK,FIN FIN -j DROP
> >  -p tcp --tcp-flags ACK,PSH PSH -j DROP
> >  -p tcp --tcp-flags ACK,URG URG -j DROP
> >=20
> > What TCP/IP book tells you that FIN, PSH and URG packets
> > usually have ACK set?  **These** are the rules I don't
> > know how to understand.
> >=20
> > Chris
>=20
> They *don't* have the ACK set, that's because they are
> dropped, because it's anormal traffic, probably portscans.
>=20

Can't these kind of packets get handled by an INVALID match, with one
rule per appropriate chain?


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


