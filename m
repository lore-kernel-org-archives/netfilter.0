From: David <dmarchan@supelec-rennes.fr>
Subject: Re: Incomming packets
Date: Tue, 11 Mar 2003 09:01:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030311090151.2d1a9c70.dmarchan@supelec-rennes.fr>
References: <20030311022151.022CCBFD2@webserver.emelytours.com.do>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030311022151.022CCBFD2@webserver.emelytours.com.do>
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
To: netfilter@lists.netfilter.org

Le Mon, 10 Mar 2003 22:21:51 -0400 (AST)
serguey.forcade@emelytours.com.do a =E9crit:

> Hello:
>=20
>     I'm trying to set a rule in my iptables configuration to accept incom=
ming connections from an specific host, (ie. iptables -A input -i eth0 -p t=
cp --dport 21 -s test.host -j ACCEPT ) and I keep getting the error:
>=20
> iptables v1.2.6a: host/network `test.host' not found
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> Does anyone know about it?
>=20
> Thanks
>=20


I'm quite a newbie but I really think it's a dns problem. I had this proble=
m and I, then, realised that my "dns provider" had filtered port 53...

--=20
Guitou

