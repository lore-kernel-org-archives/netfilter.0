From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNAT question..
Date: 24 Jul 2003 16:16:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059056211.1168.40.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0307241040530.20694-100000@localhost>
	 <3F1FE12B.EB91AB1B@goyaike.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1FE12B.EB91AB1B@goyaike.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Gonzalez, Federico" <fgonzalez@goyaike.com>
Cc: netfilter@lists.netfilter.org

Le jeu 24/07/2003 =E0 15:37, Gonzalez, Federico a =E9crit :
>    I think the problem is in the destination IP address, you have to us=
e the
> external IP, so i think the rule should be:
> iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 211.1.1.10
>    --dport 80 -j SNAT --to 192.168.1.1

Don't think so. In POSTROUTING chain, DNAT has already occured, then
original destination (211.1.1.10) has already been changed to
192.168.1.2.

Problem must sit elsewhere (next to the truth out there) ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

