From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: "-m state -state NEW" or "--tcp-flags ALL SYN" for tcp?
Date: Wed, 29 Oct 2003 20:39:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031029203922.3d8f47cf.netfilter@schuetter.org>
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

Hello

Is it better to use "-m state -state NEW" or to use "--tcp-flags ALL
SYN" for tcp packets. There are also the lines
iptables -A INPUT/FORWARD -m state --state INVALID -j DROP
iptables -A INPUT/FORWARD/OUTPUT -m state --state ESTABLISHED,RELATED -j AC=
CEPT
in the firewall script.

A tcp packet without a SYN flag can never be in state NEW (according to
my tests). Instead iptables discovers this packet as garbage and flags
it with INVALID.

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


