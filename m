From: "Christoph Leser" <Leser@sup-logistik.de>
Subject: AW: Two NICS with same IP and same client IP (fwd)
Date: Wed, 2 Feb 2005 22:08:17 +0100
Message-ID: <3E779DE9F923CA46A9BD3313B56EA3C3046551@win2000.sup-logistik.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: "R. DuFresne" <dufresne@sysinfo.com>, herve@lucidia.net, netfilter@lists.netfilter.org

why dont you read the questions and try to understand what has been =
asked.
it should be clear by now that the two interfaces are not on the same =
physical network ...=20

-----Urspr=FCngliche Nachricht-----
Von: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]Im Auftrag von R. DuFresne
Gesendet: Mittwoch, 2. Februar 2005 17:49
An: herve@lucidia.net; netfilter@lists.netfilter.org
Betreff: Re: Two NICS with same IP and same client IP (fwd)



Sorry, hit the wrong selection and set this to the wrong address off
list;;



What's surprising is tha there is not complaints about the duo IP being
assinged here, must be due to it being the same system, else I'd have
expected one nic to shut down the other with an error about IP dupes on
the net.

Folks are trying to tell you that you need to go over the basics of
networking again, then try and step into this with a refreshed clue.

Thanks,

Ron DuFresne

On Wed, 2 Feb 2005, Raphael Jacquot wrote:

> Herv=E9 wrote:
> >>having 2 interfaces on the same box with the same IP address
> >>
> >>repeat after me :
> >>
> >>WILL NOT WORK
> >=20
> >=20
> > Well, I can't see why not. Can you explain?
>=20
> uh, because that's how routing in the server PC works. you have to =
have=20
> a different address for each interface.
> your best bet is to either use the same interface (and change one of =
the=20
> client's IP to something else (like 192.168.100.3) like so :
>=20
> server             |         __________         client 1
> eth0:192.168.100.1 |--------| ethernet |------| 192.168.0.2
>                     |        |  switch  |
>                              |__________|------| 192.168.0.3
>                                                  client 2
>=20
> or... change one of the subnets to use a different prefix, like so :
>=20
> Server             |         | Client 1
> eth0:192.168.100.1 |---------| 192.168.100.2
>                     |                              | Client 2
> eth1:192.168.101.1 |------------------------------| 192.168.101.2
>=20

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




