From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: I dont know how to forward port 80
Date: Sun, 13 Feb 2005 13:28:50 +0100
Message-ID: <1108297731.10876.28.camel@nostromo.bgsecm.com>
References: <420B54E3.8040900@google.com>
	<1108128247.4489.45.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108128247.4489.45.camel@hubcap.ljm.dom>
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

El vie, 11-02-2005 a las 08:24 -0500, Jason Opperisano escribi=C3=B3:
>   # allow input packets that are part of an established connection
>   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
>   # allow HTTP requests in
>   iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT

Sorry, I've seen in some of your answers that you never use
-m state --state NEW. Could you tell me why? I am updating
my firewall and I'm very confused with this, because you
seem to know everything about Netfilter and iptables, and
I am using the NEW state in all my rules. Should I do it
or should I not? And by the way, should I use the --syn
flag?

Thanks and Regards.

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



