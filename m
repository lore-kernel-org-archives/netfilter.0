From: =?iso-8859-2?Q?czezz?= <czezz@o2.pl>
Subject: PRERUTING or POSTROUTING
Date: Sat, 04 Feb 2006 17:19:12 +0100
Message-ID: <20060204161912.66BA3542AE@rekin17.go2.pl>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; 
To: netfilter@lists.netfilter.org

Here is an description what I want do do:

Server1:=20
-eth0 10.3.1.4=20
-ppp0 x.x.x.x=20

ServerPROXY:=20
-etho 10.3.1.8=20
-ppp0 y.y.y.y=20


Server1 has set FORWARD in iptables for Telnet i FTP services ( so=20
users from LAN are able to connect those services in the internet )=20
ServerPROXY has Squid service (PROXY for http only)=20

All of the hosts in LAN must have set gaytway 10.3.1.4 (eth0=20
Server1)=20

What should I do to redirect all connection from LAN on port 80  to=20
serverPROXY 10.3.1.8:8080 ?

I heard that POSTROUTING or PREROUTING rule need to be used
Any suggestions ?
Someone told me that it might be necessery to compile some=20
additional options in kernel (my current kernel is 2.4.31 - regular=20
kernel from Slackware 10.2 )

Any ideas how to slove that ?




