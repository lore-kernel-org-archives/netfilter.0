From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DMZ howto
Date: Fri, 23 Sep 2005 11:24:52 -0500
Message-ID: <1127492692.6991.27.camel@anduril.intranet.cartel-securite.net>
References: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
	<4334268F.7030207@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4334268F.7030207@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg?= Harmuth <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

Le vendredi 23 septembre 2005 =E0 18:00 +0200, J=F6rg Harmuth a =E9crit :
> 3.) Other things that may come to mind :)

pppd has scripts triggered on up and down, with useful parameters, such
as IP address. Thus, you can add stuff to push filtering and NAT rules
that fits current configuration, whatever the configured IP can be.

More detailed info on pppd man page.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

