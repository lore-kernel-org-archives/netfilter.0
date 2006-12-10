From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ipsec NAT pass through rule(s)?
Date: Sun, 10 Dec 2006 11:49:02 +0100
Message-ID: <1165747742.5125.15.camel@anduril.intranet.cartel-securite.net>
References: <5cc9c8f90612091547r4dd21922i8bf63d84b9c59c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5cc9c8f90612091547r4dd21922i8bf63d84b9c59c8@mail.gmail.com>
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
To: rabbtux rabbtux <rabbtux@gmail.com>
Cc: netfilter@lists.netfilter.org

Le samedi 09 d=E9cembre 2006 =E0 15:47 -0800, rabbtux rabbtux a =E9crit :
> Anyone have suggestions for a rule to allow IPsec packets to pass from
> a NATed subnet??  I know linksys,dlink, et. all have a firewall
> checkbox to alow ipsec vpns to work.

IPSEC implies IP protocols 50 (ESP) and sometimes 51 (AH). Therefore,
you have to handle them both. A (very) quick'n'dirty ESP NAT would be:

	iptables -t nat -A POSTROUTING -p 50 -j MASQUERADE
	iptables -A FORWARD -p 50 -j ACCEPT

Now, just adapt this to your own situation and push some rules with
subnet adresses, input and output interfaces, etc.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

