From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 16:31:34 +0200
Message-ID: <1119364294.4923.17.camel@anduril.intranet.cartel-securite.net>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>  <42B7DF8D.3060304@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42B7DF8D.3060304@linuxmail.org>
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
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

Le mardi 21 juin 2005 =E0 17:36 +0800, Feizhou a =E9crit :
> netfilter's conntrack module sucks in performance and at the same time=20
> is not fully stateful.

The last serious paper I could read about performances comparison was
published on pf website long ago and desmonstrated a clear advantage for
Netfilter against pf or ipf.

	http://www.benzedrine.cx/pf-paper.html

However, at this time, Netfilter was indeed not fully stateful. But it's
no longer the case as Netfilter now implements TCP window tracking in
stock kernels.

If you know good comparisons published, I wuold be happy to read them.

> If I wanted a stateful firewall, I would go for a OpenBSD solution.

Question of feeling essentially now, and other functionnalities. For
instance, if I need hot failover, I will go to OpenBSD.


There may be other problems I'm not aware of, so please back your
affirmations if it's the case. Thx.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

