From: =?ISO-8859-1?Q?Fl=E1vio?= Brito <flavio@gral.com.br>
Subject: Newbie Question - Redirect traffic to internal Web server
Date: 17 Oct 2002 17:24:16 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034882656.2076.31.camel@pegasus.gral.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dear List

I have two servers in my net,one with a valid IP. I want to redirect all
the HTTP Traffic(external -> internal) to my internal Web server I'm
trying to learn iptables, but when I test my rules, sometimes when I try
to erase them it appears not do what I want.

Questions
1)
I use it to erase my rules. But sometimes without sucess. Bug?=20
#erasing rules=20
iptables -F
iptables -F -t nat
iptables -X
iptables -X -t nat
iptables -Z=20
iptables -Z  -t nat

2)To redirect the traffic to my internal server I must have a DNS in my
FW server?  or only redirect?


      	[FW]-eth0-> [200.179.213.245]------> Internet
	|
	|
	|eth1 ->[192.168.1.1]
	| ---------------> [Web Server ] 192.168.1.33
	|----------------> [LAN Hosts] [192.168.1.2 to 192.168.1.100]

eth0-> 200.179.213.245
eth1-> 192.168.1.1

Can someone help me with this rules?

iptables -t nat -A POSTROUTING -s 192.168.1.10/24 -d any/0 -j MASQUERADE
iptables -A INPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT
iptables -A OUTPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT
iptables -A PREROUTING -t nat -p tcp -d 0/0 --dport www -j REDIRECT
--to-port 80

Thanks=20

Fl=E1vio=20




