From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Is this possible?
Date: Sun, 13 Feb 2005 13:18:38 +0100
Message-ID: <1108297118.10876.20.camel@nostromo.bgsecm.com>
References: <420CD815.1000806@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <420CD815.1000806@thompsonmike.co.uk>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

El vie, 11-02-2005 a las 16:06 +0000, Michael Thompson escribi=C3=B3:
> I have a issue where I cannot connect to my server because the firewall=
=20
> only allows ports 80 and 443 out.
>=20
> I previously ran SSH on port 443 to overcome this, but I have had to=20
> implement a HTTPS solution for users who wanted secure access, so that=20
> is now gone.
>=20
> This system has DNS records for ssh.server.co.uk and www.server.co.uk,=20
> so can I use IPTables or similar to recognise if it is being connected=20
> to via ssh.server.co.uk on port 443 and forward the traffic to port 22?=
=20
> If www.server.co.uk:443 is used apache gets the traffic? Or is this (As=
=20
> I suspect) Impossible?

I think the DNS trick it's impossible.
You should ask the administrator to open you the ssh port, if he
let you use the 443 to run sshd then why he doesn't let you do the
same in port 22/tcp or at least any other port he has open in his
firewall.

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



