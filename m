From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: kazaa rulset
Date: Tue, 29 Jul 2003 07:51:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BFE8@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: juanca <juanca@sat.com.py>, netfilter@lists.netfilter.org

-m string --string

you have to specify which module to use "-m string" and then it's =
parameter "--string findthis"

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: juanca [mailto:juanca@sat.com.py]
Sent: Tuesday, July 29, 2003 7:42 AM
To: netfilter@lists.netfilter.org
Subject: kazaa rulset=20



iptables -A INPUT -s kazaa.com -p tcp -j DROP
iptables -A INPUT -d kazaa.com -p tcp -j DROP
iptables -A INPUT -s kazaa.com -p udp -j DROP
iptables -A INPUT -d kazaa.com -p udp -j DROP
iptables -A FORWARD -s 0/0 -p tcp --dport 1214 -j REJECT
iptables -A FORWARD -d 213.248.112.0/24 -j REJECT
iptables -A FORWARD -d 206.142.53.0/24 -j REJECT
iptables -A OUTPUT -p tcp --dport 1214 -j DROP
iptables -A OUTPUT -p udp --dport 1214 -j DROP
iptables -A INPUT -p tcp --sport 1214 -j DROP
iptables -A INPUT -p udp --sport 1214 -j DROP
iptables -A FORWARD -p tcp --dport 1214 -j DROP
iptables -A FORWARD -p udp --dport 1214 -j DROP
iptables -A OUTPUT -p tcp --dport 8000:8999 -j DROP
iptables -A OUTPUT -p udp --dport 8000:8999 -j DROP
iptables -A OUTPUT -p tcp -d 66.80.62.34 -j DROP
iptables -A OUTPUT -p tcp -d 205.188.245.120 -j DROP
iptables -A OUTPUT -p tcp -d 64.12.168.244 -j DROP
iptables -A OUTPUT -p tcp -d 66.218.70.39 -j DROP
iptables -A OUTPUT -p tcp -d 64.245.54.0/24 -j DROP
iptables -A FORWARD -d a64-124-29-52.deploy.akamaitechnologies.com -j=20
REJECT
iptables -A FORWARD -d 64.124.29.52 -j REJECT
iptables -A FORWARD -d 64.230.160.147 -j REJECT
iptables -A FORWARD -d 68.83.112.75 -j REJECT
iptables -A FORWARD -d 68.60.210.234 -j REJECT
iptables -A FORWARD -d 207.112.54.21 -j REJECT
iptables -A FORWARD -d 64.230.160.147 -j REJECT
iptables -A FORWARD -d 61.218.91.171 -j REJECT
iptables -A FORWARD -d 61.218.91.171 -j REJECT
iptables -A FORWARD -p tcp --dport 6346:6347 -j DROP
iptables -A FORWARD -p udp --dport 6346:6347 -j DROP
iptables -A FORWARD -p tcp --dport 4660:4666 -j DROP
iptables -A FORWARD -p udp --dport 4660:4666 -j DROP
iptables -I FORWARD -i eth0 -p tcp -m string --string "KazaaClient" -j=20
REJECT --reject-with tcp-reset
iptables -I FORWARD -p tcp -m string --string "KazaaClient" -j REJECT=20
--reject-with tcp-reset
iptables -I FORWARD -p tcp -m string --string "KazaaClient" -j REJECT=20
--reject-with tcp-reset
iptables -A FORWARD -d a342.g.akamai.net -p tcp tcp -j DROP
iptables -A FORWARD -d a342.g.akamai.net -p tcp udp -j DROP
iptables -A FORWARD -d 63.208.194.47 -j REJECT
iptables -A FORWARD -d 63.208.194.6 -j REJECT
iptables -A FORWARD -d 206.142.53.0/24 -j REJECT
iptables -A FORWARD -d 213.248.112.0/24 -j REJECT
iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j REJECT=20
--reject-with tcp-reset
iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j REJECT=20
--reject-with tcp-reset
iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j REJECT=20
--reject-with tcp-reset
iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j REJECT=20
--reject-with tcp-reset
iptables -A FORWARD -m string --string "Kazaa" -j REJECT --reject-with=20
tcp-reset
iptables -t mangle -A PREROUTING -p tcp -m --string "Kazaa" -j DROP
iptables -A FORWARD -m state --state NEW,INVALID -j REJECT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp -m state --state NEW -m string --string=20
"Kazaa" -j DROP

this is my rulset but get this message when run the script what`s wrong?
iptables: No chain/target/match by that name
iptables: No chain/target/match by that name
Bad argument `tcp'
Try `iptables -h' or 'iptables --help' for more information.
Bad argument `udp'
Try `iptables -h' or 'iptables --help' for more information.
iptables: No chain/target/match by that name
iptables: No chain/target/match by that name
iptables: No chain/target/match by that name
iptables: No chain/target/match by that name
iptables: No chain/target/match by that name
iptables v1.2.6a: Couldn't load match=20
`--string':/lib/iptables/libipt_--string.so: cannot open shared object=20
file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.
iptables: No chain/target/match by that name



