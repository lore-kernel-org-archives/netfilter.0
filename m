From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables for spoofing
Date: 04 Apr 2003 16:19:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049465950.4794.1.camel@elendil.intranet.cartel-securite.net>
References: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
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
To: Julio Cesar Ody <julioody@bol.com.br>
Cc: netfilter@lists.netfilter.org

Le ven 04/04/2003 =E0 15:19, Julio Cesar Ody a =E9crit :
> Hello. I'm taking some classes on
> iptables, and I heard it's possible to
> use iptables to spoof outgoing packets
> (or any packet at all).
> So, my question is: How do I do it ?
> How can I alter the source address of
> a given packet using iptables ?

Use SNAT :

	iptables -t nat -A POSTROUTING <packet def.> -j SNAT --to $IP

And you're done.

You should read Filtering and NAT HOWTO on http://www.netfilter.org/.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

