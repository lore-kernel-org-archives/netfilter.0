From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Help logs with iptables
Date: Thu, 14 Apr 2005 10:05:52 +0200
Message-ID: <1113465952.32274.4.camel@nostromo.bgsecm.com>
References: <1113423418.28220.2.camel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113423418.28220.2.camel@admin.ucbcba.edu.bo>
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

El mi=C3=A9, 13-04-2005 a las 16:16 -0400, Jorge Enrique escribi=C3=B3:
> hi everyone, how can i get reports with iptables
>=20
> I have my script for my firewall but i need get reports for all traffic
> my network. How can I do it?

What I do is creating chains for the rules I want to report.
So I do:

iptables -N TCPCHAIN
iptables -A TCPCHAIN -j RETURN
iptables -A FORWARD -p tcp -j TCPCHAIN

I think you can see the trick. Then doing a iptables -L TCPCHAIN -xvn
you have the rules.

If you want a system to make reports you can have a look at our
bastion-firewall-stats addon. It's GPL, and you can have the sources
at our website. It creates rrdtool graphics in a web page with the data
gathered from the chains using a libipc based daemon.

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



