From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: quickie - exclamation point with multiport
Date: Thu, 18 Dec 2003 08:50:22 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57C6F@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Cedric

I will head off to create a user-chain then :D thanks for your research!

And thanks to all others who contributed their wisdom :D

Thanks and mulled wine to all

steve

-----Original Message-----
From: Cedric Blancher [mailto:blancher@cartel-securite.fr]=20
Sent: 17 December 2003 4.18
To: Knight, Steve
Cc: netfilter@lists.netfilter.org
Subject: RE: quickie - exclamation point with multiport


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
destination

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




-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is=20
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce,=20
distribute, store, retransmit, use or disclose its contents to anyone.
=20
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


