From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 10:49:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008f01c47fb2$6af27f80$a900a8c0@cybergeneration.com>
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

Hi Everyone

I'm currently trying to ddo the following :

- we have a simple NAT running iptables 1.2.9
with about 20 hosts behind

- we have an outside SQL Server

- when ppl use their SQL Server clients, I see lots
of TCP SYN on port 445 of this SQL Server


What I'd like to do is something like :
$IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --dport 445 --dst sql.se.rv.er -j
REJECT --reject-with tcp-reset

My problem :
Packet seems OK (iptables change source ip and port) and is
TCP RST, but it is sent to the external interface, and my LAN
hosts do not get the reply and must wait for a timeout to occur
(since another firewall protects the SQL Server and drops TCP 445)

Is there any way to force an interface for the REJECT rule ?

Is there any configuration that could cause this to happen ?

Thanks in advance

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau


