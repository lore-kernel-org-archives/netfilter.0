From: Patrick Petermair <captain.nuke@gmx.at>
Subject: Rule question
Date: Sat, 22 Jun 2002 09:35:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206220935.12908.captain.nuke@gmx.at>
Reply-To: captain.nuke@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi!

I've read the following example script for a linux box with masquerading =
and=20
some firewall rules:
http://www.ecst.csuchico.edu/~dranch/LINUX/ipmasq/examples/rc.firewall-2.=
4-stronger

So far I think I understand everything except this line:
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT

How can an OUTPUT of the internal interface have the external IP address =
as=20
source IP ?? And why would it be accepted?
As far as I understand it, the masquerading and stuff is all done in the=20
FORWARD chain. I can't think of an example where a packet originating fro=
m=20
the internal interface of my firewall can have the external IP as source.

Regards
Patrick


