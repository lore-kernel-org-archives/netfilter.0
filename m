From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: gateway without nat
Date: Thu, 07 Oct 2004 19:33:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097170416.2564.20.camel@anduril.intranet.cartel-securite.net>
References: <200410071631.58038.lcml@pixel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410071631.58038.lcml@pixel.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: lcml@pixel.it
Cc: netfilter@lists.netfilter.org

Le jeu 07/10/2004 =E0 16:31, Lucio a =E9crit :
> The problem is that I don't know how to make the kernel route packets b=
etween=20
> the DMZ and WAN NICs without using a SNAT rule: can anyone help me plea=
se?

Maybe I don't get your point there, but to simply route packets, you
just have to do :

	echo 1 > /proc/sys/net/ipv4/ip_forward

And then set FORWARD chain rules accordingly to traffic you want to
allow. And that's it.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

