From: "Nick Vanderest" <backlandz@hotmail.com>
Subject: iptables not forwarding ports?
Date: Thu, 7 Nov 2002 00:43:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE21hvqgStMVhEUsebm0000015f@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0005_01C285F6.C0B2D670"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C285F6.C0B2D670
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I have a RH 7.3 box running iptables 1.2.5a, and it's not or seems not to be
forwarding udp ports.

A different fw/router setup (Freesco 0.2.8) was used and sucessfully
forwarded the ports I needed.

I have attached my script for those who feel inclined. ;-)

The required ports needed are 5198 and 5199, both udp to a WindowsXP box.

Thanks in advance for any help,

 Cheers,
    Nick


------=_NextPart_000_0005_01C285F6.C0B2D670
Content-Type: application/octet-stream;
	name="iptables.script"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables.script"

#!/bin/bash

IPT=3D"/sbin/iptables -v"

$IPT -F
$IPT -F -t nat

$IPT -t nat -A PREROUTING -d xx.xx.xx.xx -p udp --dport 5198 -i =
xx.xx.xx.xx -j DNAT --to-destination 192.168.1.2
$IPT -t nat -A PREROUTING -d xx.xx.xx.xx -p udp --dport 5199 -i =
xx.xx.xx.xx -j DNAT --to-destination 192.168.1.2

$IPT -A POSTROUTING -t nat -s 192.168.1.0/24 -j MASQUERADE
$IPT -P FORWARD ACCEPT

$IPT -A INPUT -s 127.0.0.1/32 -d 127.0.0.1/32 -j ACCEPT
$IPT -A INPUT -s 192.168.1.254/32 -d 0/0 -j ACCEPT
$IPT -A INPUT -s 192.168.1.2/32 -d 0/0 -j ACCEPT

$IPT -A INPUT -p icmp -j ACCEPT
$IPT -A INPUT -p tcp --syn -j ACCEPT
$IPT -A INPUT -p udp -j ACCEPT

$IPT -A FORWARD -i eth0 -j ACCEPT -m state --state =
NEW,ESTABLISHED,RELATED,INVALID


------=_NextPart_000_0005_01C285F6.C0B2D670--

