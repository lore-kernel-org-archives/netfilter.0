From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Problems with DNS
Date: Sat, 06 Sep 2003 10:11:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062835860.766.54.camel@elendil.intranet.cartel-securite.net>
References: <HMEKJPOHJKKBIDHGBCMDOEGHCAAA.varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEKJPOHJKKBIDHGBCMDOEGHCAAA.varyag18@mail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?koi8-r?Q?=F7=CC=C1=C4=C9=CD=C9=D2_?= =?koi8-r?Q?=F0=CF=D4=C1=D0=CF=D7?= <varyag18@mail.ru>
Cc: netfilter@lists.netfilter.org

Le ven 05/09/2003 =C3=A0 19:47, =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=
=D1=80 =D0=9F=D0=BE=D1=82=D0=B0=D0=BF=D0=BE=D0=B2 a =C3=A9crit :
> I have some problems with DNS and iptables.
[...]
> Problem:
> My packet filter couldn't forward dns udp query to the internet and fro=
m
> internet to local .What I'm doing wrong ?

I just quote UDP DNS related rules, for TCP stuff seems OK.

> -A POSTROUTING -o eth0 -j SNAT --to-source 121.1.1.1
> -A FORWARD -d 192.168.5.0/255.255.255.0 -i eth0 -o eth1 -p udp -m
> udp --dport 53 -j ACCEPT
> -A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -p udp -m
> udp --dport 53 -j ACCEPT

Your requests will get forwarded for there's a rule in FORWARD chain to
accept them (2nd one below). But, there's no rule to accept returning
packets. You so have to implement rules to accept them, both way.

You can also use state matching, allowing ESTABLISHED UDP packets to go
through FORWARD chain. At this time, you only use state matching for TCP
ones.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

