From: "Hanz F." <hanz852@yahoo.com>
Subject: IRC, ICQ ,......
Date: Fri, 27 Sep 2002 00:25:05 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927072505.23993.qmail@web40016.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hello all,
Anyone could help me plz ?
I am running a server with the following iptables
rules in order to prevent anyone to have access to the
internet if not allowed :

iptables -t nat -P POSTROUTING DROP
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to
192.168.3.133


iptbales -P INPUT DROP
iptbales -P FORWARD DROP
iptbales -P OUTPUT ACCEPT

iptables -A INPUT -p all -s client -m mac --mac-source
client's mac -j ACCEPT
iptables -A FORWARD -p all -s client -m mac
--mac-source client's mac -j ACCEPT

iptables -A INPUT -p all -s 0/0 -j DROP
iptables -A FORWARD -p all -s 0/0 -j DROP



The Problem is that no one can use IRC ,ICQ and many
other software when the firewall is running. I have
read that iptables needs modules for these protocoles,
but didn't find any !
Is there any solution to maintain the control of
internet access without stopping any of these
softwares ?
thank you

Hanz



__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

