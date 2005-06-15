From: "Rakotomandimby (R12y) Mihamina"
	<mihamina.rakotomandimby@etu.univ-orleans.fr>
Subject: Re: When do the rule apply?
Date: Thu, 16 Jun 2005 00:26:10 +0200
Message-ID: <pan.2005.06.15.22.26.10.923499@etu.univ-orleans.fr>
References: <393114f905061513012ac2216a@mail.gmail.com>
	<20050615201007.GA754@strugglers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Andy Smith <andy@strugglers.net> :
> They apply in the order you've issued them since they are operating on
> INPUT and they are appending.

I would add that the original poster can use the -P first, that will match
any paquet that does not match the listed rules.

--=20
Miroir de logiciels libres        http://www.etud-orleans.fr
D=E9veloppement de logiciels libres http://aspo.rktmb.org/activites/develop=
pement
Infogerance de serveur d=E9di=E9      http://aspo.rktmb.org/activites/infog=
erance
(En louant les services de l'ASPO vous luttez contre la fracture numerique)



