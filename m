From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Iptables rules comparation
Date: 30 Oct 2004 23:00:13 +0200
Message-ID: <1099080736.22637.16.camel@nostromo.bgsecm.com>
References: <000d01c4baa2$35a17ae0$023ca8c0@cfg.onat.gov.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000d01c4baa2$35a17ae0$023ca8c0@cfg.onat.gov.cu>
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

El lun, 25 de 10 de 2004 a las 16:52, J.R. Barreras escribi=C3=B3:
> Hi all!
> How can I do compare iptables rule sets produced by different scripts?
> Any tools? Ideas?
>=20
> Waiting for yours reply, thanks in advance...
>=20
> Best wishes!
> Barreras

The best thing you can do it's run each of the scripts and
do some firewall stressing to the firewall. You can use the
following tools to check your firewall rules:

nmap: Check opened/closed ports and combinations of attacks to them
hping2: Check the ICMP configuration of the firewall and do some attacks
 to it.
nessus: See what attacks the firewall it's blocking or not.

As you can see you can use any tool that helps you to check the
firewall, it's like doing penetration testing on your own firewall.
This way you can find what script works better and blocks/accepts
the packets you want.

Another good idea it's to check the scripts by hand if you know
iptables syntax. I would advise you this it's the best way to
check the firewall, and see what rules you are using.

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


