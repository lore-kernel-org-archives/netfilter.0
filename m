From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re[2]: Problems with DNS
Date: Mon, 08 Sep 2003 15:44:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063028676.1133.11.camel@elendil.intranet.cartel-securite.net>
References: <E19wLUt-000PXD-00.varyag18-mail-ru@f21.mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E19wLUt-000PXD-00.varyag18-mail-ru@f21.mail.ru>
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
To: =?koi8-r?Q?=22?=Vladimir Potapov=?koi8-r?Q?=22=20?= <varyag18@mail.ru>
Cc: netfilter@lists.netfilter.org

Le lun 08/09/2003 =E0 14:51, =3D?koi8-r?Q?=3D22?=3DVladimir
Potapov=3D?koi8-r?Q?=3D22=3D20?=3D a =E9crit :
> I cannot add this rules with --syn, because iptables tell me error :
> bad argument '--syn'.

Strange...

root@elendil:~# iptables --version
iptables v1.2.8
root@elendil:~# iptables -A FORWARD -d 192.168.5.2/255.255.255.255 -i
eth0 -o eth1 -m state --state NEW -p tcp -m tcp --dport 53 --syn -j
ACCEPT
root@elendil:~# iptables -L FORWARD
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             192.168.5.2        state NEW
tcp dpt:domain flags:SYN,RST,ACK/SYN

Are you sure you specify TCP protocol with --syn, for --syn is only
valid for TCP. If you specify another protocol, or no protocol at all,
you'll get an error :

root@elendil:~# iptables -A FORWARD -d 192.168.5.2/255.255.255.255 -i
eth0 -o eth1 -m state --state NEW --syn -j ACCEPT
iptables v1.2.8: Unknown arg `--syn'
Try `iptables -h' or 'iptables --help' for more information.

> If write this rules without --syn argument , the iptables rules
> applying success.If I write rules with chain NEW but without --syn
> argument , are the my packet filter will be accept(or forward) new
> packet without --syn ?

If you don't specify --syn, both SYN and non SYN packets with state NEW
will be accepted.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

