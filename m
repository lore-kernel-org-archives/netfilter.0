From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: DNAT probs
Date: Mon, 10 Feb 2003 14:12:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302101412.26834.roy@karlsbakk.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi all

I've got this network as sketched below...

                  internal net
                      |
                      |
                +-----+----+
+--------+      |          |
| router +------+ Firewall |------ dmz
+--------+      |          |
                +----------+


The computers on the dmz and the internal net have all unofficial address=
es=20
with DNATing into the DMZ for those that should be available from the=20
outside.

The problem occurs when a computer on the dmz (192.168.x.y) tries to addr=
ess=20
another computer there by its official address (resolved from DNS). The=20
firewall (netfilter/iptables) doesn't seem to be able to do the dmz ->=20
netfilter -> dmz NATing.

Any ideas?

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


