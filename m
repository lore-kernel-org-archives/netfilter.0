From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
	rules
Date: Sun, 12 Oct 2003 20:54:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065984839.4919.59.camel@elendil.intranet.cartel-securite.net>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	 <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
	 <20031011194527.17273de9.netfilter@lucassen.org>
	 <20031012111620.GB571@pcw.home.local>
	 <20031012195331.409596fc.netfilter@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031012195331.409596fc.netfilter@lucassen.org>
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
To: reply2@lucassen.org
Cc: netfilter@lists.netfilter.org

Le dim 12/10/2003 =E0 19:53, richard lucassen a =E9crit :
> case 1
> **************************************************************
> $IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
> [..]
> $IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT
> **************************************************************

Working...

> case 2 (I swapped rule 1 and 2)
> **************************************************************
> $IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
> $IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> [..]
> $IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT
> **************************************************************

Not working for SSH.

In fact, it should work. A TCP SYN flaged as NEW will be sent to CH_SSH
chain, then be accepted by CH_SSH rule that allows NEW packets. Then
further packets are going by. They are ESTABLISHED.

They match first rule so they are sent to CH_SSH chain. They do not
match the rule, for thieses packets are not NEW. So they hit end of user
chain and are returned to FORWARD chain, rule 2. They match rule 2 and
then get accepted.

If it does not work as your's, then you have a drop all rule at the end
of CH_SSH chain (I suppose) that prevents packet from returning from
user chain (CH_SSH here) to calling chain (FORWARD here).

To me, the best way to handle this is :

# ESTABLISHED and RELATED packets are accepted anyway
# We accept them first as they are most treated packets
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Then we care of each proto.
$IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
[...]
$IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT

Case 3 works because you enforce ESTABLISHED,RELATED accept in your use
chain.

I really do think that 1st case is the best way to handle, as it implies
less rules evaluation for each packet.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

