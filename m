From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: uid-owner
Date: Fri, 14 Jul 2006 15:09:45 +0200
Message-ID: <1152882585.2335.0.camel@anduril.intranet.cartel-securite.net>
References: <12ec50350607140522p40cc8a86jd5b08fa88a555900@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12ec50350607140522p40cc8a86jd5b08fa88a555900@mail.gmail.com>
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
To: "Fabio S. Silva" <fabiofoz@gmail.com>
Cc: netfilter@lists.netfilter.org

Le vendredi 14 juillet 2006 =E0 09:22 -0300, Fabio S. Silva a =E9crit :
> iptables -A OUTPUT -m owner --uid-owner fabio -j DROP

$ iptables -m owner --help
[...]
[!] --uid-owner userid     Match local uid

It suggests you hould be using UID instead for username.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

