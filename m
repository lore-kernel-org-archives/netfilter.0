From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: flushing
Date: Fri, 28 Nov 2003 17:34:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070037256.826.47.camel@elendil.intranet.cartel-securite.net>
References: <1070035903.1086.6.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070035903.1086.6.camel@webmail.aeropostal.com.ve>
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
To: Juan Hernandez <alucard@kanux.com>
Cc: Lista de netfilter <netfilter@lists.netfilter.org>

Le ven 28/11/2003 =E0 17:11, Juan Hernandez a =E9crit :
> is there any better way to delete everything in memory than iptables
> -F?? it's just that it doesn't seem to delete everything sometimes

iptables -F just flush all filter table rules. If your really want to
flush _everything_, you have to :

	flush rules (-F)
	flush user chains (-X)

For all three tables :

	iptables -t mangle -F
	iptables -t mangle -X
	iptables -t nat -F
	iptables -t nat -X
	iptables -F
	iptables -X

And you're done ;) You'll maybe have to set default policy back also
using -P.

Note this won't flush conntrack table. To achieve this, you have to
unload ip_conntrack module. This means that some existing NAT sessions
will go on because state is still their.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

