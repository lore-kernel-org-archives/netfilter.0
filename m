From: "Andriy Korud" <a.korud@vector.com.pl>
Subject: How to change TOS of NATed/forwarded packets?
Date: Tue, 16 Mar 2004 11:07:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <80908CC5B2C9DB47AAF8C77892FCB44314E18D@lion.vector.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I've noticed the following problem - I cannot change TOS value of NATed =
packet. I've tried to put rule in any chain of mangle table - no effect =
- packets ARE matching the rule (counters grows properly) but TOS =
remains unchanged.
What am I doing wrong?

thanks in advance,

--

Andriy Korud=20
sales support engineer=20
email: a.korud@vector.com.pl=20

VECTOR sp. z o.o.=20
ul. Krzemowa 6=20
81 - 577 Gdynia=20
POLAND=20
tel. +48 58 / 77 17 000=20
fax +48 58 / 77 17 100=20
<http://www.vector.com.pl/>=20


