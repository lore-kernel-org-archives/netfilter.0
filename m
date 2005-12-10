From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: QoS with netfilter
Date: Sat, 10 Dec 2005 20:45:23 +0100
Message-ID: <1134243923.3532.8.camel@anduril.intranet.cartel-securite.net>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<200512101357.44378.arny@ats.s.bawue.de>
	<bab495710512100528h5103dd81t35a56afe726a7b7b@mail.gmail.com>
	<1134232492.31448.0.camel@anduril.intranet.cartel-securite.net>
	<bab495710512101014g6909071s2e69552681c39cd3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bab495710512101014g6909071s2e69552681c39cd3@mail.gmail.com>
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
To: Erik <erikev@gmail.com>
Cc: netfilter@lists.netfilter.org, Thilo Schulz <arny@ats.s.bawue.de>

Le samedi 10 d=E9cembre 2005 =E0 10:14 -0800, Erik a =E9crit :
> dscp is not important. You have a suggestion how to set TOS?
> I would ideally like to controll the whole byte. Either TOS or DSCP and E=
CN.
> How can I change all these bits (i.e. the whole byte) with the
> netfilter mangle table or other?

I think you're taking the problem the wrong way. Altering DSCP/TOS won't
change the way packets are treated, because by default, there's no QoS
policy. So you'll have to set a QoS policy yourself that fits your
needs.

To do this, you have to read LARTC as adivsed before. Then, your QoS
policy can be built upon TOS/DSCP value, but you can use stuff like u32
classifier or MARK.

Have you tried stuff like cbq-init or htb-init (see Google) ?


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

