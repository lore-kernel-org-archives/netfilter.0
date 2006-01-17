From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: port translation and POSTROUTING question
Date: Tue, 17 Jan 2006 10:44:12 +0100
Message-ID: <1137491052.4725.5.camel@anduril.intranet.cartel-securite.net>
References: <b93ea24d0601170111x1afd10f9wac2d1446d255d945@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b93ea24d0601170111x1afd10f9wac2d1446d255d945@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Ga=EBl?= Lams <lamsgael@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mardi 17 janvier 2006 =E0 10:11 +0100, Ga=EBl Lams a =E9crit :
> What is not clear to me, even after reading man pages, netfilter.org
> documentation, and various tutorials, is what rule to write to have
> the packets (the ones sent back to who made the request) moved from
> port 8080 to port 80.

No rule.

Once a connection has been registred as NATed by conntrack, any packet
belonging to this connection will be handle automaticly by conntrack/nat
subsystem. That's why you only see connections first packet in nat
table.

You need a rule in POSTROUTING only if your proxy is to establish
connections to otheres hosts.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

