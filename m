From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Spoofing
Date: Wed, 5 Nov 2003 19:51:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

On Wednesday 05 November 2003 7:31 pm, Leandro Takashi Hirano wrote:

> Thanks for the port scanner help....
>
> Now I would like to know about the IP Spoofing rule, how does it works?
>
> -	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP

Any packet with a source address in the Class C range 192.168.1.x which d=
oes=20
not come from eth0 will be DROPped.

> -	iptables -A INPUT ! -s 192.168.1.0/24 -i eth0 -j DROP

Any packet which comes from eth0 and has a source address other than the=20
Class C  192.168.1.x will be DROPped.

> I don=B4t know how can it block ip spoofing attack...

These rules assume that eth0 is your internal network, and your internal=20
network range is 192.168.1.0/24.

No packets with your own source address should come from outside (rule 1)=
 and=20
all packets from inside should have your own source address (rule 2).

Therefore these two rules stop people on the outside pretending that they=
=20
live on your network, and people on the inside pretending that they don't.

Antony.

--=20

In Heaven, the police are British, the chefs are Italian, the beer is=20
Belgian, the mechanics are German, the lovers are French, the entertainme=
nt=20
is American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is Americ=
an,=20
the mechanics are French, the lovers are Swiss, the entertainment is Belg=
ian,=20
and everything is organised by the Italians.
                                                     Please reply to the =
list;
                                                           please don't C=
C me.

