From: "Andy Wood" <andy@digitalindustry.org>
Subject: RE: Local rule for Port Forward
Date: Sat, 26 Apr 2003 13:35:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030426173540.JVCG1380.lakecmmtao03.coxmail.com@vaio>
References: <002201c30c0a$c106cb00$0400a8c0@bradmorgan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c30c0a$c106cb00$0400a8c0@bradmorgan>
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
To: 'Netfilter List' <netfilter@lists.samba.org>
Cc: pnelson@neatech.com

	...perhaps it is self-governing.  Best practices would dictate that
instant messaging on a firewall is a bad idea.  The idea for a FW is =
minimal
packages, no permanent compilers, certainly not X and all of its =
user-ware.
It's remote-code-execution waitin' to happen.

	Question, why do you SNAT external Jabber traffic to your FW's
internal IP?  In doing that your server sees the traffic as originating =
from
$InIP, vice its true source.


>  I'm doing port forwarding to a server that runs jabber and everything =
=20
> works fine, I did notice that if I bring up a jabber client on the =20
> firewall itself I do not get connected.  While this isn't really =20
> needed... I don't totally understand why it doesn't work.  Being =20
> inquisitive... well I just gots to know why!  Can anyone shed some =20
> light?
>=20
>  My rules for the jabber port forward are:
>=20
>  iptables -A FORWARD
>           -i $ExIF -d $JabIP -p tcp --dport $JabPort
>           -j ACCEPT
>  iptables -A PREROUTING
>           -t nat -d $ExIP -p tcp --dport $JabPort
>           -j DNAT --to-destination $JabIP  iptables -A POSTROUTING
>           -t nat -d $JabIP -p tcp --dport $JabPort
>           -j SNAT --to-source $InIP


