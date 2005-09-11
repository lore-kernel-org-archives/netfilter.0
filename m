From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Is SIP 2.0 support available in IP-table
Date: Sun, 11 Sep 2005 09:09:03 +0200
Message-ID: <1126422543.5143.8.camel@anduril.intranet.cartel-securite.net>
References: <20050909230545.5504737E42@smtp4-1-sn2.hy.skanova.net>
	<65aa6af9050910210464493d25@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050910210464493d25@mail.gmail.com>
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
To: eantoranz@gmail.com
Cc: netfilter@lists.netfilter.org

Le dimanche 11 septembre 2005 =E0 00:04 -0400, Edmundo Carmona a =E9crit :
> I guess you have to look in telephony projects. netfilter is just a
> firewall... up to ISO layers 3 or 4

And 5 for some protocols such as FTP or IRC for thoses some other
connections are needed (FTP data, IRC DCC), with in protocol parameters
negociation. You then have to track the protocol in order to spot thoses
connections and be able to conntrack and/or nat the full session.

SIP is somehow a protocol of this kind, assuming you want to track all
connections implied by an IP phone. So it's not irrelevant for Netfilter
to "support" SIP, just like FTP, IRC, and others.

BTW, there's a sip-conntrack-nat module in patch-o-matic extra
repository. Maybe it can help OP.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

