From: "Daniel Boy" <dabohh@gmx.de>
Subject: owner module
Date: Mon, 9 Aug 2004 18:07:13 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20906.1092067633@www24.gmx.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I try to implement the command "--cmd-owner" for some
services in the "filter" table.

When I do so the corresponding services do not terminate
correctly any more.

For example I opened an SSH connection and terminated
it after the successful login with the "logout" command.
Afterwards on the servers side "ps" and "netstat" says
the connection is still alive. On the client side
"netstat" says "FIN ACK", "LAST ACK", "CLOSING" and I get
some log entries in "messages".


The necessary iptables-rules at client-side:

iptables -A OUTPUT -m owner --cmd-owner "ssh" -p tcp -s CLIENT -d SERVER
--sport 1024:65535 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s SERVER -d CLIENT --sport 22 --dport 1024:65535
-j ACCEPT


Some of the drop-log entries at client-side:

Aug  9 15:29:54 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DSER=
VER
LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D129 DF PROTO=3DTCP SPT=3D3344=
2 DPT=3D22
WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0=20
Aug  9 15:29:55 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DSER=
VER
LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D130 DF PROTO=3DTCP SPT=3D3344=
2 DPT=3D22
WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0=20
Aug  9 15:29:55 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DSER=
VER
LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D131 DF PROTO=3DTCP SPT=3D3344=
2 DPT=3D22
WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0


So I would say the boolean #--cmd-owner "ssh"# is immediately
invalid. So the client cannot inform the server about the closing.

Does anybody have an idea to let only the missing packets passing?

Kind regards
Daniel

--=20
NEU: WLAN-Router f=FCr 0,- EUR* - auch f=FCr DSL-Wechsler!
GMX DSL =3D superg=FCnstig & kabellos http://www.gmx.net/de/go/dsl


