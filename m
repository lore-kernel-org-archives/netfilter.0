From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: REDIRECT to localhost
Date: Mon, 16 Aug 2004 07:15:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092654950.27598.13.camel@tarkus>
References: <20040816082400.5165.qmail@flock1.newmail.ru>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20040816082400.5165.qmail@flock1.newmail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-5"
To: =?iso-8859-5?Q?=BF=DE=DF=DE=D2_=B8=D3=DE=E0=EC_?= =?iso-8859-5?Q?=BD=D8=DA=DE=DB=D0=D5=D2=D8=E7?= <igorpopov@newmail.ru>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-08-16 at 12:24 +0400, =BF=DE=DF=DE=D2 =B8=D3=DE=E0=EC =
=BD=D8=DA=DE=DB=D0=D5=D2=D8=E7 wrote:
> Hi All,
> I have server, that connects my localnet to inet, clients connects =
to me via PPPoE (ppp[1-9]). I want to run squid on localhost and I wa=
nt my clients to connect to it.
>=20
> Can somebody help me with redirect rules?
>=20
>=20
>=20
> Igor Popov <igorpopov@newmail.ru>
> icq 241601876
> __________
> www.newmail.ru -- =D1=D5=E1=DF=DB=D0=E2=DD=D0=EF =DF=DE=E7=E2=D0, =
=D1=D5=E1=DF=DB=D0=E2=DD=EB=D9 =E5=DE=E1=E2=D8=DD=D3.
>=20

iptables -t nat -A PREROUTING -i "name of interface" -p tcp -m tcp --
dport 80 -j REDIRECT --to-ports 3129

If your default policy is to DROP all INPUT/FORWARD as is it should b=
e.


iptables -A INPUT -i "name of interface" -p tcp -m tcp --dport 80 -j
ACCEPT


You can also use -s "ip address" instead of -i  "name of interface".

Also, you must put the rules in the proper order in the chain, so -A =
or
-I depends on you.


Ted




