From: "Wouter Coppens" <wouter.coppens@pandora.be>
Subject: Performance of netfilter
Date: Tue, 3 Dec 2002 22:43:10 +0100 (Romance Standard Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DED256E.000009.01744@yoda>
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I can create to sets of rules that will give me the same result:=0D
=0D
Case 1)=0D
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT=0D
iptables -A FORWARD -d 10.10.10.1 -p tcp -m multiport --ports 80,443,8080=
=0D
iptables -A FORWARD -d 10.10.10.2-p tcp -m multiport --ports 80,443,8080=0D
iptables -A FORWARD -d 10.10.10.3-p tcp -m multiport --ports 80,443,8080=0D
iptables -A FORWARD -d 10.10.10.4-p tcp -m multiport --ports 80,443,8080=0D
iptables -A FORWARD -d 10.10.10.5-p tcp -m multiport --ports 80,443,8080=0D
=2E...=0D
iptables -A FORWARD -d 10.10.10.254 -p tcp -m multiport --ports 80,443,80=
80=0D
and=0D
iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp -j DNAT --to-destinati=
on
192.168.0.1=0D
iptables -t nat -A PREROUTING -d 10.10.10.2 -p tcp -j DNAT --to-destinati=
on
192.168.0.2=0D
iptables -t nat -A PREROUTING -d 10.10.10.3 -p tcp -j DNAT --to-destinati=
on
192.168.0.3=0D
=2E..=0D
iptables -t nat -A PREROUTING -d 10.10.10.254 -p tcp -j DNAT
--to-destination 192.168.0.254=0D
=0D
Case 2)=0D
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT=0D
and =0D
iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp -m multiport --dports =
80
443,8080 -j DNAT --to-destination 192.168.0.1=0D
iptables -t nat -A PREROUTING -d 10.10.10.2-p tcp -m multiport --dports 8=
0
443,8080 -j DNAT --to-destination 192.168.0.2=0D
iptables -t nat -A PREROUTING -d 10.10.10.3-p tcp -m multiport --dports 8=
0
443,8080 -j DNAT --to-destination 192.168.0.3=0D
=2E..=0D
iptables -t nat -A PREROUTING -d 10.10.10.254 -p tcp -m multiport --dport=
s
80,443,8080 -j DNAT --to-destination 192.168.0.254=0D
=0D
=0D
I think both cases give the same result: only port 80, 443 and 8080 are
allowed en natted to the corresponding server.=0D
=0D
I know the firewall isn't closed, but I'm only interessed in the performa=
nce
 The ip-addresses are fictional and will in the real world not follow up.=
=0D
It's just to demonstrate the 2 cases.=0D
=0D
Which of the 2 cases will give the best performance and why? Is one of th=
em
giving some overhead and why?=0D
=0D
Thanks in advance,=0D
=0D
Wouter


