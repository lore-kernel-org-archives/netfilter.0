From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ntpdate works; ntpd doesn't
Date: Fri, 02 Apr 2004 22:25:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080937521.1655.55.camel@anduril.intranet.cartel-securite.net>
References: <200404021950.i32JoiCO012686@osprey.tkevans.com>
	 <200404022104.39456.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404022104.39456.Antony@Soft-Solutions.co.uk>
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

Le ven 02/04/2004 =E0 22:04, Antony Stone a =E9crit :
> I believe ntpd uses the "time" protocol on port 37, whereas netdate and=
=20
> ntpdate uses "ntp" on port 123.

Mine uses UDP/123 :

cbr@feydreiva:~$ netstat -aun
Connexions Internet actives (serveurs et =E9tablies)
Proto Recv-Q Send-Q Adresse locale          Adresse distante        Etat
udp        0      0 172.16.14.17:123        0.0.0.0:*
udp        0      0 127.0.0.1:123           0.0.0.0:*
udp        0      0 0.0.0.0:123             0.0.0.0:*

And the related conntrack entry for the synchro after daemon rehash :

udp      17 23 src=3D172.16.14.17 dst=3D172.16.14.1 sport=3D123 dport=3D1=
23
src=3D172.16.14.1 dst=3D172.16.14.17 sport=3D123 dport=3D123 use=3D2 mark=
=3D0


PS : seems you lost your bet ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

