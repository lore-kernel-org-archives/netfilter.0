From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Problems with DNS
Date: Sun, 07 Sep 2003 14:53:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062939198.754.17.camel@elendil.intranet.cartel-securite.net>
References: <HMEKJPOHJKKBIDHGBCMDMEHBCAAA.varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEKJPOHJKKBIDHGBCMDMEHBCAAA.varyag18@mail.ru>
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

Le dim 07/09/2003 =C3=A0 14:15, =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=
=D1=80 =D0=9F=D0=BE=D1=82=D0=B0=D0=BF=D0=BE=D0=B2 a =C3=A9crit :
> DNS worked ok.Thank you.
> But my mail server only can send message from local to the internet,
> but don't accepting any mail from internet.
[...]
> -A PREROUTING -d 121.1.1.1 -i eth0 -p tcp -j DNAT --to-destination
> 192.168.5.2=20
> -A PREROUTING -d 121.1.1.1 -i eth0 -p udp -j DNAT --to-destination
> 192.168.5.2=20
> -A POSTROUTING -o eth0 -j SNAT --to-source 121.1.1.1
> -A allow -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j ACCEPT=20
> -A allow -p tcp -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT=20
> -A allow -p tcp -j LOG=20
> -A allow -p tcp -j DROP =20
> -A FORWARD -d 192.168.5.2 -i eth0 -o eth1 -p tcp -m tcp --dport 25 -j
> allow=20
> -A FORWARD -s 192.168.5.2 -i eth1 -o eth0 -p tcp -m tcp --dport 25 -j
> allow

Because you do exactly the same mistake than before. You do not have a
rule to accept returning packets for STMP connections, both way, as they
are not destined to TCP port 25, but sourced from this port.

As I mentionned before, you _really_ should get rid of this "allow"
chain and have everything handled with a generic ESTABLISHED,RELATED
state matching at ruleset top :

	-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
	-A FORWARD -d 192.168.5.2 -i eth0 -o eth1 -m state \
		--state NEW -p tcp -m tcp --dport 25 --syn -j ACCEPT
	-A FORWARD -s 192.168.5.2 -i eth1 -o eth0 -m state \
		--state NEW -p tcp -m tcp --dport 25 --syn -j ACCEPT

> In log I see that other mail server want to connect to me at sport 25.
> But it's not correct.

You should copy the log entry so one can show you what's wrong with it.



PS : please keep Cc to the list as every thread can be useful for other
     people with similar issues (i.e. reply all).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

