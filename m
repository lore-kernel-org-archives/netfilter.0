From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: delay
Date: Fri, 31 Oct 2003 16:56:33 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067626591.1451.21.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi guys

Just a question. I have a firewall w/ 3 NIC as below:

			Internet ADSL
			|
			|eth1 200.200.200.44/26
		_________________________	
		|	Firewall	|	DMZ
		| iptables 1.2.8	|_eth2 192.168.1.1/24______EMail
		|_______________________|			192.168.1.3	
			|
			| eth0 10.0.0.1/24
			LAN


Firewall : Debian 2.4.22 + iptables 1.2.8


route:
200.200.200.0/26 dev eth1  proto kernel  scope link  src 200.200.200.44
10.0.0.0/24 dev eth0  proto kernel  scope link  src 10.0.0.1
192.168.1.0/24 dev eth2  proto kernel  scope link  src 192.168.1.1
default via 200.200.200.1 dev eth1

rules:

a) iptables -A PREROUTING -d 200.200.200.1 -p tcp -m multiport --dports
smtp,pop3,imap2,webcache -j DNAT --to-destination 192.168.1.3

b) iptables -A POSTROUTING -o eth1 -j SNAT --to-source 200.200.200.1

c) iptables -A POSTROUTING -o eth2 -j SNAT --to-source 192.168.1.1


What happens:

- all desktops ( M$windows) access webmail and email w/ no problems, but
if I insert rule c) above it causes a delay when any desktop hit
get/post e-mail in Outlook and it takes +- 40 seconds to "connenct".

I know that must be a silly misconfiguration of something but after 1
week searching the problem I can't imagine what's wrong.

Can anybody help me please

Thanks in advance






