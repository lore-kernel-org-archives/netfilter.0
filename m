From: "Thomas Hilgert" <Thomas.Hilgert@hilgert.de>
Subject: snat dnat question
Date: Sat, 6 Jul 2002 00:57:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <8C14C590A51EB74285ADCA3DAD1A9DD705C282@hilgert-srv1.internal.hilgert.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi guys,

I have some question regarding snat / dnat witch iptables. Here is what
I do
1. setup a packetfilter linuxbox with 3 interfaces.
   ETH0: Connected to the internet (public ip)
   ETH1: DMZ with stmp server 10.2.0.0/24
   ETH2: Internal LAN with ip address 10.1.0.0/24

   Snat all to the official ip address
   Dnat all incoming to the smtp server
See the and of mail for a iptables -t nat -L
And now the question :-)=20
If I do a telnet to mail.mailwatch.com 25 (simulating smtp) is all I get
SYN_SENT and that is no connection from the DMZ. The packet filter has
no problem to establish a connection.=20
PLEASE explain me why

Thanks in advance

Thomas Hilgert
-----------------
Here are the rules to play:=20
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  anywhere             anywhere           to:10.2.0.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere
to:212.23.129.186

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@gw1 iproute2]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  anywhere             anywhere           to:10.2.0.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere
to:212.23.129.186

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



