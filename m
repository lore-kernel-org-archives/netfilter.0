From: "Wouter Coppens" <wouter.coppens@dedigate.com>
Subject: FW: Performance of netfilter
Date: Wed, 4 Dec 2002 14:51:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DBAC6BAF12D1D64289EC75515BD86577685953@exch101>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

Hey guys,

I can create 2 sets of rules that will give me the same result:=20

Case 1)=20
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT=20
iptables -A FORWARD -d 10.10.10.1 -p tcp -m multiport --ports
80,443,8080=20
iptables -A FORWARD -d 10.10.10.2-p tcp -m multiport --ports 80,443,8080

iptables -A FORWARD -d 10.10.10.3-p tcp -m multiport --ports 80,443,8080

iptables -A FORWARD -d 10.10.10.4-p tcp -m multiport --ports 80,443,8080

iptables -A FORWARD -d 10.10.10.5-p tcp -m multiport --ports 80,443,8080

....=20
iptables -A FORWARD -d 10.10.10.254 -p tcp -m multiport --ports
80,443,8080=20
and=20
iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp -j DNAT
--to-destination
192.168.0.1=20
iptables -t nat -A PREROUTING -d 10.10.10.2 -p tcp -j DNAT
--to-destination
192.168.0.2=20
iptables -t nat -A PREROUTING -d 10.10.10.3 -p tcp -j DNAT
--to-destination
192.168.0.3=20
...=20
iptables -t nat -A PREROUTING -d 10.10.10.254 -p tcp -j DNAT
--to-destination 192.168.0.254=20

Case 2)=20
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT=20
and=20
iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp -m multiport --dports
80
443,8080 -j DNAT --to-destination 192.168.0.1=20
iptables -t nat -A PREROUTING -d 10.10.10.2-p tcp -m multiport --dports
80
443,8080 -j DNAT --to-destination 192.168.0.2=20
iptables -t nat -A PREROUTING -d 10.10.10.3-p tcp -m multiport --dports
80
443,8080 -j DNAT --to-destination 192.168.0.3=20
...=20
iptables -t nat -A PREROUTING -d 10.10.10.254 -p tcp -m multiport
--dports
80,443,8080 -j DNAT --to-destination 192.168.0.254=20


I think both cases give the same result: only port 80, 443 and 8080 are
allowed en natted to the corresponding server.=20

I know the firewall isn't closed, but I'm only interessed in the
performance
The ip-addresses are fictional and will in the real world not follow up.

It's just to demonstrate the 2 cases.=20

Which of the 2 cases will give the best performance and why? Is one of
them
giving some overhead and why?=20

Thanks in advance,=20

Wouter


