From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: http page opens very slowly
Date: 03 Sep 2003 10:58:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062579504.1614.27.camel@kermit>
References: <200309030808.NAA16858@WS0005.indiatimes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309030808.NAA16858@WS0005.indiatimes.com>
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
To: akshaysalkar <akshaysalkar@indiatimes.com>
Cc: Netfilter Group <netfilter@lists.netfilter.org>

Am Mit, 2003-09-03 um 10.23 schrieb akshaysalkar:
> I have set up a basic firewall for a linuxbox. and blocked quite some por=
ts.=20
> out of which http port 80 is not blocked.
>=20
> when i open the page to the server. ie. the apache test page. it opens up=
 fast.
> however i have php-nuke also working on the server.
> that page opens up however it takes very long to open.
> ie. more than 3 mins. / page
> any idea why??
Memory? Since php-nuke is sql-based, your machine might be swapping like
hell.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

