From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: quickie - exclamation point with multiport
Date: Wed, 17 Dec 2003 09:49:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071650977.906.10.camel@elendil.intranet.cartel-securite.net>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57C5D@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57C5D@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

Le mer 17/12/2003 =E0 09:25, Knight, Steve a =E9crit :
> Justa quick one - I use $DMZPORTS to define the ports I wish to be allo=
wed
> inbound on the forward chain - can I use=20
> ! -m multiport --dports $DMZPORTS
> to mean "any port that isn't specified by $DMZPORTS"?

Match is called "mport", not "multiport". So you call it using :

	-m mport [...]

The syntax you show is not good. You would have to write :

	-m mport ! --dports $DMZPORTS

Eventhough, mport help does not mention inversion :

cbr@elendil:~$ iptables -m mport --help
[...]
mport v1.2.8 options:
 --source-ports port[,port:port,port...]
 --sports ...
                                match source port(s)
 --destination-ports port[,port:port,port...]
 --dports ...
                                match destination port(s)
 --ports port[,port:port,port]
                                match both source and destination
				port(s)

So it seems that inversion is not available. If you try to invert, it
will not appear afterwards :

cbr@elendil:~$ sudo iptables -A INPUT -p tcp -m mport \
	! --dports 22,23 -j ACCEPT
cbr@elendil:~$ sudo iptables -L INPUT -vn Chain INPUT (policy ACCEPT
16456 packets, 13M bytes)
 pkts bytes target     prot opt in     out     source             =20
destination                                                              =
                  =20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0        mport dports 22,23

So I guess inverting mport is not possible. By the way, you can get it
using a user chain :

	iptables -N invert
	iptables -A invert -p tcp -m mport --dports 22,23 -j RETURN
	iptables -A INPUT -p tcp -j invert

Now you'll have all TCP packets that does not match TCP 22 and 23 as
destination port in invert chain.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

