From: Andreas Meyer <anmeyer@anup.de>
Subject: fetchmail from intern
Date: Mon, 17 Feb 2003 15:43:58 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217144358.CE83417C93@delta.meyer.home>
Reply-To: anmeyer@anup.de
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
To: IPtables <netfilter@lists.netfilter.org>

Hello!

Running fetchmail from the mailserver behind the firewall I have
the problem to go to the WAN.

It works as long as I stay within the LAN.

iptables -t nat -A PREROUTING -p TCP --dport 110 -m state --state
NEW,ESTABLISHED,RELATED -j DNAT --to 192.168.1.75:110

But writing

iptables -t nat -A PREROUTING -p TCP --dport 110 -m state --state
NEW,ESTABLISHED,RELATED -j DNAT --to 0.0.0.0:110

I get a
kernel: martian destination 0.0.0.0 from 192.168.1.3, dev eth0

Must I install fetchmail on the firewall? Is this the only
solution?

-- 

  Andreas Meyer

Object Class   Common Name   userPassword
posixAccount   andreas       {SSHA}hpyqObx1/BXbKFgXoqCayoGsvIgPYiVc

