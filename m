From: =?iso-8859-2?Q?R=F3=BFa=F1ski_Sergiusz?= <rozanski@sergiusz.com>
Subject: ip/snat + port/dnat
Date: Sat, 8 May 2004 12:44:51 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0405081217430.6314-100000@dns.media-lab.com.pl>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org



> if you want to use an other port for SMTP you can try this
>
> iptables -t nat -I  FORWARD -p all --dport 25 -j DROP
> iptables -t nat -I PREROUTING -i eth0 -p tcp -s 192.168.0.1/24 --dport
> 25 -j REDIRECT --to-port  4567

> but you have to setup your email server port 4567

no, this create smtp smarthost on port 4567.

> iptables -A POSTROUTING -t nat -p tcp --dport 2525 -j SNAT --to $extIF:25

> Is that what you wanted?

no, no, this change _source_ port, I need target 'SNAT' and change
_destination_ port. PC from internal network may connect to ANY smtp
server in the world (not local smarthost), but must manualy setup
other port. Examples:

A. Internal network Outlook (192.168.0.5 via Linux 1.2.3.4):
setup smtp server: 195.205.84.133 port 2525
- Connection LAN:
  192.168.0.5:1024 -> 195.205.84.133:2525
- SNAT+DNAT/PORT Internet:
  1.2.3.4:65000 -> 195.205.84.133:25

B. Internal network WORM (192.168.0.5 via Linux 1.2.3.4):
smtp server: 195.205.84.133 port 25
- Connection LAN:
  192.168.0.5:1024 -> 195.205.84.133:25
- DROP

--=20
Sergiusz R=F3=BFa=F1ski rozanski.at.sergiusz.dot.com sq3bkn
RTG project http://gg.overwap.net
RMXF Postfix project http://rmxf.comm.pl


