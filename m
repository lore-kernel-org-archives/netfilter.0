From: Dworf <root@dworf.com>
Subject: high load preformance firewall
Date: Sat, 28 Sep 2002 21:00:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209282100.33610.root@dworf.com>
Reply-To: root@dworf.com
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have a little problem with my firewall at the firm... The firm is a big=
=20
target for users doing an syn flood. The firewall is connected to the ISP=
=20
with an 155Mbit ATM connection. The ISP is doing an total deny on icmp on=
=20
incomming connections so we get rid of ddos. So the only attacks comming =
to=20
the server are syn floods. The servers behind the firewall are running so=
me=20
special made applications that need constant tcp connection to outside wo=
rld=20
to other firms. So when the synflood attack is comming in the connections=
=20
drop after a while and the firewall runs out of resources. The firewall h=
as=20
an mrtg installed and it shows that it doesnt use up all of th 155Mbit on=
ly=20
lets say 60% when there is an attack. And the system drops the active=20
connections couse the timeout is expired of the tcl connection.

This is the syn protection i have:

----
iptables -N syn-flood
iptables -A INPUT -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 2/s --limit-burst 4 -j RETURN
iptables -A syn-flood -j DROP

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
----

First the firewall droped after about 10minutes of attack then i added th=
is=20
settings....:
--
/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
/bin/echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
/bin/echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
/bin/echo "0" > /proc/sys/net/ipv4/ip_forward

/bin/echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter
/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
/bin/echo "0" > /proc/sys/net/ipv4/tcp_timestamps
/bin/echo "15" > /proc/sys/net/ipv4/tcp_fin_timeout
/bin/echo "1600" > /proc/sys/net/ipv4/tcp_keepalive_time
/bin/echo "0" > /proc/sys/net/ipv4/tcp_window_scaling
/bin/echo "0" > /proc/sys/net/ipv4/tcp_sack
--

after this it survives about 20 - 30minutes but not more.

Can someone help me a little more?!

Thank you

David

