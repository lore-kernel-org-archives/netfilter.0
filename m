From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: firewall ignore the rule
Date: Wed, 13 Jul 2005 13:08:15 +0200
Message-ID: <1121252895.11584.6.camel@anduril.intranet.cartel-securite.net>
References: <2452665f0507130352544ab556@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2452665f0507130352544ab556@mail.gmail.com>
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
To: liyas_m m <liyasmm@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mercredi 13 juillet 2005 =E0 18:52 +0800, liyas_m m a =E9crit :
> The problem is  when i try to block traffic from certain address , it
> just does not work
> e.g
> iptables -A INPUT -s 10.5.33.22 -j DROP

If your work on routed traffic, then you have to put this rule on
FORWARD chaine :

	iptables -A FORWARD -s 10.5.33.22 -j DROP


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

