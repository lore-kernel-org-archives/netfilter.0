From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: quickie - exclamation point with multiport
Date: Wed, 17 Dec 2003 17:18:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071677893.904.16.camel@elendil.intranet.cartel-securite.net>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57C60@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57C60@OST_EXCH_USR5>
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

Le mer 17/12/2003 =E0 11:00, Knight, Steve a =E9crit :
> Aha - that would explain why I was confused ....

My fault. Sorry about this. Thanks Laurence for correction.

Nervertheless, multiport match does not seem to support inversion
either.

cbr@elendil:~$ sudo iptables -A INPUT -p tcp -m multiport  \
		! --sports 22,23 -j ACCEPT
cbr@elendil:~$ sudo iptables -L INPUT -vn
Chain INPUT (policy ACCEPT 33337 packets, 19M bytes)
 pkts bytes target     prot opt in     out     source             =20
destination                                                              =
                  =20
   30  3897 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0        multiport sports 22,23

A SSH session is running and I can see counter get up.

You can still use the userchain trick to get what you want to do, with
multiport match ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

