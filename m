From: Nilesh <niluforalways@yahoo.com>
Subject: FORWARD RULE -- please help
Date: Mon, 8 Mar 2004 23:54:04 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309075404.92394.qmail@web13206.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello=20

Can anyone please help me regarding Packet Forwarding=20
The condition is=20
203.129.224.149 is my firewall machine running
IPTABLES and 192.168.0.22 is my local machine on 2090
port service is running

and another client side is=20

202.129.227.3 is his firewall IP and 192.168.1.25 is
his local machine where on 2090 port services is
running=20

I want to communicate this both internal
machines(192.168.0.22 and 192.168.1.25) through
firewall=20

They are already allowd connection from my IP and Port
in his firewall machine but I want to allow him at my
side =20

The flow is like=20

192.168.0.22:2090
--->203.129.224.149--->203.129.227.3-->192.168.1.25:2090
now it will take acknowledment and come back to source
the process is reverse
192.168.1.25:2090-->203.129.227.3--->203.129.224.149:2090-->192.168.0.22:20=
90

could any one please tell me the rule.

Thanks=20


__________________________________
Do you Yahoo!?
Yahoo! Search - Find what you=92re looking for faster
http://search.yahoo.com

