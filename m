From: Guillaume Morin <guillaume@morinfr.org>
Subject: Re: State Match Question
Date: Thu, 6 Jun 2002 22:17:22 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020606201722.GD612@morinfr.org>
References: <5.1.0.14.0.20020606152834.02c4d128@mailhost.csca.ryerson.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <5.1.0.14.0.20020606152834.02c4d128@mailhost.csca.ryerson.ca>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Dunphy <pdunphy@research.ryerson.ca>
Cc: netfilter@lists.samba.org

Hi Paul,

Dans un message du 06 jun =E0 15:44, Paul Dunphy =E9crivait :
> Could some kind soul please explain to me (or point me to information=20
> about) what the difference is between filtering on state ESTABLISHED in=20
> iptables and filtering on ! --syn? In other words, what's the difference =

> between saying
>=20
> iptables -A FORWARD -p tcp -m state --state ESTABLISHED -j ACCEPT
>=20
> and saying,
>=20
> iptables -A FORWARD -p tcp ! --syn -j ACCEPT

In the first rule, you let only pass valid TCP packets correponding to a
established connection e.g a ack packet during the connection, a syn/ack
packet during the TCP handshake, a fin/ack at the end of a connection.

The second let every non SYN packet pass. That includes the packets
which are matched by the first rule of course. But invalid packets in
the sense of the connection state (a syn/ack packet without a previoous
syn packet) and packets with nasty flags (NULL, XMAS...) will pass.
That is bad. Always use the state and avoid matching yourself the TCP
flags. Matching both can be interesting e.g -m state --state NEW --syn.

HTH.

--=20
Guillaume Morin <guillaume@morinfr.org>

      A friend in need is a friend indeed. A friend who bleeds is better.
         My friend confessed, she passed the test. We will never sever.
                                   (Placebo)

