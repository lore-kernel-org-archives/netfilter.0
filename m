From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: What is the application sending packet out?
Date: Fri, 4 Feb 2005 22:35:52 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502042231340.352-100000@darkstar.sysinfo.com>
References: <1107551244.24666.21.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107551244.24666.21.camel@nostromo.bgsecm.com>
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

On 4 Feb 2005, Jose Maria Lopez wrote:

> El vie, 04 de 02 de 2005 a las 21:41, Mohammad Khan escribi=C3=B3:
> > Hello List,
> >=20
> > I am not sure about some packet was trying to go out from my router.
> > Is there a way to know, what application(s) is/are sending those
> > packets?
> >=20
> > Thanks
> > Mohammad
>=20
> Yes, it's very easy. Just use ethereal to capture the packets
> and identify the ports the application it's using to send the
> packets, then use lsof -i to see what application it's using
> that port.
>=20
> Regards.
>=20
>=20

In most cases it is easier then that.  Knowing the ports that specific
apps use can be the first determiner or narrower for making a possible
answer pop up.  Netstat on the server in qustion is another method, lsof
is not as common a tool on many vendor offerings still, and then if all
else is failing falling back upon traffic captures from the wire.  Most
the time the level of paranoia of going to the most aggresive and
technically challenging mode is a 'ramp-up' kinda thing.

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


