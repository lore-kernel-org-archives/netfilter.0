From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Outbound Connections fail.
Date: Mon, 14 Mar 2005 10:12:59 +0100
Message-ID: <1110791580.7055.10.camel@nostromo.bgsecm.com>
References: <20050314070617.5F6DEB6F5@xprdmailfe19.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050314070617.5F6DEB6F5@xprdmailfe19.nwk.excite.com>
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

El lun, 14-03-2005 a las 02:06 -0500, Praneeth Samineni escribi=C3=B3:
>  Hi!I am using Iptables on a RH 30 2.4 Kernel for INPUT connections fil=
tering, while allowing all OUTPUT.Inbound connections seems to work fine,=
 but outbound connections fail. Connection status is SYN_SENT on the SOUR=
CE side and SYN_RECV at the destination side, shows that ACK packets are =
getting filtered at INPUT chain. Does not IPTABLES allow the return packe=
ts of a connection initiated already thru IPTABLES? Are there any rules t=
o enable this apart from manually allowing return packets on port basis e=
verytime.Best WishesPraneeth Samineni

Yes, just allow the incoming ESTABLISHED and RELATED connections.

iptables -A INPUT -i <extif> -m state --state ESTABLISHED,RELATED -j
ACCEPT

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



