From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Problems with DNS
Date: Sat, 06 Sep 2003 14:49:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062852576.766.68.camel@elendil.intranet.cartel-securite.net>
References: <HMEKJPOHJKKBIDHGBCMDIEGLCAAA.varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEKJPOHJKKBIDHGBCMDIEGLCAAA.varyag18@mail.ru>
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

Le sam 06/09/2003 =C3=A0 12:53, =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=
=D1=80 =D0=9F=D0=BE=D1=82=D0=B0=D0=BF=D0=BE=D0=B2 a =C3=A9crit :
> And which chain a need yo add to ruleset?

Just rewrite your ruleset as follow :

# nat table
-A PREROUTING -t nat -d 121.1.1.1 -i eth0 -p tcp -j DNAT \
		--to-destination 192.168.5.2
-A PREROUTING -t nat -d 121.1.1.1 -i eth0 -p udp -j DNAT \
		--to-destination 192.168.5.2
-A POSTROUTING -t nat -o eth0 -j SNAT --to-source 121.1.1.1

# filter table
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -d 192.168.5.2/255.255.255.255 -i eth0 -o eth1 -m state \
		--state NEW -p tcp -m tcp --dport 53 --syn -j ACCEPT
-A FORWARD -d 192.168.5.2/255.255.255.255 -i eth0 -o eth1 -m state \
		--state NEW -p udp -m udp --dport 53 -j ACCEPT
-A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -m state \
		--state NEW -p tcp -m tcp --dport 53 --syn -j allow
-A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -m state \
		--state NEW -p udp -m udp --dport 53 -j ACCEPT

It should provide the same filtering functionnalities you wanted, plus
returning packets accept through ESTABLISHED,RELATED rule. If you really
want to restrict it to TCP and UDP only, just replace this rule with two
more specific ones :

-A FORWARD -m state --state ESTABLISHED,RELATED -p udp -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -p tcp -j ACCEPT

I removed rules that seems redundant, in particular your TCP flags check
rule that was replaced with --syn switch addition. I also restricted
inbound DNS filtering to 192.168.5.2 only.

Hope this helps.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

