From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: I dont know how to forward port 80
Date: Tue, 15 Feb 2005 10:16:57 +0100
Message-ID: <1108459017.6825.3.camel@nostromo.bgsecm.com>
References: <420B54E3.8040900@google.com>
	<1108128247.4489.45.camel@hubcap.ljm.dom>
	<1108297731.10876.28.camel@nostromo.bgsecm.com>
	<1108420370.4338.23.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108420370.4338.23.camel@hubcap.ljm.dom>
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

El lun, 14-02-2005 a las 17:32 -0500, Jason Opperisano escribi=C3=B3:
> for the sake of clarity.  when someone asks, "how do i allow http into
> my machine" it seems clearer to say:
>=20
>   iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
>=20
> rather than:
>=20
>   iptables -A INPUT -m state --state NEW -p tcp --syn \
>     --sport 1024:65535 --dport 80 -j ACCEPT
>=20
> you're not going to make me add a disclaimer to all my posts that says
> "any rules are included to clarify a point of discussion.  do not use
> the rules posted without understanding the full security implications o=
f
> such an act.  firewall rules lasting more than four hours require
> medical attention."

Thanks for the info. I was really bothered by this matter. I thought
it was OK, but after reading your posts I was really confused.

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



