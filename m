From: "Simpson, Doug" <dsimpson@friedmancorp.com>
Subject: please help - IPSEC & POP3
Date: Fri, 21 Feb 2003 15:58:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20ED00AA0BC135449469D6EF0AE79C97203F25@ozlan.fcdomain.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I have a Freeswan gateway setup which is also my firewall (IPTABLES).  The
people on the LAN network (192.168.1.0) can get to the POP3 server out on
the Public internet.  But when I connect a client via the IPSEC (they are
static 10.2.67.0/8) tunnel then
I cannot get POP3 mail.  I can send mail.
This is what I have in my rc.firewall script to allow my LAN clients to get
their POP3 - 
iptables -t nat -A POSTROUTING -p tcp --dport 110 -o eth0 -s 192.168.1.0/24
-j SNAT --to $external_ip

I tried adding this line for those coming in via VPN/ipsec
iptables -t nat -A POSTROUTING -p tcp --dport 110 -o eth0 -s 10.2.67.0/8  -j
SNAT --to $external_ip

This last line did not change anything.  I still cannot get mail when vpned
in.

Doug

