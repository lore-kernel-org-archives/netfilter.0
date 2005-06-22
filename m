From: Mohamed Nassih <nassih50@yahoo.com>
Subject: Script verification
Date: Tue, 21 Jun 2005 21:11:15 -0700 (PDT)
Message-ID: <20050622041115.96034.qmail@web30615.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

I'am a new be..
=20
I want to configure a firewall between my local network and internet, I wan=
t to permet 123.45.67.2 to see a http web server.
I write this script, please correct to me if there is some error. is this e=
nough?
=20
Thanks
=20
echo 1 > /proc/sys/net /ipv4/ip_forward
IPTABLES -F INPUT=20
IPTABLES -F OUTPUT=20
IPTABLES -F FORWARD
IPTABLES -P INPUT DROP=20
IPTABLES -P OUTPUT DROP=20
IPTABLES -P FORWARD DROP=20
Iptables =96A INPUT  -i lo =96j ACCEPT
Iptables =96A OUTPUT  -o lo =96j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth1 =96o eth0 -p tcp -d 123.45.67.2 --destination-p=
ort 80=20

=96m state --state NEW,ESTABLISHED  -j ACCEPT

 iptables -A FORWARD =96p tcp -i eth0 =96o eth0 =96-source-port 80 =96m sta=
te --state ESTABLISHED -j ACCEPT=20



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20
