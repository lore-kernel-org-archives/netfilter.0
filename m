From: "blaass" <blaass@elsat.net.pl>
Subject: ipt_unclean warnings
Date: Tue, 9 Mar 2004 10:39:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309093559.M96986@elsat.net.pl>
References: <20040309085714.M59133@elsat.net.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040309085714.M59133@elsat.net.pl>
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
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org


kernel 2.4.25_0.1 / iptables 1.2.9 newest / processor 2.2 / 512 ram /  pld-=
ra
1.1 + patches. Using advanced firewall + iplimit for 300 users (2 lines for
each user down/up).

And strange errors, ipt_unclean etc.=20

kernel: ipt_unclean: (embedded packet) UDP len too long 26 vs 46

I have this error one time per 2 - 3 secounds

And once a few minutes I get:

kernel: NET: 3 messages suppressed.

kernel: NET: 2 messages suppressed.

kernel: NET: 1 messages suppressed.

I need advice, thanks.

-----------------------------------------------------------------
Maciej "blaass" Bry=B3ka ^mojodo security team =3D  lastSEC Security^
------- End of Forwarded Message -------


-----------------------------------------------------------------
Maciej "blaass" Bry=B3ka ^mojodo security team =3D  lastSEC Security^

