From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ARP Reply with wrong MAC
Date: Tue, 14 Dec 2004 11:35:01 +0100
Message-ID: <1103020501.4557.13.camel@anduril.intranet.cartel-securite.net>
References: <twig.1103020049.65314@basti79.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <twig.1103020049.65314@basti79.de>
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
To: Sebastian <netfilter@basti79.de>
Cc: netfilter@lists.netfilter.org

Le mardi 14 d=E9cembre 2004 =E0 10:27 +0000, Sebastian a =E9crit :
> A Linux box (kernel 2.4.24) with 2 ethernet interfaces connected to the s=
ame
> physical backbone. eth0 (public IP) and eth1 (10.0.0.1).
> Sometime it ocures that an arp-request for 10.0.0.1 is answered with the
> mac-address of eth0. (proxy_arp on all interfaces is off)

One which interface this request is received ? If it's eth0, then it's
normal.

BTW, what's the connection with Netfilter ?


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

