From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: port forwarding partially working
Date: Wed, 16 Feb 2005 22:17:08 +0100
Message-ID: <1108588628.3944.13.camel@anduril.intranet.cartel-securite.net>
References: <4213B3F5.1010508@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4213B3F5.1010508@unp.edu.ar>
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
To: "Raul I. Becette" <raulbecette@unp.edu.ar>
Cc: netfilter@lists.netfilter.org

Le mercredi 16 f=E9vrier 2005 =E0 17:58 -0300, Raul I. Becette a =E9crit :
> I am having trouble forwarding ports to internal servers.
> $IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1024 -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1024 -j DNAT=20
> --to $SERV_BIBL:110
> works ok when I telnet $PUB_IF 1024. I got redirected to the POP server=20
> with no problems.

I should not.

If you DNAT your connexion to $PUB_IF port 1024 to $SERV_BIBL:110, then
your FORWARD chain will see a packet to destined to port 110, not 1024.
If you just look at Netfilter architecture, you will see FORWARD chain
traversal occurs _after_ PREROUTING traversal. Thus, packets are already
NDATed and have their destination modified when hitting FORWARD rules.

That's why, in order to accept your DNATed connection, you should have :

$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT

If it works anyway, it means you must have some kind of overlaping rule
that accidentally accepts thoses packets.

Now, going to your script, there's indeed a rule that accepts
destination port 110 whatever their destination is :

$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT

So your stuff works, but that's an accident !


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

