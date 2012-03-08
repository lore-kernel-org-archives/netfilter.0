From: nullv@gmx.com
Subject: IPTable Rules... again
Date: Thu, 08 Mar 2012 10:16:48 -0500
Message-ID: <20120308151651.300950@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: users@lists.fedoraproject.org, netfilter@vger.kernel.org

Hi,

I have the following =C2=A0rules on my router/gateway:=20

*nat
:PREROUTING ACCEPT=20
:INPUT ACCEPT=20
:OUTPUT ACCEPT=20
:POSTROUTING ACCEPT=20
-A POSTROUTING -d 93.186.25.52/32 -m comment --comment "bb" -j SNAT --t=
o-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p tcp -m tcp --dport 53 -m comment --comm=
ent "domain" o eth0 -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p udp -m udp --dport 53 -m comment --comm=
ent "domain" -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p tcp -m tcp --dport 995 -m comment --com=
ment "pop3s" -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p udp -m udp --dport 995 -m comment --com=
ment "pop3s" -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p tcp -m tcp --dport 587 -m comment --com=
ment "submission" -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.0/8 -p udp -m udp --dport 587 -m comment --com=
ment "submission" -j SNAT --to-source 41.94.39.49-41.94.39.51
-A POSTROUTING -s 10.0.0.3/32 -j o eth0 -j SNAT --to-source 41.94.39.49=
-41.94.39.51
COMMIT
*filter
:INPUT ACCEPT=20
:FORWARD ACCEPT=20
:OUTPUT ACCEPT=20
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth1 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
-A FORWARD -i lo -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p tcp -m tcp --dport 53 -m comment --commen=
t "domain" -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p udp -m udp --dport 53 -m comment --commen=
t "domain" -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p tcp -m tcp --dport 995 -m comment --comme=
nt "pop3s" -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p udp -m udp --dport 995 -m comment --comme=
nt "pop3s" -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p tcp -m tcp --dport 587 -m comment --comme=
nt "submission" -j ACCEPT
-A FORWARD -i eth1 -o eth0 -p udp -m udp --dport 587 -m comment --comme=
nt "submission" -j ACCEPT
-A FORWARD -s 10.0.0.3/32 -i eth1 -o eth0 -j ACCEPT
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT

for some reason I can't make a connection to the external mail server f=
rom inside the lan. even from the 10.0.0.3 address which should be allo=
wed to do anything.
everything used to work when i used MASQUERADing but stopped once i swi=
tched to SNAT.=20
Can anybody help me? What am I doing wrong??

Thanks
