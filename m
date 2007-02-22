From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: -s THIS ? (address belongs to one of of interfaces of local
	machine) ?
Date: Thu, 22 Feb 2007 13:25:00 +0100
Message-ID: <1172147100.16646.18.camel@anduril.intranet.cartel-securite.net>
References: <f36b08ee0702210408h5db5027bmb1105d0d7d74cb17@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f36b08ee0702210408h5db5027bmb1105d0d7d74cb17@mail.gmail.com>
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
To: Yakov Lerner <iler.ml@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mercredi 21 f=E9vrier 2007 =E0 07:08 -0500, Yakov Lerner a =E9crit :
> Is there an easy way to specify '-s LOCAL', meaning
> not 127.0.0.1, but meaning that address matches any of
> addresses of interfaces belonging this this machine ?

All locally generated packets cna be filtered in OUTPUT chain, nowhere
else. That's a pretty convenient way to spot them. The same idea goes to
packets destined to local addresses, that end in INPUT chain, nowhere
else.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

