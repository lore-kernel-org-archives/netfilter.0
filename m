From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 15:57:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072191475.816.129.camel@elendil.intranet.cartel-securite.net>
References: <20031223135629.38614.qmail@web60402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223135629.38614.qmail@web60402.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org

Le mar 23/12/2003 =E0 14:56, ads nat a =E9crit :
> Is it not allowed?

When a file is iptables-save generated, it's better not modifying it by
hand. Update your running ruleset then issue an

	iptables-save > iptables

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

