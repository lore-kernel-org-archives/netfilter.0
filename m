From: "verito verito" <edhju_21@hotmail.com>
Subject: help me with firewall+drop by default
Date: Thu, 04 Mar 2004 20:24:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY7-F58zId5qPkIv4d00040d1e@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org




Firewall was  denied , Just for default I'm sending,  the (setting up)  tha=
t=20
is  able to  access into the web , but  I can't access into the mail server=
=20
(POP), and some web pages that requiered the  Ports (443,21,23,25,110), I=20
hope. I will clear , if there is any question just replying me , Thanks
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -t nat -A PREROUTING -t tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -A INPUT -i eth0 -s 0/0 -d 0/0 -j ACCEPT
iptables -A -i lo -s 0/0 -d 0/0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j=
=20
ACCEPT
iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A OUTPUT -j ACCEPT
https,correo,msn
USING REDHAT 8

_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
http://messenger.latam.msn.com/


