From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: change MAC address
Date: 23 Jan 2005 20:39:49 +0100
Message-ID: <1106509188.6143.1.camel@nostromo.bgsecm.com>
References: <20050121221348.37806.qmail@web51903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050121221348.37806.qmail@web51903.mail.yahoo.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 21 de 01 de 2005 a las 23:13, Alireza Yazdani escribi=C3=B3:
> Hello,
> I have a network with wireless connection.
> I manage user by MAC address in accesspoint.
> some invalid user get the vaild MAC address from valid user.
> and change his MAC . then thay can come to my network.
> what is your solution?

Install a Freeradius solution to authentificate the clients,
that will solve your problems. It's a little complicate to
configure it, but it's the best solution if you need real
security.

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


