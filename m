From: skydive <skydive@megamail.pt>
Subject: RE: NAT Problems FTP (maybe a newbie question)
Date: Fri, 21 Nov 2003 13:06:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069420012.3fbe0dec338d4@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Cc: fneto@connecton.com.br

hi franciso:

i once had a trouble with ftp, because i was blocking -
-syn, but fortunately i could figure a way out by=20
using PASV mode on my ftp clients.

if you do not have any firewall rules i can not=20
imagine what your problem may be since, as you posted,=20
you got no firewalling rules.

i can suggest the using of masquerading instead of=20
SNAT. give it a try:

iptables -t nat -A POSTROUTING -o eth0 -s=20
192.168.0.0/24 -j MASQUERADE


skydive!


-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


