From: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Subject: Error when using iptables 1.2.6a (or another version)
Date: Tue, 4 Jun 2002 10:42:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <B5747F3DB39FD411884B00B0D07808CCB6C1FC@server10>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

[root@server11 iptables-1.2.6]# ./iptables -L
/lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter/ip_tables.o.gz:
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, including
invalid IO or IRQ parameters
modprobe: insmod
/lib/modules/2.4.18-6mdksecure/kernel/net/ipv4/netfilter/ip_tables.o.gz
failed
modprobe: insmod ip_tables failed
iptables v1.2.6: can't initialize iptables table `filter': iptables who? (do
you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
[root@server11 iptables-1.2.6]# 


This is what i get, i'm pretty new with iptables but i really would like to
use it.

Greetz!

Philippe Dhont 

