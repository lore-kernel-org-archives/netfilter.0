From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: iptables and wifi access point
Date: 28 Jul 2003 08:41:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059374464.837.5.camel@elendil.intranet.cartel-securite.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BFD0@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BFD0@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Jason <arnjuka@optonline.net>, netfilter@lists.netfilter.org

Le lun 28/07/2003 =E0 00:04, George Vieira a =E9crit :
> 1. Security =3D Forget WEP (or even 128bit WEP.. it sucks.). Use IPSEC
> tunnels over wifi.

It's better than nothing. I would say "do not have your secrity rely on
WEP". WEP sucks, that's a fact, but it introduces an authentication
scheme (i.e. have the right key to access network) that frightens most
of script kiddies.

> 3. DO NOT USE MAC FILTERING... Wifi can easily be spoofed mac
> addresses hence the reason for number 1 above.

Same than above. Yes, you can abuse easily this kind of security
setting, but it does not mean you do not have to use it. And you forgot
to mention BSSID broadcast disabling in beacon frames.

You have security features in WiFi that are not efficient enough to
bouild your security on top of them. But using them can make 90%
wardrivers to skip your AP just because they're activated.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

