From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re[3]: iplimit module refuses to work
Date: 11 Aug 2003 20:32:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060626736.730.22.camel@elendil.intranet.cartel-securite.net>
References: <63349768828.20030811132640@dslr.net>
	 <1060624988.728.6.camel@elendil.intranet.cartel-securite.net>
	 <183352264796.20030811140816@dslr.net>
	 <159352501562.20030811141213@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <159352501562.20030811141213@dslr.net>
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
To: justin <justin@dslr.net>
Cc: netfilter@lists.netfilter.org

Le lun 11/08/2003 =E0 20:12, cmbb@dslr.net a =E9crit :
> CONFIG_IP_NF_MATCH_IPLIMIT=3Dm
> um, is there another secret hidden option, not checked, that has to be
> turned on before the iplimit module will work, even though it compiles
> ok as a module and can be insmod'd ok?

Well, there's no secret option, but usually, this kind of error occurs
when iptables has been built with options kernel does not support. But
it does not seem to be the case here.

It can also occurs when your kernel side Netfilter stuff version is too
different from iptables one. I don't use iplimit, so I may be wrong, but
sometimes, your iptables version can have options for a match that your
kernel module does not support, because it's too old, or options is
deprecated. I had the case with ROUTE target, and got this error.

Just my, maybe pointless, 0.02=A4...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

